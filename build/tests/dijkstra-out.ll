; ModuleID = 'dijkstra-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._NODE = type { i32, i32 }
%struct._QITEM = type { i32, i32, i32, ptr }

@qHead = dso_local global ptr null, align 8
@g_qCount = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@stdout = external global ptr, align 8
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [16 x i8] c"Out of memory.\0A\00", align 1
@ch = dso_local global i32 0, align 4
@rgnNodes = dso_local global [100 x %struct._NODE] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [54 x i8] c"Shortest path is 0 in cost. Just stay where you are.\0A\00", align 1
@iNode = dso_local global i32 0, align 4
@iDist = dso_local global i32 0, align 4
@iPrev = dso_local global i32 0, align 4
@i = dso_local global i32 0, align 4
@AdjMatrix = dso_local global [100 x [100 x i32]] zeroinitializer, align 16
@iCost = dso_local global i32 0, align 4
@.str.3 = private unnamed_addr constant [30 x i8] c"Shortest path is %d in cost. \00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"Path is: \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c"Usage: dijkstra <filename>\0A\00", align 1
@.str.7 = private unnamed_addr constant [41 x i8] c"Only supports matrix size is #define'd.\0A\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print_path(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds %struct._NODE, ptr %5, i64 %7
  %9 = getelementptr inbounds %struct._NODE, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = icmp ne i32 %10, 9999
  br i1 %11, label %12, label %19

12:                                               ; preds = %2
  %13 = load ptr, ptr %3, align 8
  %14 = load i32, ptr %4, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %struct._NODE, ptr %13, i64 %15
  %17 = getelementptr inbounds %struct._NODE, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  call void @print_path(ptr noundef %13, i32 noundef %18)
  br label %19

