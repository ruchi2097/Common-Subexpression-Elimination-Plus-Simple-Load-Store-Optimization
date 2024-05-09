; ModuleID = 'em3d-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node_t = type { ptr, ptr, ptr, ptr, ptr, i32, i32 }
%struct.graph_t = type { [64 x ptr], [64 x ptr] }

@.str = private unnamed_addr constant [47 x i8] c"Hello world--Doing em3d with args %d %d %d %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"nonlocals = %d\0A\00", align 1
@nonlocals = dso_local global i32 0, align 4
@.str.7 = private unnamed_addr constant [7 x i8] c"retval\00", align 1
@.str.1.8 = private unnamed_addr constant [56 x i8] c"/ece566/wtest/../wolfbench/Benchmarks/em3d/make_graph.c\00", align 1
@__MyNodeId = dso_local global i32 0, align 4
@IDMASK = dso_local global i32 0, align 4
@.str.2 = private unnamed_addr constant [23 x i8] c"Uncaught malloc error\0A\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"Error! on dest %d @ %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [45 x i8] c"pre other_node = 0x%x,number = %d,dest = %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [34 x i8] c"Error! no to_nodes filed on 0x%x\0A\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"post other_node = 0x%x\0A\00", align 1
@.str.7.9 = private unnamed_addr constant [21 x i8] c"Help! no from count\0A\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"Help!!\0A\00", align 1
@.str.9 = private unnamed_addr constant [30 x i8] c"node 0x%x list 0x%x count %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"making tables \0A\00", align 1
@.str.11 = private unnamed_addr constant [18 x i8] c"making neighbors\0A\00", align 1
@.str.12 = private unnamed_addr constant [26 x i8] c"updating from and coeffs\0A\00", align 1
@.str.13 = private unnamed_addr constant [21 x i8] c"filling from fields\0A\00", align 1
@.str.14 = private unnamed_addr constant [31 x i8] c"localizing coeffs, from_nodes\0A\00", align 1
@.str.15 = private unnamed_addr constant [24 x i8] c"cleanup for return now\0A\00", align 1
@percentcheck = internal global i32 0, align 4
@numlocal = internal global i32 0, align 4
@.str.24 = private unnamed_addr constant [29 x i8] c"percentcheck=%d,numlocal=%d\0A\00", align 1
@DebugFlag = dso_local global i32 0, align 4
@__NumNodes = dso_local global i32 0, align 4
@n_nodes = dso_local global i32 0, align 4
@d_nodes = dso_local global i32 0, align 4
@local_p = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local void @compute_nodes(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  store ptr %0, ptr %2, align 8
  br label %10

10:                                               ; preds = %116, %1
  %11 = load ptr, ptr %2, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %123

13:                                               ; preds = %10
  %14 = load ptr, ptr %2, align 8
  store ptr %14, ptr %4, align 8
  %15 = load ptr, ptr %14, align 8
  %16 = load double, ptr %15, align 8
  store double %16, ptr %5, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.node_t, ptr %17, i32 0, i32 5
  %19 = load i32, ptr %18, align 8
  %20 = sub nsw i32 %19, 1
  store i32 %20, ptr %6, align 4
  store i32 0, ptr %3, align 4
  br label %21

21:                                               ; preds = %81, %13
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr %6, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %84

25:                                               ; preds = %21
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.node_t, ptr %26, i32 0, i32 3
  %28 = load ptr, ptr %27, align 8
  %29 = load i32, ptr %3, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds ptr, ptr %28, i64 %30
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr %7, align 8
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds %struct.node_t, ptr %33, i32 0, i32 4
  %35 = load ptr, ptr %34, align 8
  %36 = load i32, ptr %3, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds double, ptr %35, i64 %37
  %39 = load double, ptr %38, align 8
  store double %39, ptr %8, align 8
  %40 = load ptr, ptr %7, align 8
  %41 = icmp ne ptr %40, null
  br i1 %41, label %45, label %42

42:                                               ; preds = %25
  %43 = load i32, ptr @nonlocals, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr @nonlocals, align 4
  br label %45

45:                                               ; preds = %42, %25
  %46 = load ptr, ptr %7, align 8
  %47 = load double, ptr %46, align 8
  store double %47, ptr %9, align 8
  %48 = load double, ptr %8, align 8
  %49 = load double, ptr %9, align 8
  %50 = load double, ptr %5, align 8
  %51 = fneg double %48
  %52 = call double @llvm.fmuladd.f64(double %51, double %49, double %50)
  store double %52, ptr %5, align 8
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds %struct.node_t, ptr %53, i32 0, i32 3
  %55 = load ptr, ptr %54, align 8
  %56 = load i32, ptr %3, align 4
  %57 = add nsw i32 %56, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds ptr, ptr %55, i64 %58
  %60 = load ptr, ptr %59, align 8
  store ptr %60, ptr %7, align 8
  %61 = load ptr, ptr %4, align 8
  %62 = getelementptr inbounds %struct.node_t, ptr %61, i32 0, i32 4
  %63 = load ptr, ptr %62, align 8
  %64 = load i32, ptr %3, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds double, ptr %63, i64 %65
  %67 = load double, ptr %66, align 8
  store double %67, ptr %8, align 8
  %68 = load ptr, ptr %7, align 8
  %69 = icmp ne ptr %68, null
  br i1 %69, label %73, label %70

70:                                               ; preds = %45
  %71 = load i32, ptr @nonlocals, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr @nonlocals, align 4
  br label %73

73:                                               ; preds = %70, %45
  %74 = load ptr, ptr %7, align 8
  %75 = load double, ptr %74, align 8
  store double %75, ptr %9, align 8
  %76 = load double, ptr %8, align 8
  %77 = load double, ptr %9, align 8
  %78 = load double, ptr %5, align 8
  %79 = fneg double %76
  %80 = call double @llvm.fmuladd.f64(double %79, double %77, double %78)
  store double %80, ptr %5, align 8
  br label %81

81:                                               ; preds = %73
  %82 = load i32, ptr %3, align 4
  %83 = add nsw i32 %82, 2
  store i32 %83, ptr %3, align 4
  br label %21

84:                                               ; preds = %21
  %85 = load i32, ptr %3, align 4
  %86 = load i32, ptr %6, align 4
  %87 = icmp eq i32 %85, %86
  br i1 %87, label %88, label %116

88:                                               ; preds = %84
  %89 = load ptr, ptr %4, align 8
  %90 = getelementptr inbounds %struct.node_t, ptr %89, i32 0, i32 3
  %91 = load ptr, ptr %90, align 8
  %92 = load i32, ptr %3, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds ptr, ptr %91, i64 %93
  %95 = load ptr, ptr %94, align 8
  store ptr %95, ptr %7, align 8
  %96 = load ptr, ptr %4, align 8
  %97 = getelementptr inbounds %struct.node_t, ptr %96, i32 0, i32 4
  %98 = load ptr, ptr %97, align 8
  %99 = load i32, ptr %3, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, ptr %98, i64 %100
  %102 = load double, ptr %101, align 8
  store double %102, ptr %8, align 8
  %103 = load ptr, ptr %7, align 8
  %104 = icmp ne ptr %103, null
  br i1 %104, label %108, label %105

105:                                              ; preds = %88
  %106 = load i32, ptr @nonlocals, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, ptr @nonlocals, align 4
  br label %108

108:                                              ; preds = %105, %88
  %109 = load ptr, ptr %7, align 8
  %110 = load double, ptr %109, align 8
  store double %110, ptr %9, align 8
  %111 = load double, ptr %8, align 8
  %112 = load double, ptr %9, align 8
  %113 = load double, ptr %5, align 8
  %114 = fneg double %111
  %115 = call double @llvm.fmuladd.f64(double %114, double %112, double %113)
  store double %115, ptr %5, align 8
  br label %116

116:                                              ; preds = %108, %84
  %117 = load double, ptr %5, align 8
  %118 = load ptr, ptr %4, align 8
  %119 = load ptr, ptr %118, align 8
  store double %117, ptr %119, align 8
  %120 = load ptr, ptr %4, align 8
  %121 = getelementptr inbounds %struct.node_t, ptr %120, i32 0, i32 1
  %122 = load ptr, ptr %121, align 8
  store ptr %122, ptr %2, align 8
  br label %10

123:                                              ; preds = %10
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %8 = load i32, ptr %4, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = call i32 (i32, ptr, ...) @dealwithargs(i32 noundef %8, ptr noundef %9)
  %11 = load i32, ptr @n_nodes, align 4
  %12 = load i32, ptr @d_nodes, align 4
  %13 = load i32, ptr @local_p, align 4
  %14 = load i32, ptr @__NumNodes, align 4
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %11, i32 noundef %12, i32 noundef %13, i32 noundef %14)
  %16 = call ptr (...) @initialize_graph()
  store ptr %16, ptr %7, align 8
  %17 = load i32, ptr @DebugFlag, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %29

