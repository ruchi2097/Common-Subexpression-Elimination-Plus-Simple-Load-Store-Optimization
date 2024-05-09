; ModuleID = 'cse5-out.bc'
source_filename = "cse5"

define void @cse5(ptr %0, ptr %1, ptr %2, i32 %3, i64 %4, i8 %5) {
BB:
  %A = alloca i32, align 4
  store i32 0, ptr %A, align 4
  ret void
}