19:                                               ; preds = %12, %2
  %20 = load i32, ptr %4, align 4
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %20)
  %22 = load ptr, ptr @stdout, align 8
  %23 = call i32 @fflush(ptr noundef %22)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @fflush(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @enqueue0(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %9 = call noalias ptr @malloc(i64 noundef 24) #5
  store ptr %9, ptr %7, align 8
  %10 = load ptr, ptr @qHead, align 8
  store ptr %10, ptr %8, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %16, label %13

13:                                               ; preds = %3
  %14 = load ptr, ptr @stderr, align 8
  %15 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %14, ptr noundef @.str.1)
  call void @exit(i32 noundef 1) #6
  unreachable

16:                                               ; preds = %3
  %17 = load i32, ptr %4, align 4
  %18 = load ptr, ptr %7, align 8
  store i32 %17, ptr %18, align 8
  %19 = load i32, ptr %5, align 4
  %20 = load ptr, ptr %7, align 8
  %21 = getelementptr inbounds %struct._QITEM, ptr %20, i32 0, i32 1
  store i32 %19, ptr %21, align 4
  %22 = load i32, ptr %6, align 4
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds %struct._QITEM, ptr %23, i32 0, i32 2
  store i32 %22, ptr %24, align 8
  %25 = load ptr, ptr %7, align 8
  %26 = getelementptr inbounds %struct._QITEM, ptr %25, i32 0, i32 3
  store ptr null, ptr %26, align 8
  %27 = load ptr, ptr %8, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %31, label %29

29:                                               ; preds = %16
  %30 = load ptr, ptr %7, align 8
  store ptr %30, ptr @qHead, align 8
  br label %45

31:                                               ; preds = %16
  br label %32

32:                                               ; preds = %37, %31
  %33 = load ptr, ptr %8, align 8
  %34 = getelementptr inbounds %struct._QITEM, ptr %33, i32 0, i32 3
  %35 = load ptr, ptr %34, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %41

37:                                               ; preds = %32
  %38 = load ptr, ptr %8, align 8
  %39 = getelementptr inbounds %struct._QITEM, ptr %38, i32 0, i32 3
  %40 = load ptr, ptr %39, align 8
  store ptr %40, ptr %8, align 8
  br label %32

41:                                               ; preds = %32
  %42 = load ptr, ptr %7, align 8
  %43 = load ptr, ptr %8, align 8
  %44 = getelementptr inbounds %struct._QITEM, ptr %43, i32 0, i32 3
  store ptr %42, ptr %44, align 8
  br label %45

45:                                               ; preds = %41, %29
  %46 = load i32, ptr @g_qCount, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr @g_qCount, align 4
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @dequeue0(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr @qHead, align 8
  store ptr %8, ptr %7, align 8
  %9 = load ptr, ptr @qHead, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %29

11:                                               ; preds = %3
  %12 = load ptr, ptr @qHead, align 8
  %13 = load i32, ptr %12, align 8
  %14 = load ptr, ptr %4, align 8
  store i32 %13, ptr %14, align 4
  %15 = load ptr, ptr @qHead, align 8
  %16 = getelementptr inbounds %struct._QITEM, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = load ptr, ptr %5, align 8
  store i32 %17, ptr %18, align 4
  %19 = load ptr, ptr @qHead, align 8
  %20 = getelementptr inbounds %struct._QITEM, ptr %19, i32 0, i32 2
  %21 = load i32, ptr %20, align 8
  %22 = load ptr, ptr %6, align 8
  store i32 %21, ptr %22, align 4
  %23 = load ptr, ptr @qHead, align 8
  %24 = getelementptr inbounds %struct._QITEM, ptr %23, i32 0, i32 3
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr @qHead, align 8
  %26 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %26) #7
  %27 = load i32, ptr @g_qCount, align 4
  %28 = add nsw i32 %27, -1
  store i32 %28, ptr @g_qCount, align 4
  br label %29

29:                                               ; preds = %11, %3
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @qcount() #0 {
  %1 = load i32, ptr @g_qCount, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dijkstra(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr @ch, align 4
  br label %5

5:                                                ; preds = %16, %2
  %6 = load i32, ptr @ch, align 4
  %7 = icmp slt i32 %6, 100
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = load i32, ptr @ch, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %10
  store i32 9999, ptr %11, align 8
  %12 = load i32, ptr @ch, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %13
  %15 = getelementptr inbounds %struct._NODE, ptr %14, i32 0, i32 1
  store i32 9999, ptr %15, align 4
  br label %16

16:                                               ; preds = %8
  %17 = load i32, ptr @ch, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr @ch, align 4
  br label %5

19:                                               ; preds = %5
  %20 = load i32, ptr %3, align 4
  %21 = load i32, ptr %4, align 4
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %23, label %25

23:                                               ; preds = %19
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %97

25:                                               ; preds = %19
  %26 = load i32, ptr %3, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %27
  store i32 0, ptr %28, align 8
  %29 = load i32, ptr %3, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %30
  %32 = getelementptr inbounds %struct._NODE, ptr %31, i32 0, i32 1
  store i32 9999, ptr %32, align 4
  %33 = load i32, ptr %3, align 4
  call void @enqueue0(i32 noundef %33, i32 noundef 0, i32 noundef 9999)
  br label %34

34:                                               ; preds = %87, %25
  %35 = call i32 @qcount()
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %37, label %88

37:                                               ; preds = %34
  call void @dequeue0(ptr noundef @iNode, ptr noundef @iDist, ptr noundef @iPrev)
  store i32 0, ptr @i, align 4
  br label %38

38:                                               ; preds = %84, %37
  %39 = load i32, ptr @i, align 4
  %40 = icmp slt i32 %39, 100
  br i1 %40, label %41, label %87

41:                                               ; preds = %38
  %42 = load i32, ptr @iNode, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [100 x [100 x i32]], ptr @AdjMatrix, i64 0, i64 %43
  %45 = load i32, ptr @i, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [100 x i32], ptr %44, i64 0, i64 %46
  %48 = load i32, ptr %47, align 4
  store i32 %48, ptr @iCost, align 4
  %49 = icmp ne i32 %48, 9999
  br i1 %49, label %50, label %83

50:                                               ; preds = %41
  %51 = load i32, ptr @i, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %52
  %54 = load i32, ptr %53, align 8
  %55 = icmp eq i32 9999, %54
  br i1 %55, label %65, label %56

56:                                               ; preds = %50
  %57 = load i32, ptr @i, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %58
  %60 = load i32, ptr %59, align 8
  %61 = load i32, ptr @iCost, align 4
  %62 = load i32, ptr @iDist, align 4
  %63 = add nsw i32 %61, %62
  %64 = icmp sgt i32 %60, %63
  br i1 %64, label %65, label %82

65:                                               ; preds = %56, %50
  %66 = load i32, ptr @iDist, align 4
  %67 = load i32, ptr @iCost, align 4
  %68 = add nsw i32 %66, %67
  %69 = load i32, ptr @i, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %70
  store i32 %68, ptr %71, align 8
  %72 = load i32, ptr @iNode, align 4
  %73 = load i32, ptr @i, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %74
  %76 = getelementptr inbounds %struct._NODE, ptr %75, i32 0, i32 1
  store i32 %72, ptr %76, align 4
  %77 = load i32, ptr @i, align 4
  %78 = load i32, ptr @iDist, align 4
  %79 = load i32, ptr @iCost, align 4
  %80 = add nsw i32 %78, %79
  %81 = load i32, ptr @iNode, align 4
  call void @enqueue0(i32 noundef %77, i32 noundef %80, i32 noundef %81)
  br label %82

82:                                               ; preds = %65, %56
  br label %83

83:                                               ; preds = %82, %41
  br label %84

84:                                               ; preds = %83
  %85 = load i32, ptr @i, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr @i, align 4
  br label %38

87:                                               ; preds = %38
  br label %34

88:                                               ; preds = %34
  %89 = load i32, ptr %4, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [100 x %struct._NODE], ptr @rgnNodes, i64 0, i64 %90
  %92 = load i32, ptr %91, align 8
  %93 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %92)
  %94 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %95 = load i32, ptr %4, align 4
  call void @print_path(ptr noundef @rgnNodes, i32 noundef %95)
  %96 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %97

97:                                               ; preds = %88, %23
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %10, 2
  br i1 %11, label %12, label %17

12:                                               ; preds = %2
  %13 = load ptr, ptr @stderr, align 8
  %14 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %13, ptr noundef @.str.6)
  %15 = load ptr, ptr @stderr, align 8
  %16 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %15, ptr noundef @.str.7)
  br label %17

