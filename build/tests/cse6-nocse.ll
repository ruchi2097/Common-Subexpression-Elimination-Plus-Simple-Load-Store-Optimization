; ModuleID = 'cse6-nocse.bc'
source_filename = "cse6"

define i32 @cse6(ptr %0, ptr %1, ptr %2, i32 %3, i64 %4, i8 %5) {
BB:
  %A = alloca i32, align 4
  store i32 %3, ptr %A, align 4
  %A1 = alloca i16, align 2
  %L = load i32, ptr %A, align 4
  %6 = and i32 %L, 77033
  %7 = and i32 %6, 77033
  store i32 %7, ptr %A, align 4
  %8 = and i32 %6, 77033
  %L2 = load i16, ptr %A1, align 2
  store i32 %8, ptr %A, align 4
  store i32 77033, ptr %A, align 4
  %Cmp = icmp sge i32 %8, %L
  br i1 %Cmp, label %BB3, label %BB4

BB3:                                              ; preds = %BB
  %L6 = load i8, ptr %0, align 1
  %9 = srem i8 %L6, %5
  %10 = or i8 %L6, %9
  store i8 %10, ptr %0, align 1
  br label %BB5

BB4:                                              ; preds = %BB
  %L7 = load i32, ptr %A, align 4
  %11 = sdiv i32 %L7, %3
  %12 = srem i32 %L7, %11
  store i32 %12, ptr %A, align 4
  br label %BB5

BB5:                                              ; preds = %BB4, %BB3
  br label %BB8

BB8:                                              ; preds = %BB9, %BB5
  %L11 = load i8, ptr %0, align 1
  %Cmp12 = icmp ne i8 %L11, %5
  br i1 %Cmp12, label %BB9, label %BB10

BB9:                                              ; preds = %BB8
  %L13 = load i32, ptr %A, align 4
  %13 = and i32 %L13, %L13
  %14 = sub i32 %L13, %13
  store i32 %14, ptr %A, align 4
  br label %BB8

BB10:                                             ; preds = %BB8
  store i32 %L, ptr %A, align 4
  ret i32 %L
}
