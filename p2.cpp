#include <fstream>
#include <memory>
#include <algorithm>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <iostream>
#include "llvm-c/Core.h"

#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/Bitcode/BitcodeReader.h"
#include "llvm/ADT/StringSet.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/LinkAllPasses.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Analysis/InstructionSimplify.h"
#include "llvm/IR/Dominators.h"
using namespace llvm;
using namespace std;
static void CommonSubexpressionElimination(Module &);
static bool checkIfValidCSE();
static void summarize(Module *M);
static void print_csv_file(std::string outputfile);

static cl::opt<std::string>
    InputFilename(cl::Positional, cl::desc("<input bitcode>"), cl::Required, cl::init("-"));

static cl::opt<std::string>
    OutputFilename(cl::Positional, cl::desc("<output bitcode>"), cl::Required, cl::init("out.bc"));

static cl::opt<bool>
    Mem2Reg("mem2reg",
            cl::desc("Perform memory to register promotion before CSE."),
            cl::init(false));

static cl::opt<bool>
    NoCSE("no-cse",
          cl::desc("Do not perform CSE Optimization."),
          cl::init(false));

static cl::opt<bool>
    Verbose("verbose",
            cl::desc("Verbose stats."),
            cl::init(false));

static cl::opt<bool>
    NoCheck("no",
            cl::desc("Do not check for valid IR."),
            cl::init(false));

int main(int argc, char **argv)
{
  // Parse command line arguments
  cl::ParseCommandLineOptions(argc, argv, "llvm system compiler\n");

  // Handle creating output files and shutting down properly
  llvm_shutdown_obj Y; // Call llvm_shutdown() on exit.
  LLVMContext Context;

  // LLVM idiom for constructing output file.
  std::unique_ptr<ToolOutputFile> Out;
  std::string ErrorInfo;
  std::error_code EC;
  Out.reset(new ToolOutputFile(OutputFilename.c_str(), EC,
                               sys::fs::OF_None));

  EnableStatistics();

  // Read in module
  SMDiagnostic Err;
  std::unique_ptr<Module> M;
  M = parseIRFile(InputFilename, Err, Context);

  // If errors, fail
  if (M.get() == 0)
  {
    Err.print(argv[0], errs());
    return 1;
  }

  // If requested, do some early optimizations
  if (Mem2Reg)
  {
    legacy::PassManager Passes;
    Passes.add(createPromoteMemoryToRegisterPass());
    Passes.run(*M.get());
  }

  if (!NoCSE)
  {
    CommonSubexpressionElimination(*M.get());
  }

  // Collect statistics on Module
  summarize(M.get());
  print_csv_file(OutputFilename);

  if (Verbose)
    PrintStatistics(errs());

  // Verify integrity of Module, do this by default
  if (!NoCheck)
  {
    legacy::PassManager Passes;
    Passes.add(createVerifierPass());
    Passes.run(*M.get());
  }

  // Write final bitcode
  WriteBitcodeToFile(*M.get(), Out->os());
  Out->keep();

  return 0;
}

static llvm::Statistic nFunctions = {"", "Functions", "number of functions"};
static llvm::Statistic nInstructions = {"", "Instructions", "number of instructions"};
static llvm::Statistic nLoads = {"", "Loads", "number of loads"};
static llvm::Statistic nStores = {"", "Stores", "number of stores"};

static void summarize(Module *M)
{
  for (auto i = M->begin(); i != M->end(); i++)
  {
    if (i->begin() != i->end())
    {
      nFunctions++;
    }

    for (auto j = i->begin(); j != i->end(); j++)
    {
      for (auto k = j->begin(); k != j->end(); k++)
      {
        Instruction &I = *k;
        nInstructions++;
        if (isa<LoadInst>(&I))
        {
          nLoads++;
        }
        else if (isa<StoreInst>(&I))
        {
          nStores++;
        }
      }
    }
  }
}

static void print_csv_file(std::string outputfile)
{
  std::ofstream stats(outputfile + ".stats");
  auto a = GetStatistics();
  for (auto p : a)
  {
    stats << p.first.str() << "," << p.second << std::endl;
  }
  stats.close();
}

