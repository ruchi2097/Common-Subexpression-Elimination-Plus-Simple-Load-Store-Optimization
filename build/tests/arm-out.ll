; ModuleID = 'arm-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@nlinks = dso_local global i32 0, align 4
@target = dso_local global [2 x i32] zeroinitializer, align 4
@.str = private unnamed_addr constant [9 x i8] c"newpath\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"Solven: no solutions!\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"closepath stroke\0A\00", align 1
@linklen = dso_local global [20 x i32] zeroinitializer, align 16
@.str.3 = private unnamed_addr constant [31 x i8] c"%%==>Solve3: links = %d,%d,%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"%%Solve3: link1=%d, link2=%d, joint=\0A\00", align 1
@.str.5 = private unnamed_addr constant [49 x i8] c"%%Solve3: link1=%d, link2=%d, link3=%d, joints=\0A\00", align 1
@.str.6 = private unnamed_addr constant [63 x i8] c"%%<==Solve2: L1=%d, L2=%d; nsoln=%d, target=(%d,%d),J=(%g,%g)\0A\00", align 1
@.str.7 = private unnamed_addr constant [27 x i8] c"%%TwoCircles00: p=(%g,%g)\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.9 = private unnamed_addr constant [26 x i8] c"%%Target point = (%d,%d)\0A\00", align 1
@.str.10 = private unnamed_addr constant [22 x i8] c"%5d    %5d    lineto\0A\00", align 1
@.str.11 = private unnamed_addr constant [22 x i8] c"%5d    %5d    moveto\0A\00", align 1
@.str.12 = private unnamed_addr constant [22 x i8] c"%8.2lf %8.2lf lineto\0A\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"%%\00", align 1
@.str.14 = private unnamed_addr constant [7 x i8] c"%d:%d\09\00", align 1
@.str.15 = private unnamed_addr constant [7 x i8] c"%%!PS\0A\00", align 1
@.str.16 = private unnamed_addr constant [38 x i8] c"%%%%Creator: arm.c (Joseph O'Rourke)\0A\00", align 1
@.str.17 = private unnamed_addr constant [30 x i8] c"%%%%BoundingBox: %d %d %d %d\0A\00", align 1
@.str.18 = private unnamed_addr constant [17 x i8] c"%%%%EndComments\0A\00", align 1
@.str.19 = private unnamed_addr constant [22 x i8] c".00 .00 setlinewidth\0A\00", align 1
@.str.20 = private unnamed_addr constant [17 x i8] c"%d %d translate\0A\00", align 1
@.str.21 = private unnamed_addr constant [18 x i8] c"showpage\0A%%%%EOF\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [2 x i32], align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memset.p0.i64(ptr align 4 %2, i8 0, i64 8, i1 false)
  %3 = call i32 @ReadLinks()
  store i32 %3, ptr @nlinks, align 4
  call void @PostscriptOpen()
  br label %4

4:                                                ; preds = %11, %0
  call void @ReadTarget(ptr noundef @target)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  call void @MoveTo_i(ptr noundef %2)
  %6 = load i32, ptr @nlinks, align 4
  %7 = call i32 @Solven(i32 noundef %6)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %11, label %9

9:                                                ; preds = %4
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %11

11:                                               ; preds = %9, %4
  call void @LineTo_i(ptr noundef @target)
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %4
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ReadLinks() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef @nlinks)
  store i32 0, ptr %1, align 4
  br label %4

4:                                                ; preds = %14, %0
  %5 = load i32, ptr %1, align 4
  %6 = load i32, ptr @nlinks, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %17

8:                                                ; preds = %4
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef %2)
  %10 = load i32, ptr %2, align 4
  %11 = load i32, ptr %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %12
  store i32 %10, ptr %13, align 4
  br label %14

14:                                               ; preds = %8
  %15 = load i32, ptr %1, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %1, align 4
  br label %4

17:                                               ; preds = %4
  %18 = load i32, ptr @nlinks, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @PostscriptOpen() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %18, %0
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr @nlinks, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %21

11:                                               ; preds = %7
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr %6, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %6, align 4
  br label %18

18:                                               ; preds = %11
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %5, align 4
  br label %7