19:                                               ; preds = %2
  store i32 0, ptr %6, align 4
  br label %20

20:                                               ; preds = %25, %19
  %21 = load i32, ptr %6, align 4
  %22 = load i32, ptr @__NumNodes, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %28

24:                                               ; preds = %20
  br label %25

25:                                               ; preds = %24
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %6, align 4
  br label %20

28:                                               ; preds = %20
  br label %29

29:                                               ; preds = %28, %2
  %30 = load ptr, ptr %7, align 8
  %31 = load ptr, ptr %30, align 8
  call void (ptr, ...) @compute_nodes(ptr noundef %31)
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds %struct.graph_t, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  call void (ptr, ...) @compute_nodes(ptr noundef %34)
  %35 = load i32, ptr @nonlocals, align 4
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %35)
  %37 = call i32 (...) @printstats()
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ATOMICINC(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load i32, ptr %0, align 4
  %4 = add nsw i32 %3, 1
  store i32 %4, ptr %0, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @make_table(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = sext i32 %6 to i64
  %8 = mul i64 %7, 8
  %9 = call noalias ptr @malloc(i64 noundef %8) #6
  store ptr %9, ptr %5, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %2
  br label %14

12:                                               ; preds = %2
  call void @__assert_fail(ptr noundef @.str.7, ptr noundef @.str.1.8, i32 noundef 51, ptr noundef null) #7
  unreachable

13:                                               ; No predecessors!
  br label %14

14:                                               ; preds = %13, %11
  %15 = load ptr, ptr %5, align 8
  ret ptr %15
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

; Function Attrs: noreturn nounwind
declare void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @fill_table(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %12 = call noalias ptr @malloc(i64 noundef 48) #6
  store ptr %12, ptr %10, align 8
  %13 = load ptr, ptr %5, align 8
  store ptr %12, ptr %13, align 8
  %14 = call double (...) @gen_uniform_double()
  %15 = load ptr, ptr %6, align 8
  store double %14, ptr %15, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = getelementptr inbounds double, ptr %16, i32 1
  store ptr %17, ptr %6, align 8
  %18 = load ptr, ptr %10, align 8
  store ptr %16, ptr %18, align 8
  %19 = load ptr, ptr %10, align 8
  %20 = getelementptr inbounds %struct.node_t, ptr %19, i32 0, i32 5
  store i32 0, ptr %20, align 8
  store i32 1, ptr %11, align 4
  br label %21

21:                                               ; preds = %43, %4
  %22 = load i32, ptr %11, align 4
  %23 = load i32, ptr %7, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %46

25:                                               ; preds = %21
  %26 = call noalias ptr @malloc(i64 noundef 48) #6
  store ptr %26, ptr %9, align 8
  %27 = call double (...) @gen_uniform_double()
  %28 = load ptr, ptr %6, align 8
  store double %27, ptr %28, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr inbounds double, ptr %29, i32 1
  store ptr %30, ptr %6, align 8
  %31 = load ptr, ptr %9, align 8
  store ptr %29, ptr %31, align 8
  %32 = load ptr, ptr %9, align 8
  %33 = getelementptr inbounds %struct.node_t, ptr %32, i32 0, i32 5
  store i32 0, ptr %33, align 8
  %34 = load ptr, ptr %9, align 8
  %35 = load ptr, ptr %5, align 8
  %36 = load i32, ptr %11, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds ptr, ptr %35, i64 %37
  store ptr %34, ptr %38, align 8
  %39 = load ptr, ptr %9, align 8
  %40 = load ptr, ptr %10, align 8
  %41 = getelementptr inbounds %struct.node_t, ptr %40, i32 0, i32 1
  store ptr %39, ptr %41, align 8
  %42 = load ptr, ptr %9, align 8
  store ptr %42, ptr %10, align 8
  br label %43

43:                                               ; preds = %25
  %44 = load i32, ptr %11, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %11, align 4
  br label %21

46:                                               ; preds = %21
  %47 = load ptr, ptr %10, align 8
  %48 = getelementptr inbounds %struct.node_t, ptr %47, i32 0, i32 1
  store ptr null, ptr %48, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_neighbors(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store i32 %2, ptr %9, align 4
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  store i32 %5, ptr %12, align 4
  %21 = load i32, ptr @__MyNodeId, align 4
  %22 = load i32, ptr @IDMASK, align 4
  %23 = and i32 %21, %22
  store i32 %23, ptr %14, align 4
  %24 = load ptr, ptr %7, align 8
  store ptr %24, ptr %13, align 8
  br label %25

25:                                               ; preds = %150, %6
  %26 = load ptr, ptr %13, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %154

28:                                               ; preds = %25
  %29 = load i32, ptr %10, align 4
  %30 = sext i32 %29 to i64
  %31 = mul i64 %30, 8
  %32 = call noalias ptr @malloc(i64 noundef %31) #6
  %33 = load ptr, ptr %13, align 8
  %34 = getelementptr inbounds %struct.node_t, ptr %33, i32 0, i32 2
  store ptr %32, ptr %34, align 8
  %35 = load ptr, ptr %13, align 8
  %36 = getelementptr inbounds %struct.node_t, ptr %35, i32 0, i32 2
  %37 = load ptr, ptr %36, align 8
  %38 = icmp ne ptr %37, null
  br i1 %38, label %41, label %39

39:                                               ; preds = %28
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @exit(i32 noundef 0) #7
  unreachable

41:                                               ; preds = %28
  store i32 0, ptr %16, align 4
  br label %42

42:                                               ; preds = %146, %41
  %43 = load i32, ptr %16, align 4
  %44 = load i32, ptr %10, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %149

46:                                               ; preds = %42
  br label %47

47:                                               ; preds = %110, %46
  %48 = load i32, ptr %9, align 4
  %49 = call i32 @gen_number(i32 noundef %48)
  store i32 %49, ptr %20, align 4
  %50 = load i32, ptr %11, align 4
  %51 = call i32 @check_percent(i32 noundef %50)
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %55

53:                                               ; preds = %47
  %54 = load i32, ptr %12, align 4
  br label %62

55:                                               ; preds = %47
  %56 = load i32, ptr %12, align 4
  %57 = add nsw i32 %56, 64
  %58 = call i32 @gen_signed_number(i32 noundef 1)
  %59 = mul nsw i32 4, %58
  %60 = add nsw i32 %57, %59
  %61 = srem i32 %60, 64
  br label %62

62:                                               ; preds = %55, %53
  %63 = phi i32 [ %54, %53 ], [ %61, %55 ]
  store i32 %63, ptr %18, align 4
  %64 = load ptr, ptr %8, align 8
  %65 = load i32, ptr %18, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds ptr, ptr %64, i64 %66
  %68 = load ptr, ptr %67, align 8
  store ptr %68, ptr %19, align 8
  %69 = load i32, ptr %20, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds ptr, ptr %68, i64 %70
  %72 = load ptr, ptr %71, align 8
  store ptr %72, ptr %15, align 8
  %73 = icmp ne ptr %72, null
  br i1 %73, label %78, label %74

74:                                               ; preds = %62
  %75 = load i32, ptr %20, align 4
  %76 = load i32, ptr %18, align 4
  %77 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %75, i32 noundef %76)
  call void @exit(i32 noundef 0) #7
  unreachable

78:                                               ; preds = %62
  store i32 0, ptr %17, align 4
  br label %79

79:                                               ; preds = %95, %78
  %80 = load i32, ptr %17, align 4
  %81 = load i32, ptr %16, align 4
  %82 = icmp slt i32 %80, %81
  br i1 %82, label %83, label %98

83:                                               ; preds = %79
  %84 = load ptr, ptr %15, align 8
  %85 = load ptr, ptr %13, align 8
  %86 = getelementptr inbounds %struct.node_t, ptr %85, i32 0, i32 2
  %87 = load ptr, ptr %86, align 8
  %88 = load i32, ptr %17, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds ptr, ptr %87, i64 %89
  %91 = load ptr, ptr %90, align 8
  %92 = icmp eq ptr %84, %91
  br i1 %92, label %93, label %94

93:                                               ; preds = %83
  br label %98

94:                                               ; preds = %83
  br label %95

95:                                               ; preds = %94
  %96 = load i32, ptr %17, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %17, align 4
  br label %79

98:                                               ; preds = %93, %79
  %99 = load ptr, ptr %15, align 8
  %100 = ptrtoint ptr %99 to i32
  %101 = lshr i32 %100, 7
  %102 = icmp ult i32 %101, 2048
  br i1 %102, label %103, label %109

103:                                              ; preds = %98
  %104 = load ptr, ptr %15, align 8
  %105 = ptrtoint ptr %104 to i32
  %106 = load i32, ptr %20, align 4
  %107 = load i32, ptr %18, align 4
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, i32 noundef %105, i32 noundef %106, i32 noundef %107)
  br label %109

109:                                              ; preds = %103, %98
  br label %110

110:                                              ; preds = %109
  %111 = load i32, ptr %17, align 4
  %112 = load i32, ptr %16, align 4
  %113 = icmp slt i32 %111, %112
  br i1 %113, label %47, label %114

114:                                              ; preds = %110
  %115 = load ptr, ptr %13, align 8
  %116 = icmp ne ptr %115, null
  br i1 %116, label %117, label %122

117:                                              ; preds = %114
  %118 = load ptr, ptr %13, align 8
  %119 = getelementptr inbounds %struct.node_t, ptr %118, i32 0, i32 2
  %120 = load ptr, ptr %119, align 8
  %121 = icmp ne ptr %120, null
  br i1 %121, label %126, label %122

122:                                              ; preds = %117, %114
  %123 = load ptr, ptr %13, align 8
  %124 = ptrtoint ptr %123 to i32
  %125 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %124)
  call void @exit(i32 noundef 0) #7
  unreachable

126:                                              ; preds = %117
  %127 = load ptr, ptr %15, align 8
  %128 = load ptr, ptr %13, align 8
  %129 = getelementptr inbounds %struct.node_t, ptr %128, i32 0, i32 2
  %130 = load ptr, ptr %129, align 8
  %131 = load i32, ptr %16, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds ptr, ptr %130, i64 %132
  store ptr %127, ptr %133, align 8
  %134 = load ptr, ptr %15, align 8
  %135 = ptrtoint ptr %134 to i32
  %136 = lshr i32 %135, 7
  %137 = icmp ult i32 %136, 2048
  br i1 %137, label %138, label %142

138:                                              ; preds = %126
  %139 = load ptr, ptr %15, align 8
  %140 = ptrtoint ptr %139 to i32
  %141 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %140)
  br label %142