static llvm::Statistic CSEDead = {"", "CSEDead", "CSE found dead instructions"};
static llvm::Statistic CSEElim = {"", "CSEElim", "CSE redundant instructions"};
static llvm::Statistic CSESimplify = {"", "CSESimplify", "CSE simplified instructions"};
static llvm::Statistic CSELdElim = {"", "CSELdElim", "CSE redundant loads"};
static llvm::Statistic CSEStore2Load = {"", "CSEStore2Load", "CSE forwarded store to load"};
static llvm::Statistic CSEStElim = {"", "CSEStElim", "CSE redundant stores"};

// It checks if instruction is safe to remove for cse - without any side effeects.
bool isCandidateForCSE(Instruction &I)
{
  if (isa<StoreInst>(I) ||
      isa<CallInst>(I) ||
      isa<ReturnInst>(I) ||
      isa<PHINode>(I) ||
      isa<AllocaInst>(I) ||
      isa<LoadInst>(I) ||
      isa<BranchInst>(I) ||
      isa<ExtractValueInst>(I))
    return false;
  return true;
}

// Optimization 2
bool CheckRedundantLoad(Instruction &L, Instruction &R)
{
  LoadInst *Li = dyn_cast<LoadInst>(&L);
  LoadInst *Ri = dyn_cast<LoadInst>(&R);
  bool isLoadRedundant = false;
  if (Li && Ri)
  {
    isLoadRedundant = (!Ri->isVolatile()) &&
                      (Li->getOperand(0) == Ri->getOperand(0)) &&
                      (Li->getType() == Ri->getType());
  }
  return isLoadRedundant;
}

// Optimization 3
bool CheckRedundantStore(Instruction &L, Instruction &R)
{
  StoreInst *Li = dyn_cast<StoreInst>(&L);
  StoreInst *Ri = dyn_cast<StoreInst>(&R);
  bool isStoreRedundant = false;
  if (Li && Ri)
  {
    isStoreRedundant = (!Li->isVolatile()) &&
                       (Li->getOperand(1) == Ri->getOperand(1)) &&
                       (Li->getOperand(0)->getType() == Ri->getOperand(0)->getType());
  }
  return isStoreRedundant;
}

bool CheckLoadAfterStore(Instruction &S, Instruction &R)
{
  StoreInst *Si = dyn_cast<StoreInst>(&S);
  LoadInst *Ri = dyn_cast<LoadInst>(&R);
  bool isLoadAfterStore = false;
  if (Si && Ri)
  {
    isLoadAfterStore = (!Ri->isVolatile()) &&
                       (Si->getOperand(1) == Ri->getOperand(0)) &&
                       (Si->getOperand(0)->getType() == Ri->getType());
  }
  return isLoadAfterStore;
}

// Optimization 0 - Dead Code Elimination
bool isDead(Instruction &I)
{

  int opcode = I.getOpcode();
  bool isDCECandidate = false;
  switch (opcode)
  {
  case Instruction::Add:
  case Instruction::FNeg:
  case Instruction::FAdd:
  case Instruction::Sub:
  case Instruction::FSub:
  case Instruction::Mul:
  case Instruction::FMul:
  case Instruction::UDiv:
  case Instruction::SDiv:
  case Instruction::FDiv:
  case Instruction::URem:
  case Instruction::SRem:
  case Instruction::FRem:
  case Instruction::Shl:
  case Instruction::LShr:
  case Instruction::AShr:
  case Instruction::And:
  case Instruction::Or:
  case Instruction::Xor:
  case Instruction::GetElementPtr:
  case Instruction::Trunc:
  case Instruction::ZExt:
  case Instruction::SExt:
  case Instruction::FPToUI:
  case Instruction::FPToSI:
  case Instruction::UIToFP:
  case Instruction::SIToFP:
  case Instruction::FPTrunc:
  case Instruction::FPExt:
  case Instruction::PtrToInt:
  case Instruction::IntToPtr:
  case Instruction::BitCast:
  case Instruction::AddrSpaceCast:
  case Instruction::ICmp:
  case Instruction::FCmp:
  case Instruction::ExtractElement:
  case Instruction::InsertElement:
  case Instruction::ShuffleVector:
  case Instruction::ExtractValue:
  case Instruction::InsertValue:
  case Instruction::Alloca:
  case Instruction::PHI:
  case Instruction::Select:

    if (I.use_begin() == I.use_end())
    {
      isDCECandidate = true;
    }
    break;

  case Instruction::Load:
  {
    LoadInst *li = dyn_cast<LoadInst>(&I);
    if (li && li->isVolatile())
      isDCECandidate = false;
    if (I.use_begin() == I.use_end())
      isDCECandidate = true;
    break;
  }

  default:
    // any other opcode fails
    isDCECandidate = false;
  }
  return isDCECandidate;
}