17:                                               ; preds = %12, %2
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds ptr, ptr %18, i64 1
  %20 = load ptr, ptr %19, align 8
  %21 = call noalias ptr @fopen(ptr noundef %20, ptr noundef @.str.8)
  store ptr %21, ptr %9, align 8
  store i32 0, ptr %6, align 4
  br label %22

22:                                               ; preds = %43, %17
  %23 = load i32, ptr %6, align 4
  %24 = icmp slt i32 %23, 100
  br i1 %24, label %25, label %46

25:                                               ; preds = %22
  store i32 0, ptr %7, align 4
  br label %26

26:                                               ; preds = %39, %25
  %27 = load i32, ptr %7, align 4
  %28 = icmp slt i32 %27, 100
  br i1 %28, label %29, label %42

29:                                               ; preds = %26
  %30 = load ptr, ptr %9, align 8
  %31 = call i32 (ptr, ptr, ...) @__isoc99_fscanf(ptr noundef %30, ptr noundef @.str.9, ptr noundef %8)
  %32 = load i32, ptr %8, align 4
  %33 = load i32, ptr %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [100 x [100 x i32]], ptr @AdjMatrix, i64 0, i64 %34
  %36 = load i32, ptr %7, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [100 x i32], ptr %35, i64 0, i64 %37
  store i32 %32, ptr %38, align 4
  br label %39

39:                                               ; preds = %29
  %40 = load i32, ptr %7, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %7, align 4
  br label %26

42:                                               ; preds = %26
  br label %43

43:                                               ; preds = %42
  %44 = load i32, ptr %6, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %6, align 4
  br label %22

46:                                               ; preds = %22
  store i32 0, ptr %6, align 4
  store i32 50, ptr %7, align 4
  br label %47

47:                                               ; preds = %56, %46
  %48 = load i32, ptr %6, align 4
  %49 = icmp slt i32 %48, 100
  br i1 %49, label %50, label %61

50:                                               ; preds = %47
  %51 = load i32, ptr %7, align 4
  %52 = srem i32 %51, 100
  store i32 %52, ptr %7, align 4
  %53 = load i32, ptr %6, align 4
  %54 = load i32, ptr %7, align 4
  %55 = call i32 @dijkstra(i32 noundef %53, i32 noundef %54)
  br label %56

56:                                               ; preds = %50
  %57 = load i32, ptr %6, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %6, align 4
  %59 = load i32, ptr %7, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %7, align 4
  br label %47

61:                                               ; preds = %47
  call void @exit(i32 noundef 0) #6
  unreachable
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @__isoc99_fscanf(ptr noundef, ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) }
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