21:                                               ; preds = %7
  %22 = load i32, ptr %6, align 4
  %23 = sub nsw i32 0, %22
  store i32 %23, ptr %3, align 4
  store i32 %23, ptr %1, align 4
  %24 = load i32, ptr %6, align 4
  store i32 %24, ptr %4, align 4
  store i32 %24, ptr %2, align 4
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.16)
  %27 = load i32, ptr %1, align 4
  %28 = load i32, ptr %3, align 4
  %29 = load i32, ptr %2, align 4
  %30 = load i32, ptr %4, align 4
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, i32 noundef %27, i32 noundef %28, i32 noundef %29, i32 noundef %30)
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  %33 = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %34 = load i32, ptr %1, align 4
  %35 = sub nsw i32 0, %34
  %36 = add nsw i32 %35, 100
  %37 = load i32, ptr %3, align 4
  %38 = sub nsw i32 0, %37
  %39 = add nsw i32 %38, 100
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i32 noundef %36, i32 noundef %39)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @ReadTarget(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %17, %1
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %20

8:                                                ; preds = %5
  %9 = load ptr, ptr %2, align 8
  %10 = load i32, ptr %3, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, ptr %9, i64 %11
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.8, ptr noundef %12)
  store i32 %13, ptr %4, align 4
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %15, label %16

15:                                               ; preds = %8
  call void @PostscriptClose()
  call void @exit(i32 noundef 0) #6
  unreachable

16:                                               ; preds = %8
  br label %17

17:                                               ; preds = %16
  %18 = load i32, ptr %3, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %3, align 4
  br label %5

20:                                               ; preds = %5
  %21 = load ptr, ptr %2, align 8
  %22 = load i32, ptr %21, align 4
  %23 = getelementptr inbounds i32, ptr %21, i64 1
  %24 = load i32, ptr %23, align 4
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %22, i32 noundef %24)
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @MoveTo_i(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load i32, ptr %0, align 4
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds i32, ptr %4, i64 1
  %6 = load i32, ptr %5, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %3, i32 noundef %6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Solven(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %9, align 4
  store i32 0, ptr %4, align 4
  br label %11

11:                                               ; preds = %22, %1
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %3, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %25

15:                                               ; preds = %11
  %16 = load i32, ptr %4, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %17
  %19 = load i32, ptr %18, align 4
  %20 = load i32, ptr %9, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, ptr %9, align 4
  br label %22

22:                                               ; preds = %15
  %23 = load i32, ptr %4, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %4, align 4
  br label %11

25:                                               ; preds = %11
  %26 = load i32, ptr %9, align 4
  %27 = sdiv i32 %26, 2
  store i32 %27, ptr %10, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %5, align 4
  br label %28

28:                                               ; preds = %49, %25
  %29 = load i32, ptr %5, align 4
  %30 = load i32, ptr %3, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %52

32:                                               ; preds = %28
  %33 = load i32, ptr %6, align 4
  %34 = load i32, ptr %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = add nsw i32 %33, %37
  %39 = load i32, ptr %10, align 4
  %40 = icmp sgt i32 %38, %39
  br i1 %40, label %41, label %42

41:                                               ; preds = %32
  br label %52

42:                                               ; preds = %32
  %43 = load i32, ptr %5, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = load i32, ptr %6, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, ptr %6, align 4
  br label %49

49:                                               ; preds = %42
  %50 = load i32, ptr %5, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %5, align 4
  br label %28

52:                                               ; preds = %41, %28
  %53 = load i32, ptr %5, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %54
  %56 = load i32, ptr %55, align 4
  store i32 %56, ptr %7, align 4
  %57 = load i32, ptr %9, align 4
  %58 = load i32, ptr %6, align 4
  %59 = sub nsw i32 %57, %58
  %60 = load i32, ptr %7, align 4
  %61 = sub nsw i32 %59, %60
  store i32 %61, ptr %8, align 4
  %62 = load i32, ptr %6, align 4
  %63 = load i32, ptr %7, align 4
  %64 = load i32, ptr %8, align 4
  %65 = call i32 @Solve3(i32 noundef %62, i32 noundef %63, i32 noundef %64, ptr noundef @target)
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %68

67:                                               ; preds = %52
  store i32 1, ptr %2, align 4
  br label %69

68:                                               ; preds = %52
  store i32 0, ptr %2, align 4
  br label %69

69:                                               ; preds = %68, %67
  %70 = load i32, ptr %2, align 4
  ret i32 %70
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @LineTo_i(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load i32, ptr %0, align 4
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds i32, ptr %4, i64 1
  %6 = load i32, ptr %5, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %3, i32 noundef %6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Solve3(i32 noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca [2 x double], align 16
  %11 = alloca [2 x i32], align 4
  %12 = alloca [2 x i32], align 4
  store i32 %0, ptr %6, align 4
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %7, align 4
  %15 = load i32, ptr %8, align 4
  %16 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %13, i32 noundef %14, i32 noundef %15)
  %17 = load i32, ptr %6, align 4
  %18 = load i32, ptr %7, align 4
  %19 = add nsw i32 %17, %18
  %20 = load i32, ptr %8, align 4
  %21 = load ptr, ptr %9, align 8
  %22 = call i32 @Solve2(i32 noundef %19, i32 noundef %20, ptr noundef %21, ptr noundef %10)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %30

24:                                               ; preds = %4
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr %7, align 4
  %27 = add nsw i32 %25, %26
  %28 = load i32, ptr %8, align 4
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %27, i32 noundef %28)
  call void @LineTo_d(ptr noundef %10)
  store i32 1, ptr %5, align 4
  br label %62

30:                                               ; preds = %4
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %7, align 4
  %33 = load i32, ptr %8, align 4
  %34 = add nsw i32 %32, %33
  %35 = load ptr, ptr %9, align 8
  %36 = call i32 @Solve2(i32 noundef %31, i32 noundef %34, ptr noundef %35, ptr noundef %10)
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %44

38:                                               ; preds = %30
  %39 = load i32, ptr %6, align 4
  %40 = load i32, ptr %7, align 4
  %41 = load i32, ptr %8, align 4
  %42 = add nsw i32 %40, %41
  %43 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %39, i32 noundef %42)
  call void @LineTo_d(ptr noundef %10)
  store i32 1, ptr %5, align 4
  br label %62

44:                                               ; preds = %30
  %45 = load i32, ptr %6, align 4
  store i32 %45, ptr %11, align 4
  %46 = getelementptr inbounds [2 x i32], ptr %11, i64 0, i64 1
  store i32 0, ptr %46, align 4
  %47 = load ptr, ptr %9, align 8
  call void @SubVec(ptr noundef %47, ptr noundef %11, ptr noundef %12)
  %48 = load i32, ptr %7, align 4
  %49 = load i32, ptr %8, align 4
  %50 = call i32 @Solve2(i32 noundef %48, i32 noundef %49, ptr noundef %12, ptr noundef %10)
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %61

52:                                               ; preds = %44
  %53 = load i32, ptr %6, align 4
  %54 = sitofp i32 %53 to double
  %55 = load double, ptr %10, align 16
  %56 = fadd double %55, %54
  store double %56, ptr %10, align 16
  %57 = load i32, ptr %6, align 4
  %58 = load i32, ptr %7, align 4
  %59 = load i32, ptr %8, align 4
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %57, i32 noundef %58, i32 noundef %59)
  call void @LineTo_i(ptr noundef %11)
  call void @LineTo_d(ptr noundef %10)
  store i32 1, ptr %5, align 4
  br label %62

