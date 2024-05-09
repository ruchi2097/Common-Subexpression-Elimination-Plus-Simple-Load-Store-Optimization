; ModuleID = 'cse3-out.bc'
source_filename = "cse3"

define i32 @cse3(ptr %0, ptr %1, ptr %2, i32 %3, i64 %4, i8 %5) {
BB:
  %A = alloca i32, align 4
  %L = load i32, ptr %A, align 4
  ret i32 %L
}