142:                                              ; preds = %138, %126
  %143 = load ptr, ptr %15, align 8
  %144 = getelementptr inbounds %struct.node_t, ptr %143, i32 0, i32 5
  %145 = call i32 @ATOMICINC(ptr noundef %144)
  br label %146

146:                                              ; preds = %142
  %147 = load i32, ptr %16, align 4
  %148 = add nsw i32 %147, 1
  store i32 %148, ptr %16, align 4
  br label %42

149:                                              ; preds = %42
  br label %150

150:                                              ; preds = %149
  %151 = load ptr, ptr %13, align 8
  %152 = getelementptr inbounds %struct.node_t, ptr %151, i32 0, i32 1
  %153 = load ptr, ptr %152, align 8
  store ptr %153, ptr %13, align 8
  br label %25

154:                                              ; preds = %25
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @update_from_coeffs(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %6 = load i32, ptr @__MyNodeId, align 4
  %7 = load i32, ptr @IDMASK, align 4
  %8 = and i32 %6, %7
  store i32 %8, ptr %4, align 4
  %9 = load ptr, ptr %2, align 8
  store ptr %9, ptr %3, align 8
  br label %10

10:                                               ; preds = %35, %1
  %11 = load ptr, ptr %3, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %39

13:                                               ; preds = %10
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.node_t, ptr %14, i32 0, i32 5
  %16 = load i32, ptr %15, align 8
  store i32 %16, ptr %5, align 4
  %17 = icmp slt i32 %16, 1
  br i1 %17, label %18, label %20

18:                                               ; preds = %13
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.7.9)
  br label %20