// Matches opcode, type, number of operands and each operand for common sub expression
bool CheckIfCSEMatched(Instruction &inst1, Instruction &inst2)
{
  bool isCSE = inst1.isIdenticalTo(&inst2);
  return isCSE;
}

// Global Simplify Instructions - i.e across all the blocks
void RunGlobalCSE(Function &F, Instruction &i, BasicBlock *bb)
{
  DominatorTreeBase<BasicBlock, false> *DT;
  DT = new DominatorTreeBase<BasicBlock, false>();     // make a new one
  DT->recalculate(F);                                  // calculate for a new function F
  DomTreeNodeBase<BasicBlock> *Node = DT->getNode(bb); // get node for BB
  if (!Node)
    return;
  for (DomTreeNodeBase<BasicBlock> **child = Node->begin(); child != Node->end(); child++)
  {
    BasicBlock *cc = (*child)->getBlock();
    for (BasicBlock::iterator l = cc->begin(); l != cc->end(); l++)
    {
      Instruction &j = *l;
      if (CheckIfCSEMatched(i, j))
      {
        j.replaceAllUsesWith(&i);
        l = j.eraseFromParent();
        l--;
        CSEElim++;
        continue;
      }
    }
  }
}

static void CommonSubexpressionElimination(Module &M)
{
  // Looping over the functions

  for (Module::iterator i = M.begin(); i != M.end(); i++)
  {
    Function &F = *i;
    // or get a pointer to the function:

    // Looping over all the basic blocks in the function, F
    for (Function::iterator j = F.begin(); j != F.end(); j++)
    {
      BasicBlock *bb = &*j;

      // Looping over all instructions in a basic block
      for (BasicBlock::iterator k = bb->begin(); k != bb->end(); k++)
      {
        Instruction &i = *k;

        // Optimization 0 - Dead Code Elimination
        if (isDead(i))
        {
          k = i.eraseFromParent();
          k--;
          CSEDead++;
          continue;
        }

        // Optimization 1 - Simplifying Instructions by constant folding
        Value *val = simplifyInstruction(&i, M.getDataLayout());
        if (val)
        {
          i.replaceAllUsesWith(val);
          CSESimplify++;
          k = i.eraseFromParent();
          k--;
          continue;
        }

        // Common Subexpression Elimination Optimization
        // Run cse in the same block
        if (isCandidateForCSE(i))
        {
          for (BasicBlock::iterator l = k; l != bb->end(); l++)
          {
            Instruction &j = *l;
            if (&i != &j && CheckIfCSEMatched(i, j))
            {
              j.replaceAllUsesWith(&i);
              l = j.eraseFromParent();
              l--;
              CSEElim++;
              continue;
            }
          }
          // Run global Cse - In all child blocks depending upon dominator tree
          RunGlobalCSE(F, i, bb);
        }

        // Optimzation 2 - Eliminate Redundant Load
        if (isa<LoadInst>(i))
        {
          for (BasicBlock::iterator l = std::next(k); l != bb->end(); l++)
          {
            Instruction &j = *l;
            if (CheckRedundantLoad(i, j))
            {
              j.replaceAllUsesWith(&i);
              l = j.eraseFromParent();
              l--;
              CSELdElim++;
              continue;
            }
            else if ((isa<StoreInst>(j) || isa<CallInst>(j)))
              break;
          }
        }

        // Optimization 3 - Eliminate Redundant Stores and Loads
        if (isa<StoreInst>(i))
        {
          for (BasicBlock::iterator l = std::next(k); l != bb->end(); l++)
          {
            Instruction &j = *l;
            if (CheckLoadAfterStore(i, j))
            {
              StoreInst *S = dyn_cast<StoreInst>(&i);
              j.replaceAllUsesWith(S->getOperand(0));
              l = j.eraseFromParent();
              l--;
              CSEStore2Load++;
              continue;
            }
            else if (CheckRedundantStore(i, j))
            {
              k = i.eraseFromParent();
              k--;
              CSEStElim++;
              break;
            }
            else if ((isa<LoadInst>(j)) ||
                     (isa<StoreInst>(j)) || isa<CallInst>(j))
              break;
          }
        }
      }
    }
  }
}