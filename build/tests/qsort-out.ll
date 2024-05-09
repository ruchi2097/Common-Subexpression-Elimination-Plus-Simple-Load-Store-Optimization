; ModuleID = 'qsort-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.my3DVertexStruct = type { i32, i32, i32, double }

@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [27 x i8] c"Usage: qsort_large <file>\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [57 x i8] c"\0ASorting %d vectors based on distance from the origin.\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @compare(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.my3DVertexStruct, ptr %7, i32 0, i32 3
  %9 = load double, ptr %8, align 8
  store double %9, ptr %5, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.my3DVertexStruct, ptr %10, i32 0, i32 3
  %12 = load double, ptr %11, align 8
  store double %12, ptr %6, align 8
  %13 = load double, ptr %5, align 8
  %14 = load double, ptr %6, align 8
  %15 = fcmp ogt double %13, %14
  br i1 %15, label %16, label %17

16:                                               ; preds = %2
  br label %22

17:                                               ; preds = %2
  %18 = load double, ptr %5, align 8
  %19 = load double, ptr %6, align 8
  %20 = fcmp oeq double %18, %19
  %21 = select i1 %20, i32 0, i32 -1
  br label %22

22:                                               ; preds = %17, %16
  %23 = phi i32 [ 1, %16 ], [ %21, %17 ]
  ret i32 %23
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca [60000 x %struct.my3DVertexStruct], align 16
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %9, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %13, 2
  br i1 %14, label %15, label %18

15:                                               ; preds = %2
  %16 = load ptr, ptr @stderr, align 8
  %17 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %16, ptr noundef @.str)
  call void @exit(i32 noundef -1) #4
  unreachable

18:                                               ; preds = %2
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds ptr, ptr %19, i64 1
  %21 = load ptr, ptr %20, align 8
  %22 = call noalias ptr @fopen(ptr noundef %21, ptr noundef @.str.1)
  store ptr %22, ptr %7, align 8
  br label %23

23:                                               ; preds = %40, %18
  %24 = load ptr, ptr %7, align 8
  %25 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %24, ptr noundef @.str.2, ptr noundef %10)
  %26 = icmp eq i32 %25, 1
  br i1 %26, label %27, label %38

27:                                               ; preds = %23
  %28 = load ptr, ptr %7, align 8
  %29 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %28, ptr noundef @.str.2, ptr noundef %11)
  %30 = icmp eq i32 %29, 1
  br i1 %30, label %31, label %38

31:                                               ; preds = %27
  %32 = load ptr, ptr %7, align 8
  %33 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %32, ptr noundef @.str.2, ptr noundef %12)
  %34 = icmp eq i32 %33, 1
  br i1 %34, label %35, label %38

35:                                               ; preds = %31
  %36 = load i32, ptr %9, align 4
  %37 = icmp slt i32 %36, 60000
  br label %38

38:                                               ; preds = %35, %31, %27, %23
  %39 = phi i1 [ false, %31 ], [ false, %27 ], [ false, %23 ], [ %37, %35 ]
  br i1 %39, label %40, label %73

40:                                               ; preds = %38
  %41 = load i32, ptr %10, align 4
  %42 = load i32, ptr %9, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %6, i64 0, i64 %43
  store i32 %41, ptr %44, align 8
  %45 = load i32, ptr %11, align 4
  %46 = load i32, ptr %9, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %6, i64 0, i64 %47
  %49 = getelementptr inbounds %struct.my3DVertexStruct, ptr %48, i32 0, i32 1
  store i32 %45, ptr %49, align 4
  %50 = load i32, ptr %12, align 4
  %51 = load i32, ptr %9, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %6, i64 0, i64 %52
  %54 = getelementptr inbounds %struct.my3DVertexStruct, ptr %53, i32 0, i32 2
  store i32 %50, ptr %54, align 8
  %55 = load i32, ptr %10, align 4
  %56 = sitofp i32 %55 to double
  %57 = call double @pow(double noundef %56, double noundef 2.000000e+00) #5
  %58 = load i32, ptr %11, align 4
  %59 = sitofp i32 %58 to double
  %60 = call double @pow(double noundef %59, double noundef 2.000000e+00) #5
  %61 = fadd double %57, %60
  %62 = load i32, ptr %12, align 4
  %63 = sitofp i32 %62 to double
  %64 = call double @pow(double noundef %63, double noundef 2.000000e+00) #5
  %65 = fadd double %61, %64
  %66 = call double @sqrt(double noundef %65) #5
  %67 = load i32, ptr %9, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %6, i64 0, i64 %68
  %70 = getelementptr inbounds %struct.my3DVertexStruct, ptr %69, i32 0, i32 3
  store double %66, ptr %70, align 8
  %71 = load i32, ptr %9, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %9, align 4
  br label %23

73:                                               ; preds = %38
  br label %74

74:                                               ; preds = %73
  %75 = load i32, ptr %9, align 4
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %75)
  %77 = load i32, ptr %9, align 4
  %78 = sext i32 %77 to i64
  call void @qsort(ptr noundef %6, i64 noundef %78, i64 noundef 24, ptr noundef @compare)
  store i32 0, ptr %8, align 4
  br label %79

79:                                               ; preds = %93, %74
  %80 = load i32, ptr %8, align 4
  %81 = load i32, ptr %9, align 4
  %82 = icmp slt i32 %80, %81
  br i1 %82, label %83, label %96

83:                                               ; preds = %79
  %84 = load i32, ptr %8, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], ptr %6, i64 0, i64 %85
  %87 = load i32, ptr %86, align 8
  %88 = getelementptr inbounds %struct.my3DVertexStruct, ptr %86, i32 0, i32 1
  %89 = load i32, ptr %88, align 4
  %90 = getelementptr inbounds %struct.my3DVertexStruct, ptr %86, i32 0, i32 2
  %91 = load i32, ptr %90, align 8
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %87, i32 noundef %89, i32 noundef %91)
  br label %93

93:                                               ; preds = %83
  %94 = load i32, ptr %8, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, ptr %8, align 4
  br label %79

96:                                               ; preds = %79
  ret i32 0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #3

; Function Attrs: nounwind
declare double @sqrt(double noundef) #3

declare i32 @printf(ptr noundef, ...) #1

declare void @qsort(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
