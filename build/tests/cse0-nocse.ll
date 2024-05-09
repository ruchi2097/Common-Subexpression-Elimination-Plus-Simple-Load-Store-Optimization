; ModuleID = 'cse0-nocse.bc'
source_filename = "cse0"

define void @cse0(ptr %0, ptr %1, ptr %2, i32 %3, i64 %4, i8 %5) {
BB:
  %B = lshr i32 %3, %3
  %6 = lshr i32 %3, %3
  %7 = lshr i32 %3, %3
  %8 = lshr i32 %3, %3
  %9 = lshr i32 %3, %3
  %10 = lshr i32 %3, %3
  ret void
}
