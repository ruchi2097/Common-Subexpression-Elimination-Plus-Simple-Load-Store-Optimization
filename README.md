Objectives-

Implement code that performs Common Subexpression Elimination.
Leverage LLVM to perform instruction simplification and dead code elimination.
Perform a simple load and store optimization during the CSE traversal to find additional redundancy while preserving the order of memory operations.

Order of optimizations are as follows-
Optimization 0: Eliminate dead instructions
Optimization 1: Simplify Instructions
Common Subexpression Elimination
Optimization 2: Eliminate Redundant Loads
Optimization 3: Eliminate Redundant Stores (and Loads)