20:                                               ; preds = %18, %13
  %21 = load i32, ptr %5, align 4
  %22 = sext i32 %21 to i64
  %23 = mul i64 %22, 8
  %24 = call noalias ptr @malloc(i64 noundef %23) #6
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.node_t, ptr %25, i32 0, i32 3
  store ptr %24, ptr %26, align 8
  %27 = load i32, ptr %5, align 4
  %28 = sext i32 %27 to i64
  %29 = mul i64 %28, 8
  %30 = call noalias ptr @malloc(i64 noundef %29) #6
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds %struct.node_t, ptr %31, i32 0, i32 4
  store ptr %30, ptr %32, align 8
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds %struct.node_t, ptr %33, i32 0, i32 6
  store i32 0, ptr %34, align 4
  br label %35

35:                                               ; preds = %20
  %36 = load ptr, ptr %3, align 8
  %37 = getelementptr inbounds %struct.node_t, ptr %36, i32 0, i32 1
  %38 = load ptr, ptr %37, align 8
  store ptr %38, ptr %3, align 8
  br label %10

39:                                               ; preds = %10
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @fill_from_fields(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %12 = load ptr, ptr %3, align 8
  store ptr %12, ptr %5, align 8
  br label %13

13:                                               ; preds = %74, %2
  %14 = load ptr, ptr %5, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %78

16:                                               ; preds = %13
  store i32 0, ptr %6, align 4
  br label %17

17:                                               ; preds = %70, %16
  %18 = load i32, ptr %6, align 4
  %19 = load i32, ptr %4, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %73

21:                                               ; preds = %17
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds %struct.node_t, ptr %22, i32 0, i32 2
  %24 = load ptr, ptr %23, align 8
  %25 = load i32, ptr %6, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds ptr, ptr %24, i64 %26
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %9, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %11, align 8
  %31 = load ptr, ptr %9, align 8
  %32 = icmp ne ptr %31, null
  br i1 %32, label %35, label %33

33:                                               ; preds = %21
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %35

35:                                               ; preds = %33, %21
  %36 = load ptr, ptr %9, align 8
  %37 = getelementptr inbounds %struct.node_t, ptr %36, i32 0, i32 6
  %38 = call i32 @ATOMICINC(ptr noundef %37)
  store i32 %38, ptr %7, align 4
  %39 = load ptr, ptr %9, align 8
  %40 = getelementptr inbounds %struct.node_t, ptr %39, i32 0, i32 3
  %41 = load ptr, ptr %40, align 8
  store ptr %41, ptr %10, align 8
  %42 = load ptr, ptr %9, align 8
  %43 = getelementptr inbounds %struct.node_t, ptr %42, i32 0, i32 5
  %44 = load i32, ptr %43, align 8
  store i32 %44, ptr %8, align 4
  %45 = load ptr, ptr %10, align 8
  %46 = icmp ne ptr %45, null
  br i1 %46, label %57, label %47

47:                                               ; preds = %35
  %48 = load ptr, ptr %9, align 8
  %49 = ptrtoint ptr %48 to i32
  %50 = load ptr, ptr %10, align 8
  %51 = ptrtoint ptr %50 to i32
  %52 = load i32, ptr %8, align 4
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %49, i32 noundef %51, i32 noundef %52)
  %54 = load ptr, ptr %9, align 8
  %55 = getelementptr inbounds %struct.node_t, ptr %54, i32 0, i32 3
  %56 = load ptr, ptr %55, align 8
  store ptr %56, ptr %10, align 8
  br label %57