61:                                               ; preds = %44
  store i32 0, ptr %5, align 4
  br label %62

62:                                               ; preds = %61, %52, %38, %24
  %63 = load i32, ptr %5, align 4
  ret i32 %63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Solve2(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca [2 x i32], align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  call void @llvm.memset.p0.i64(ptr align 4 %9, i8 0, i64 8, i1 false)
  %11 = load i32, ptr %5, align 4
  %12 = load ptr, ptr %7, align 8
  %13 = load i32, ptr %6, align 4
  %14 = load ptr, ptr %8, align 8
  %15 = call i32 @TwoCircles(ptr noundef %9, i32 noundef %11, ptr noundef %12, i32 noundef %13, ptr noundef %14)
  store i32 %15, ptr %10, align 4
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %6, align 4
  %18 = load i32, ptr %10, align 4
  %19 = load ptr, ptr %7, align 8
  %20 = load i32, ptr %19, align 4
  %21 = getelementptr inbounds i32, ptr %19, i64 1
  %22 = load i32, ptr %21, align 4
  %23 = load ptr, ptr %8, align 8
  %24 = load double, ptr %23, align 8
  %25 = getelementptr inbounds double, ptr %23, i64 1
  %26 = load double, ptr %25, align 8
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %16, i32 noundef %17, i32 noundef %18, i32 noundef %20, i32 noundef %22, double noundef %24, double noundef %26)
  %28 = load i32, ptr %10, align 4
  %29 = icmp ne i32 %28, 0
  %30 = zext i1 %29 to i32
  ret i32 %30
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @LineTo_d(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load double, ptr %0, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds double, ptr %4, i64 1
  %6 = load double, ptr %5, align 8
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, double noundef %3, double noundef %6)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @SubVec(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %8

8:                                                ; preds = %23, %3
  %9 = load i32, ptr %7, align 4
  %10 = icmp slt i32 %9, 2
  br i1 %10, label %11, label %26

11:                                               ; preds = %8
  %12 = load ptr, ptr %4, align 8
  %13 = load i32, ptr %7, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %12, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds i32, ptr %17, i64 %14
  %19 = load i32, ptr %18, align 4
  %20 = sub nsw i32 %16, %19
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds i32, ptr %21, i64 %14
  store i32 %20, ptr %22, align 4
  br label %23

23:                                               ; preds = %11
  %24 = load i32, ptr %7, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %7, align 4
  br label %8

26:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @TwoCircles(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca [2 x i32], align 4
  %12 = alloca [2 x double], align 16
  %13 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  store ptr %4, ptr %10, align 8
  store i32 -1, ptr %13, align 4
  %14 = load ptr, ptr %8, align 8
  %15 = load ptr, ptr %6, align 8
  call void @SubVec(ptr noundef %14, ptr noundef %15, ptr noundef %11)
  %16 = load i32, ptr %7, align 4
  %17 = load i32, ptr %9, align 4
  %18 = call i32 @TwoCircles0a(i32 noundef %16, ptr noundef %11, i32 noundef %17, ptr noundef %12)
  store i32 %18, ptr %13, align 4
  %19 = load double, ptr %12, align 16
  %20 = load ptr, ptr %6, align 8
  %21 = load i32, ptr %20, align 4
  %22 = sitofp i32 %21 to double
  %23 = fadd double %19, %22
  %24 = load ptr, ptr %10, align 8
  store double %23, ptr %24, align 8
  %25 = getelementptr inbounds [2 x double], ptr %12, i64 0, i64 1
  %26 = load double, ptr %25, align 8
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds i32, ptr %27, i64 1
  %29 = load i32, ptr %28, align 4
  %30 = sitofp i32 %29 to double
  %31 = fadd double %26, %30
  %32 = load ptr, ptr %10, align 8
  %33 = getelementptr inbounds double, ptr %32, i64 1
  store double %31, ptr %33, align 8
  %34 = load i32, ptr %13, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @TwoCircles0a(i32 noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  store i32 %0, ptr %6, align 4
  store ptr %1, ptr %7, align 8
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  %14 = load ptr, ptr %7, align 8
  %15 = call double @Length2(ptr noundef %14)
  store double %15, ptr %10, align 8
  %16 = load i32, ptr %6, align 4
  %17 = load i32, ptr %8, align 4
  %18 = add nsw i32 %16, %17
  %19 = mul nsw i32 %18, %18
  %20 = sitofp i32 %19 to double
  store double %20, ptr %11, align 8
  %21 = load i32, ptr %6, align 4
  %22 = load i32, ptr %8, align 4
  %23 = sub nsw i32 %21, %22
  %24 = mul nsw i32 %23, %23
  %25 = sitofp i32 %24 to double
  store double %25, ptr %12, align 8
  %26 = load double, ptr %10, align 8
  %27 = load double, ptr %11, align 8
  %28 = fcmp ogt double %26, %27
  br i1 %28, label %33, label %29

29:                                               ; preds = %4
  %30 = load double, ptr %10, align 8
  %31 = load double, ptr %12, align 8
  %32 = fcmp olt double %30, %31
  br i1 %32, label %33, label %34

33:                                               ; preds = %29, %4
  store i32 0, ptr %5, align 4
  br label %97

34:                                               ; preds = %29
  %35 = load double, ptr %10, align 8
  %36 = load double, ptr %11, align 8
  %37 = fcmp oeq double %35, %36
  br i1 %37, label %38, label %58

38:                                               ; preds = %34
  %39 = load i32, ptr %6, align 4
  %40 = sitofp i32 %39 to double
  %41 = load i32, ptr %8, align 4
  %42 = add nsw i32 %39, %41
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %40, %43
  store double %44, ptr %13, align 8
  %45 = load ptr, ptr %7, align 8
  %46 = load i32, ptr %45, align 4
  %47 = sitofp i32 %46 to double
  %48 = fmul double %44, %47
  %49 = load ptr, ptr %9, align 8
  store double %48, ptr %49, align 8
  %50 = load double, ptr %13, align 8
  %51 = load ptr, ptr %7, align 8
  %52 = getelementptr inbounds i32, ptr %51, i64 1
  %53 = load i32, ptr %52, align 4
  %54 = sitofp i32 %53 to double
  %55 = fmul double %50, %54
  %56 = load ptr, ptr %9, align 8
  %57 = getelementptr inbounds double, ptr %56, i64 1
  store double %55, ptr %57, align 8
  store i32 1, ptr %5, align 4
  br label %97

58:                                               ; preds = %34
  %59 = load double, ptr %10, align 8
  %60 = load double, ptr %12, align 8
  %61 = fcmp oeq double %59, %60
  br i1 %61, label %62, label %91

62:                                               ; preds = %58
  %63 = load double, ptr %12, align 8
  %64 = fcmp oeq double %63, 0.000000e+00
  br i1 %64, label %65, label %71

65:                                               ; preds = %62
  %66 = load i32, ptr %6, align 4
  %67 = sitofp i32 %66 to double
  %68 = load ptr, ptr %9, align 8
  store double %67, ptr %68, align 8
  %69 = load ptr, ptr %9, align 8
  %70 = getelementptr inbounds double, ptr %69, i64 1
  store double 0.000000e+00, ptr %70, align 8
  store i32 3, ptr %5, align 4
  br label %97

71:                                               ; preds = %62
  %72 = load i32, ptr %6, align 4
  %73 = sitofp i32 %72 to double
  %74 = load i32, ptr %8, align 4
  %75 = sub nsw i32 %72, %74
  %76 = sitofp i32 %75 to double
  %77 = fdiv double %73, %76
  store double %77, ptr %13, align 8
  %78 = load ptr, ptr %7, align 8
  %79 = load i32, ptr %78, align 4
  %80 = sitofp i32 %79 to double
  %81 = fmul double %77, %80
  %82 = load ptr, ptr %9, align 8
  store double %81, ptr %82, align 8
  %83 = load double, ptr %13, align 8
  %84 = load ptr, ptr %7, align 8
  %85 = getelementptr inbounds i32, ptr %84, i64 1
  %86 = load i32, ptr %85, align 4
  %87 = sitofp i32 %86 to double
  %88 = fmul double %83, %87
  %89 = load ptr, ptr %9, align 8
  %90 = getelementptr inbounds double, ptr %89, i64 1
  store double %88, ptr %90, align 8
  store i32 1, ptr %5, align 4
  br label %97

91:                                               ; preds = %58
  %92 = load i32, ptr %6, align 4
  %93 = load ptr, ptr %7, align 8
  %94 = load i32, ptr %8, align 4
  %95 = load ptr, ptr %9, align 8
  %96 = call i32 @TwoCircles0b(i32 noundef %92, ptr noundef %93, i32 noundef %94, ptr noundef %95)
  store i32 %96, ptr %5, align 4
  br label %97

97:                                               ; preds = %91, %71, %65, %38, %33
  %98 = load i32, ptr %5, align 4
  ret i32 %98
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @Length2(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  store ptr %0, ptr %2, align 8
  store double 0.000000e+00, ptr %4, align 8
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %17, %1
  %6 = load i32, ptr %3, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %20

8:                                                ; preds = %5
  %9 = load ptr, ptr %2, align 8
  %10 = load i32, ptr %3, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, ptr %9, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = sitofp i32 %13 to double
  %15 = load double, ptr %4, align 8
  %16 = call double @llvm.fmuladd.f64(double %14, double %14, double %15)
  store double %16, ptr %4, align 8
  br label %17

17:                                               ; preds = %8
  %18 = load i32, ptr %3, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %3, align 4
  br label %5

20:                                               ; preds = %5
  %21 = load double, ptr %4, align 8
  ret double %21
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @TwoCircles0b(i32 noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca double, align 8
  %10 = alloca [2 x double], align 16
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr %3, ptr %8, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = call double @Length2(ptr noundef %13)
  %15 = call double @sqrt(double noundef %14) #7
  store double %15, ptr %9, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = load i32, ptr %16, align 4
  %18 = sitofp i32 %17 to double
  %19 = load double, ptr %9, align 8
  %20 = fdiv double %18, %19
  store double %20, ptr %11, align 8
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds i32, ptr %21, i64 1
  %23 = load i32, ptr %22, align 4
  %24 = sitofp i32 %23 to double
  %25 = load double, ptr %9, align 8
  %26 = fdiv double %24, %25
  store double %26, ptr %12, align 8
  %27 = load i32, ptr %5, align 4
  %28 = load double, ptr %9, align 8
  %29 = load i32, ptr %7, align 4
  call void @TwoCircles00(i32 noundef %27, double noundef %28, i32 noundef %29, ptr noundef %10)
  %30 = load double, ptr %11, align 8
  %31 = load double, ptr %10, align 16
  %32 = load double, ptr %12, align 8
  %33 = fneg double %32
  %34 = getelementptr inbounds [2 x double], ptr %10, i64 0, i64 1
  %35 = load double, ptr %34, align 8
  %36 = fmul double %33, %35
  %37 = call double @llvm.fmuladd.f64(double %30, double %31, double %36)
  %38 = load ptr, ptr %8, align 8
  store double %37, ptr %38, align 8
  %39 = load double, ptr %12, align 8
  %40 = load double, ptr %10, align 16
  %41 = load double, ptr %11, align 8
  %42 = load double, ptr %34, align 8
  %43 = fmul double %41, %42
  %44 = call double @llvm.fmuladd.f64(double %39, double %40, double %43)
  %45 = load ptr, ptr %8, align 8
  %46 = getelementptr inbounds double, ptr %45, i64 1
  store double %44, ptr %46, align 8
  ret i32 2
}

; Function Attrs: nounwind
declare double @sqrt(double noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @TwoCircles00(i32 noundef %0, double noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  store i32 %0, ptr %5, align 4
  store double %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr %3, ptr %8, align 8
  %11 = load i32, ptr %5, align 4
  %12 = mul nsw i32 %11, %11
  %13 = sitofp i32 %12 to double
  store double %13, ptr %9, align 8
  %14 = load i32, ptr %7, align 4
  %15 = mul nsw i32 %14, %14
  %16 = sitofp i32 %15 to double
  store double %16, ptr %10, align 8
  %17 = load double, ptr %6, align 8
  %18 = load double, ptr %9, align 8
  %19 = load double, ptr %10, align 8
  %20 = fsub double %18, %19
  %21 = fdiv double %20, %17
  %22 = fadd double %17, %21
  %23 = fdiv double %22, 2.000000e+00
  %24 = load ptr, ptr %8, align 8
  store double %23, ptr %24, align 8
  %25 = load double, ptr %9, align 8
  %26 = load ptr, ptr %8, align 8
  %27 = load double, ptr %26, align 8
  %28 = load double, ptr %26, align 8
  %29 = fneg double %27
  %30 = call double @llvm.fmuladd.f64(double %29, double %28, double %25)
  %31 = call double @sqrt(double noundef %30) #7
  %32 = load ptr, ptr %8, align 8
  %33 = getelementptr inbounds double, ptr %32, i64 1
  store double %31, ptr %33, align 8
  %34 = load ptr, ptr %8, align 8
  %35 = load double, ptr %34, align 8
  %36 = getelementptr inbounds double, ptr %34, i64 1
  %37 = load double, ptr %36, align 8
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, double noundef %35, double noundef %37)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #4

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @PostscriptClose() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @PrintLinks() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %13, %0
  %4 = load i32, ptr %1, align 4
  %5 = load i32, ptr @nlinks, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %16

7:                                                ; preds = %3
  %8 = load i32, ptr %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [20 x i32], ptr @linklen, i64 0, i64 %9
  %11 = load i32, ptr %10, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %8, i32 noundef %11)
  br label %13

13:                                               ; preds = %7
  %14 = load i32, ptr %1, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %1, align 4
  br label %3

16:                                               ; preds = %3
  %17 = call i32 @putchar(i32 noundef 10)
  ret void
}

declare i32 @putchar(i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @EqPointi(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %22, %2
  %8 = load i32, ptr %6, align 4
  %9 = icmp slt i32 %8, 2
  br i1 %9, label %10, label %25

10:                                               ; preds = %7
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %6, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %11, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds i32, ptr %16, i64 %13
  %18 = load i32, ptr %17, align 4
  %19 = icmp ne i32 %15, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %10
  store i32 0, ptr %3, align 4
  br label %26

21:                                               ; preds = %10
  br label %22

22:                                               ; preds = %21
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %6, align 4
  br label %7

25:                                               ; preds = %7
  store i32 1, ptr %3, align 4
  br label %26

26:                                               ; preds = %25, %20
  %27 = load i32, ptr %3, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @RadDeg(double noundef %0) #0 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8
  %3 = fmul double 1.800000e+02, %0
  %4 = fdiv double %3, 0x400921FB54442D18
  ret double %4
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
