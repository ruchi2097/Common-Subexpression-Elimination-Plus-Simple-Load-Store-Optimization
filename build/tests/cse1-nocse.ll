; ModuleID = 'cse1-nocse.bc'
source_filename = "cse1"

define i32 @cse1(ptr %0, ptr %1, ptr %2, i32 %3, i64 %4, i8 %5) {
BB:
  %A = alloca i32, align 4
  %A1 = alloca i32, align 4
  %A2 = alloca i32, align 4
  %A3 = alloca i32, align 4
  store i32 %3, ptr %A, align 4
  store i32 %3, ptr %A1, align 4
  %L = load i32, ptr %A, align 4
  %L4 = load i32, ptr %A1, align 4
  %B = lshr i32 %L, %L4
  %6 = lshr i32 %L, %L4
  store i32 %6, ptr %A2, align 4
  store i32 %B, ptr %A3, align 4
  ret i32 %3
}