57:                                               ; preds = %47, %35
  %58 = load ptr, ptr %11, align 8
  %59 = load ptr, ptr %10, align 8
  %60 = load i32, ptr %7, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds ptr, ptr %59, i64 %61
  store ptr %58, ptr %62, align 8
  %63 = call double (...) @gen_uniform_double()
  %64 = load ptr, ptr %9, align 8
  %65 = getelementptr inbounds %struct.node_t, ptr %64, i32 0, i32 4
  %66 = load ptr, ptr %65, align 8
  %67 = load i32, ptr %7, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds double, ptr %66, i64 %68
  store double %63, ptr %69, align 8
  br label %70

70:                                               ; preds = %57
  %71 = load i32, ptr %6, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %6, align 4
  br label %17

73:                                               ; preds = %17
  br label %74

74:                                               ; preds = %73
  %75 = load ptr, ptr %5, align 8
  %76 = getelementptr inbounds %struct.node_t, ptr %75, i32 0, i32 1
  %77 = load ptr, ptr %76, align 8
  store ptr %77, ptr %5, align 8
  br label %13

78:                                               ; preds = %13
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @localize_local(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store ptr %0, ptr %3, align 8
  br label %7

7:                                                ; preds = %24, %1
  %8 = load ptr, ptr %3, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %28

10:                                               ; preds = %7
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds %struct.node_t, ptr %11, i32 0, i32 4
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %4, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.node_t, ptr %14, i32 0, i32 4
  store ptr %13, ptr %15, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.node_t, ptr %16, i32 0, i32 3
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %6, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.node_t, ptr %19, i32 0, i32 3
  store ptr %18, ptr %20, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %5, align 8
  %23 = load ptr, ptr %3, align 8
  store ptr %22, ptr %23, align 8
  br label %24

24:                                               ; preds = %10
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.node_t, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %3, align 8
  br label %7

28:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_tables(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %10 = load i32, ptr @__MyNodeId, align 4
  %11 = load i32, ptr @IDMASK, align 4
  %12 = and i32 %10, %11
  store i32 %12, ptr %9, align 4
  %13 = load i32, ptr %4, align 4
  %14 = mul nsw i32 793, %13
  call void @init_random(i32 noundef %14)
  %15 = load i32, ptr @n_nodes, align 4
  %16 = sdiv i32 %15, 64
  %17 = sext i32 %16 to i64
  %18 = mul i64 %17, 8
  %19 = call noalias ptr @malloc(i64 noundef %18) #6
  store ptr %19, ptr %7, align 8
  %20 = load i32, ptr @n_nodes, align 4
  %21 = sdiv i32 %20, 64
  %22 = load i32, ptr %9, align 4
  %23 = call ptr @make_table(i32 noundef %21, i32 noundef %22)
  store ptr %23, ptr %5, align 8
  %24 = load ptr, ptr %7, align 8
  %25 = load i32, ptr @n_nodes, align 4
  %26 = sdiv i32 %25, 64
  %27 = load i32, ptr %9, align 4
  call void @fill_table(ptr noundef %23, ptr noundef %24, i32 noundef %26, i32 noundef %27)
  %28 = load i32, ptr @n_nodes, align 4
  %29 = sdiv i32 %28, 64
  %30 = sext i32 %29 to i64
  %31 = mul i64 %30, 8
  %32 = call noalias ptr @malloc(i64 noundef %31) #6
  store ptr %32, ptr %8, align 8
  %33 = load i32, ptr @n_nodes, align 4
  %34 = sdiv i32 %33, 64
  %35 = load i32, ptr %9, align 4
  %36 = call ptr @make_table(i32 noundef %34, i32 noundef %35)
  store ptr %36, ptr %6, align 8
  %37 = load ptr, ptr %8, align 8
  %38 = load i32, ptr @n_nodes, align 4
  %39 = sdiv i32 %38, 64
  %40 = load i32, ptr %9, align 4
  call void @fill_table(ptr noundef %36, ptr noundef %37, i32 noundef %39, i32 noundef %40)
  %41 = load ptr, ptr %6, align 8
  %42 = load ptr, ptr %3, align 8
  %43 = load i32, ptr %4, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [64 x ptr], ptr %42, i64 0, i64 %44
  store ptr %41, ptr %45, align 8
  %46 = load ptr, ptr %5, align 8
  %47 = load ptr, ptr %3, align 8
  %48 = getelementptr inbounds %struct.graph_t, ptr %47, i32 0, i32 1
  %49 = load i32, ptr %4, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [64 x ptr], ptr %48, i64 0, i64 %50
  store ptr %46, ptr %51, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @make_all_neighbors(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %8 = mul nsw i32 39, %1
  call void @init_random(i32 noundef %8)
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.graph_t, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %4, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [64 x ptr], ptr %10, i64 0, i64 %12
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %6, align 8
  %15 = load ptr, ptr %3, align 8
  store ptr %15, ptr %7, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = load ptr, ptr %16, align 8
  store ptr %17, ptr %5, align 8
  %18 = load ptr, ptr %7, align 8
  %19 = load i32, ptr @n_nodes, align 4
  %20 = sdiv i32 %19, 64
  %21 = load i32, ptr @d_nodes, align 4
  %22 = load i32, ptr @local_p, align 4
  %23 = load i32, ptr %4, align 4
  call void @make_neighbors(ptr noundef %17, ptr noundef %18, i32 noundef %20, i32 noundef %21, i32 noundef %22, i32 noundef %23)
  %24 = load ptr, ptr %3, align 8
  %25 = load i32, ptr %4, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [64 x ptr], ptr %24, i64 0, i64 %26
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %6, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.graph_t, ptr %29, i32 0, i32 1
  store ptr %30, ptr %7, align 8
  %31 = load ptr, ptr %6, align 8
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr %5, align 8
  %33 = load ptr, ptr %7, align 8
  %34 = load i32, ptr @n_nodes, align 4
  %35 = sdiv i32 %34, 64
  %36 = load i32, ptr @d_nodes, align 4
  %37 = load i32, ptr @local_p, align 4
  %38 = load i32, ptr %4, align 4
  call void @make_neighbors(ptr noundef %32, ptr noundef %33, i32 noundef %35, i32 noundef %36, i32 noundef %37, i32 noundef %38)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @update_all_from_coeffs(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.graph_t, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %4, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [64 x ptr], ptr %8, i64 0, i64 %10
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %6, align 8
  call void @update_from_coeffs(ptr noundef %13)
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [64 x ptr], ptr %14, i64 0, i64 %16
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %5, align 8
  %19 = load ptr, ptr %18, align 8
  store ptr %19, ptr %6, align 8
  call void @update_from_coeffs(ptr noundef %19)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @fill_all_from_fields(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = mul nsw i32 17, %1
  call void @init_random(i32 noundef %7)
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.graph_t, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %4, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [64 x ptr], ptr %9, i64 0, i64 %11
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %5, align 8
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %6, align 8
  %15 = load i32, ptr @d_nodes, align 4
  call void @fill_from_fields(ptr noundef %14, i32 noundef %15)
  %16 = load ptr, ptr %3, align 8
  %17 = load i32, ptr %4, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [64 x ptr], ptr %16, i64 0, i64 %18
  %20 = load ptr, ptr %19, align 8
  store ptr %20, ptr %5, align 8
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %6, align 8
  %22 = load i32, ptr @d_nodes, align 4
  call void @fill_from_fields(ptr noundef %21, i32 noundef %22)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @localize(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.graph_t, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %4, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [64 x ptr], ptr %8, i64 0, i64 %10
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %6, align 8
  call void @localize_local(ptr noundef %13)
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [64 x ptr], ptr %14, i64 0, i64 %16
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %5, align 8
  %19 = load ptr, ptr %18, align 8
  store ptr %19, ptr %6, align 8
  call void @localize_local(ptr noundef %19)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @do_all(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, i32 noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  store i32 %4, ptr %10, align 4
  %12 = load i32, ptr %7, align 4
  %13 = load i32, ptr %10, align 4
  %14 = sdiv i32 %12, %13
  store i32 %14, ptr %11, align 4
  %15 = load i32, ptr %8, align 4
  %16 = icmp sgt i32 %15, 1
  br i1 %16, label %17, label %31

17:                                               ; preds = %5
  %18 = load ptr, ptr %6, align 8
  %19 = load i32, ptr %7, align 4
  %20 = load i32, ptr %8, align 4
  %21 = sdiv i32 %20, 2
  %22 = add nsw i32 %19, %21
  %23 = load ptr, ptr %9, align 8
  %24 = load i32, ptr %10, align 4
  call void @do_all(ptr noundef %18, i32 noundef %22, i32 noundef %21, ptr noundef %23, i32 noundef %24)
  %25 = load ptr, ptr %6, align 8
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %8, align 4
  %28 = sdiv i32 %27, 2
  %29 = load ptr, ptr %9, align 8
  %30 = load i32, ptr %10, align 4
  call void @do_all(ptr noundef %25, i32 noundef %26, i32 noundef %28, ptr noundef %29, i32 noundef %30)
  br label %35

31:                                               ; preds = %5
  %32 = load ptr, ptr %9, align 8
  %33 = load ptr, ptr %6, align 8
  %34 = load i32, ptr %7, align 4
  call void %32(ptr noundef %33, i32 noundef %34)
  br label %35

35:                                               ; preds = %31, %17
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @initialize_graph() #0 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = call noalias ptr @malloc(i64 noundef 1024) #6
  store ptr %10, ptr %1, align 8
  %11 = call noalias ptr @malloc(i64 noundef 1024) #6
  store ptr %11, ptr %2, align 8
  %12 = load i32, ptr @__NumNodes, align 4
  %13 = sdiv i32 64, %12
  store i32 %13, ptr %6, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %15 = load ptr, ptr %1, align 8
  %16 = load i32, ptr %6, align 4
  call void @do_all(ptr noundef %15, i32 noundef 0, i32 noundef 64, ptr noundef @make_tables, i32 noundef %16)
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.11)
  %18 = load ptr, ptr %1, align 8
  %19 = load i32, ptr %6, align 4
  call void @do_all(ptr noundef %18, i32 noundef 0, i32 noundef 64, ptr noundef @make_all_neighbors, i32 noundef %19)
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %21 = load ptr, ptr %1, align 8
  %22 = load i32, ptr %6, align 4
  call void @do_all(ptr noundef %21, i32 noundef 0, i32 noundef 64, ptr noundef @update_all_from_coeffs, i32 noundef %22)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  %24 = load ptr, ptr %1, align 8
  %25 = load i32, ptr %6, align 4
  call void @do_all(ptr noundef %24, i32 noundef 0, i32 noundef 64, ptr noundef @fill_all_from_fields, i32 noundef %25)
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.14)
  %27 = load ptr, ptr %1, align 8
  %28 = load i32, ptr %6, align 4
  call void @do_all(ptr noundef %27, i32 noundef 0, i32 noundef 64, ptr noundef @localize, i32 noundef %28)
  %29 = load i32, ptr @__NumNodes, align 4
  %30 = sdiv i32 64, %29
  store i32 %30, ptr %5, align 4
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.15)
  store i32 0, ptr %3, align 4
  br label %32

32:                                               ; preds = %130, %0
  %33 = load i32, ptr %3, align 4
  %34 = load i32, ptr @__NumNodes, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %133

36:                                               ; preds = %32
  %37 = load ptr, ptr %1, align 8
  %38 = load i32, ptr %3, align 4
  %39 = load i32, ptr %5, align 4
  %40 = mul nsw i32 %38, %39
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [64 x ptr], ptr %37, i64 0, i64 %41
  %43 = load ptr, ptr %42, align 8
  store ptr %43, ptr %7, align 8
  %44 = load ptr, ptr %43, align 8
  store ptr %44, ptr %8, align 8
  %45 = load ptr, ptr %2, align 8
  %46 = load i32, ptr %3, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [64 x ptr], ptr %45, i64 0, i64 %47
  store ptr %44, ptr %48, align 8
  %49 = load ptr, ptr %1, align 8
  %50 = getelementptr inbounds %struct.graph_t, ptr %49, i32 0, i32 1
  %51 = load i32, ptr %3, align 4
  %52 = load i32, ptr %5, align 4
  %53 = mul nsw i32 %51, %52
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [64 x ptr], ptr %50, i64 0, i64 %54
  %56 = load ptr, ptr %55, align 8
  store ptr %56, ptr %7, align 8
  %57 = load ptr, ptr %56, align 8
  store ptr %57, ptr %8, align 8
  %58 = load ptr, ptr %2, align 8
  %59 = getelementptr inbounds %struct.graph_t, ptr %58, i32 0, i32 1
  %60 = load i32, ptr %3, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [64 x ptr], ptr %59, i64 0, i64 %61
  store ptr %57, ptr %62, align 8
  store i32 1, ptr %4, align 4
  br label %63

63:                                               ; preds = %126, %36
  %64 = load i32, ptr %4, align 4
  %65 = load i32, ptr %5, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %129

67:                                               ; preds = %63
  %68 = load ptr, ptr %1, align 8
  %69 = load i32, ptr %3, align 4
  %70 = load i32, ptr %5, align 4
  %71 = mul nsw i32 %69, %70
  %72 = load i32, ptr %4, align 4
  %73 = add nsw i32 %71, %72
  %74 = sub nsw i32 %73, 1
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [64 x ptr], ptr %68, i64 0, i64 %75
  %77 = load ptr, ptr %76, align 8
  store ptr %77, ptr %7, align 8
  %78 = load i32, ptr @n_nodes, align 4
  %79 = sdiv i32 %78, 64
  %80 = sub nsw i32 %79, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds ptr, ptr %77, i64 %81
  %83 = load ptr, ptr %82, align 8
  store ptr %83, ptr %9, align 8
  %84 = load ptr, ptr %1, align 8
  %85 = load i32, ptr %3, align 4
  %86 = load i32, ptr %5, align 4
  %87 = mul nsw i32 %85, %86
  %88 = load i32, ptr %4, align 4
  %89 = add nsw i32 %87, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [64 x ptr], ptr %84, i64 0, i64 %90
  %92 = load ptr, ptr %91, align 8
  store ptr %92, ptr %7, align 8
  %93 = load ptr, ptr %92, align 8
  store ptr %93, ptr %8, align 8
  %94 = load ptr, ptr %9, align 8
  %95 = getelementptr inbounds %struct.node_t, ptr %94, i32 0, i32 1
  store ptr %93, ptr %95, align 8
  %96 = load ptr, ptr %1, align 8
  %97 = getelementptr inbounds %struct.graph_t, ptr %96, i32 0, i32 1
  %98 = load i32, ptr %3, align 4
  %99 = load i32, ptr %5, align 4
  %100 = mul nsw i32 %98, %99
  %101 = load i32, ptr %4, align 4
  %102 = add nsw i32 %100, %101
  %103 = sub nsw i32 %102, 1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [64 x ptr], ptr %97, i64 0, i64 %104
  %106 = load ptr, ptr %105, align 8
  store ptr %106, ptr %7, align 8
  %107 = load i32, ptr @n_nodes, align 4
  %108 = sdiv i32 %107, 64
  %109 = sub nsw i32 %108, 1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds ptr, ptr %106, i64 %110
  %112 = load ptr, ptr %111, align 8
  store ptr %112, ptr %9, align 8
  %113 = load ptr, ptr %1, align 8
  %114 = getelementptr inbounds %struct.graph_t, ptr %113, i32 0, i32 1
  %115 = load i32, ptr %3, align 4
  %116 = load i32, ptr %5, align 4
  %117 = mul nsw i32 %115, %116
  %118 = load i32, ptr %4, align 4
  %119 = add nsw i32 %117, %118
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [64 x ptr], ptr %114, i64 0, i64 %120
  %122 = load ptr, ptr %121, align 8
  store ptr %122, ptr %7, align 8
  %123 = load ptr, ptr %122, align 8
  store ptr %123, ptr %8, align 8
  %124 = load ptr, ptr %9, align 8
  %125 = getelementptr inbounds %struct.node_t, ptr %124, i32 0, i32 1
  store ptr %123, ptr %125, align 8
  br label %126

126:                                              ; preds = %67
  %127 = load i32, ptr %4, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, ptr %4, align 4
  br label %63

129:                                              ; preds = %63
  br label %130

130:                                              ; preds = %129
  %131 = load i32, ptr %3, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, ptr %3, align 4
  br label %32

133:                                              ; preds = %32
  %134 = load ptr, ptr %2, align 8
  ret ptr %134
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @init_random(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = call i32 (i32, ...) @srand48(i32 noundef %0)
  ret void
}

declare i32 @srand48(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gen_number(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = call i64 (...) @lrand48()
  %4 = load i32, ptr %2, align 4
  %5 = sext i32 %4 to i64
  %6 = srem i64 %3, %5
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

declare i64 @lrand48(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gen_signed_number(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = call i64 (...) @lrand48()
  %5 = load i32, ptr %2, align 4
  %6 = mul nsw i32 2, %5
  %7 = sext i32 %6 to i64
  %8 = srem i64 %4, %7
  %9 = trunc i64 %8 to i32
  %10 = load i32, ptr %2, align 4
  %11 = sub nsw i32 %9, %10
  store i32 %11, ptr %3, align 4
  %12 = icmp sge i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %1
  %14 = load i32, ptr %3, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %3, align 4
  br label %16

16:                                               ; preds = %13, %1
  %17 = load i32, ptr %3, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @gen_uniform_double() #0 {
  %1 = call double (...) @drand48()
  ret double %1
}

declare double @drand48(...) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @check_percent(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = call double (...) @drand48()
  %5 = load i32, ptr %2, align 4
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.000000e+02
  %8 = fcmp olt double %4, %7
  %9 = zext i1 %8 to i32
  store i32 %9, ptr %3, align 4
  %10 = load i32, ptr @percentcheck, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr @percentcheck, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %17

14:                                               ; preds = %1
  %15 = load i32, ptr @numlocal, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr @numlocal, align 4
  br label %17

17:                                               ; preds = %14, %1
  %18 = load i32, ptr %3, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printstats() #0 {
  %1 = load i32, ptr @percentcheck, align 4
  %2 = load i32, ptr @numlocal, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, i32 noundef %1, i32 noundef %2)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @dealwithargs(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %5 = load i32, ptr %3, align 4
  %6 = icmp sgt i32 %5, 5
  br i1 %6, label %7, label %12

7:                                                ; preds = %2
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds ptr, ptr %8, i64 5
  %10 = load ptr, ptr %9, align 8
  %11 = call i32 @atoi(ptr noundef %10) #8
  store i32 %11, ptr @DebugFlag, align 4
  br label %13

12:                                               ; preds = %2
  store i32 0, ptr @DebugFlag, align 4
  br label %13

13:                                               ; preds = %12, %7
  %14 = load i32, ptr %3, align 4
  %15 = icmp sgt i32 %14, 4
  br i1 %15, label %16, label %21

16:                                               ; preds = %13
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds ptr, ptr %17, i64 4
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 @atoi(ptr noundef %19) #8
  store i32 %20, ptr @__NumNodes, align 4
  br label %22

21:                                               ; preds = %13
  store i32 4, ptr @__NumNodes, align 4
  br label %22

22:                                               ; preds = %21, %16
  %23 = load i32, ptr %3, align 4
  %24 = icmp sgt i32 %23, 1
  br i1 %24, label %25, label %30

25:                                               ; preds = %22
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds ptr, ptr %26, i64 1
  %28 = load ptr, ptr %27, align 8
  %29 = call i32 @atoi(ptr noundef %28) #8
  store i32 %29, ptr @n_nodes, align 4
  br label %31

30:                                               ; preds = %22
  store i32 64, ptr @n_nodes, align 4
  br label %31

31:                                               ; preds = %30, %25
  %32 = load i32, ptr %3, align 4
  %33 = icmp sgt i32 %32, 2
  br i1 %33, label %34, label %39

34:                                               ; preds = %31
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds ptr, ptr %35, i64 2
  %37 = load ptr, ptr %36, align 8
  %38 = call i32 @atoi(ptr noundef %37) #8
  store i32 %38, ptr @d_nodes, align 4
  br label %40

39:                                               ; preds = %31
  store i32 3, ptr @d_nodes, align 4
  br label %40

40:                                               ; preds = %39, %34
  %41 = load i32, ptr %3, align 4
  %42 = icmp sgt i32 %41, 3
  br i1 %42, label %43, label %48

43:                                               ; preds = %40
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds ptr, ptr %44, i64 3
  %46 = load ptr, ptr %45, align 8
  %47 = call i32 @atoi(ptr noundef %46) #8
  store i32 %47, ptr @local_p, align 4
  br label %49

48:                                               ; preds = %40
  store i32 75, ptr @local_p, align 4
  br label %49

49:                                               ; preds = %48, %43
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind willreturn memory(read) }

!llvm.ident = !{!0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
