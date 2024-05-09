; ModuleID = 'l2lat-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timeval = type { i64, i64 }

@a = dso_local global [160000 x ptr] zeroinitializer, align 16
@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [12 x i8] c"Time is %g\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"L2 Latency (ns) is %g\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"L2 BW is %f MB/sec\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"b is %ld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  store i64 0, ptr %4, align 8
  br label %6

6:                                                ; preds = %14, %0
  %7 = load i64, ptr %4, align 8
  %8 = icmp slt i64 %7, 160000
  br i1 %8, label %9, label %17

9:                                                ; preds = %6
  %10 = load i64, ptr %4, align 8
  %11 = add nsw i64 %10, 1
  %12 = getelementptr inbounds [160000 x ptr], ptr @a, i64 0, i64 %11
  %13 = getelementptr inbounds [160000 x ptr], ptr @a, i64 0, i64 %10
  store ptr %12, ptr %13, align 8
  br label %14

14:                                               ; preds = %9
  %15 = load i64, ptr %4, align 8
  %16 = add nsw i64 %15, 1
  store i64 %16, ptr %4, align 8
  br label %6

17:                                               ; preds = %6
  %18 = call double (...) @second()
  store double %18, ptr %2, align 8
  store i64 0, ptr %4, align 8
  br label %19

19:                                               ; preds = %35, %17
  %20 = load i64, ptr %4, align 8
  %21 = icmp slt i64 %20, 1500
  br i1 %21, label %22, label %38

22:                                               ; preds = %19
  %23 = load ptr, ptr getelementptr inbounds ([160000 x ptr], ptr @a, i64 0, i64 7), align 8
  store ptr %23, ptr %3, align 8
  store i64 0, ptr %5, align 8
  br label %24

24:                                               ; preds = %31, %22
  %25 = load i64, ptr %5, align 8
  %26 = icmp slt i64 %25, 5000
  br i1 %26, label %27, label %34

27:                                               ; preds = %24
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds ptr, ptr %28, i64 8
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %3, align 8
  br label %31

31:                                               ; preds = %27
  %32 = load i64, ptr %5, align 8
  %33 = add nsw i64 %32, 1
  store i64 %33, ptr %5, align 8
  br label %24

34:                                               ; preds = %24
  br label %35

35:                                               ; preds = %34
  %36 = load i64, ptr %4, align 8
  %37 = add nsw i64 %36, 1
  store i64 %37, ptr %4, align 8
  br label %19

38:                                               ; preds = %19
  %39 = call double (...) @second()
  %40 = load double, ptr %2, align 8
  %41 = fsub double %39, %40
  store double %41, ptr %2, align 8
  %42 = load ptr, ptr @stderr, align 8
  %43 = load double, ptr %2, align 8
  %44 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %42, ptr noundef @.str, double noundef %43)
  %45 = load ptr, ptr @stderr, align 8
  %46 = load double, ptr %2, align 8
  %47 = fdiv double %46, 7.500000e+06
  %48 = fmul double %47, 1.000000e+09
  %49 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %45, ptr noundef @.str.1, double noundef %48)
  %50 = load ptr, ptr @stderr, align 8
  %51 = load double, ptr %2, align 8
  %52 = fmul double %51, 1.000000e+06
  %53 = fdiv double 4.800000e+08, %52
  %54 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %50, ptr noundef @.str.2, double noundef %53)
  %55 = load ptr, ptr @stderr, align 8
  %56 = load ptr, ptr %3, align 8
  %57 = ptrtoint ptr %56 to i64
  %58 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %55, ptr noundef @.str.3, i64 noundef %57)
  ret i32 0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @second() #0 {
  %1 = alloca double, align 8
  %2 = alloca %struct.timeval, align 8
  %3 = call i32 @gettimeofday(ptr noundef %2, ptr noundef null) #3
  %4 = getelementptr inbounds %struct.timeval, ptr %2, i32 0, i32 1
  %5 = load i64, ptr %4, align 8
  %6 = sitofp i64 %5 to double
  %7 = fdiv double %6, 1.000000e+06
  store double %7, ptr %1, align 8
  %8 = load i64, ptr %2, align 8
  %9 = sitofp i64 %8 to double
  %10 = load double, ptr %1, align 8
  %11 = fadd double %10, %9
  store double %11, ptr %1, align 8
  ret double %11
}

; Function Attrs: nounwind
declare i32 @gettimeofday(ptr noundef, ptr noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
