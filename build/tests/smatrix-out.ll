; ModuleID = 'smatrix-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@size = dso_local global i32 64, align 4
@total = dso_local global double 0.000000e+00, align 8
@.str = private unnamed_addr constant [30 x i8] c"Native Matrix Multiplication\0A\00", align 1
@RC = dso_local global [1048576 x float] zeroinitializer, align 16
@C = dso_local global [1024 x [1024 x i32]] zeroinitializer, align 16
@RA = dso_local global [1048576 x float] zeroinitializer, align 16
@A = dso_local global [1024 x [1024 x i32]] zeroinitializer, align 16
@RB = dso_local global [1048576 x float] zeroinitializer, align 16
@B = dso_local global [1024 x [1024 x i32]] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [24 x i8] c"usage:\0A\09smatrix [size]\0A\00", align 1
@.str.2 = private unnamed_addr constant [38 x i8] c"Matrix Multiplication Kernel (%dx%d)\0A\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"Phase 2\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"Phase 3\0A\00", align 1
@.str.5 = private unnamed_addr constant [41 x i8] c"Verification total=%g should be 31599.2\0A\00", align 1
@.str.6 = private unnamed_addr constant [23 x i8] c"Verification total=%g\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @matmult() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  store i32 0, ptr %1, align 4
  br label %5

5:                                                ; preds = %68, %0
  %6 = load i32, ptr %1, align 4
  %7 = load i32, ptr @size, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %71

9:                                                ; preds = %5
  store i32 0, ptr %2, align 4
  br label %10

10:                                               ; preds = %64, %9
  %11 = load i32, ptr %2, align 4
  %12 = load i32, ptr @size, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %67

14:                                               ; preds = %10
  %15 = load i32, ptr %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [1024 x [1024 x i32]], ptr @C, i64 0, i64 %16
  %18 = load i32, ptr %17, align 16
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [1048576 x float], ptr @RC, i64 0, i64 %19
  store float 0.000000e+00, ptr %20, align 4
  store i32 0, ptr %3, align 4
  br label %21

21:                                               ; preds = %60, %14
  %22 = load i32, ptr %3, align 4
  %23 = load i32, ptr @size, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %63

25:                                               ; preds = %21
  %26 = load i32, ptr %1, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [1024 x [1024 x i32]], ptr @C, i64 0, i64 %27
  %29 = load i32, ptr %2, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [1024 x i32], ptr %28, i64 0, i64 %30
  %32 = load i32, ptr %31, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [1048576 x float], ptr @RC, i64 0, i64 %33
  %35 = load float, ptr %34, align 4
  %36 = getelementptr inbounds [1024 x [1024 x i32]], ptr @A, i64 0, i64 %27
  %37 = getelementptr inbounds [1024 x i32], ptr %36, i64 0, i64 %30
  %38 = load i32, ptr %37, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1048576 x float], ptr @RA, i64 0, i64 %39
  %41 = load float, ptr %40, align 4
  %42 = getelementptr inbounds [1024 x [1024 x i32]], ptr @B, i64 0, i64 %30
  %43 = load i32, ptr %3, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [1024 x i32], ptr %42, i64 0, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [1048576 x float], ptr @RB, i64 0, i64 %47
  %49 = load float, ptr %48, align 4
  %50 = call float @llvm.fmuladd.f32(float %41, float %49, float %35)
  %51 = load i32, ptr %1, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [1024 x [1024 x i32]], ptr @C, i64 0, i64 %52
  %54 = load i32, ptr %2, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [1024 x i32], ptr %53, i64 0, i64 %55
  %57 = load i32, ptr %56, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [1048576 x float], ptr @RC, i64 0, i64 %58
  store float %50, ptr %59, align 4
  br label %60

60:                                               ; preds = %25
  %61 = load i32, ptr %3, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, ptr %3, align 4
  br label %21

63:                                               ; preds = %21
  br label %64

64:                                               ; preds = %63
  %65 = load i32, ptr %2, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, ptr %2, align 4
  br label %10

67:                                               ; preds = %10
  br label %68

68:                                               ; preds = %67
  %69 = load i32, ptr %1, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, ptr %1, align 4
  br label %5

71:                                               ; preds = %5
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %8 = load i32, ptr %4, align 4
  %9 = icmp sgt i32 %8, 2
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  call void @exit(i32 noundef 0) #5
  unreachable

12:                                               ; preds = %2
  %13 = load i32, ptr %4, align 4
  %14 = icmp sgt i32 %13, 1
  br i1 %14, label %15, label %26

15:                                               ; preds = %12
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds ptr, ptr %16, i64 1
  %18 = load ptr, ptr %17, align 8
  %19 = call i32 @atoi(ptr noundef %18) #6
  store i32 %19, ptr @size, align 4
  %20 = icmp slt i32 %19, 2
  br i1 %20, label %24, label %21

21:                                               ; preds = %15
  %22 = load i32, ptr @size, align 4
  %23 = icmp sgt i32 %22, 1024
  br i1 %23, label %24, label %25

24:                                               ; preds = %21, %15
  store i32 1024, ptr @size, align 4
  br label %25

25:                                               ; preds = %24, %21
  br label %26

26:                                               ; preds = %25, %12
  %27 = load i32, ptr @size, align 4
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %27, i32 noundef %27)
  store i32 0, ptr %6, align 4
  br label %29

29:                                               ; preds = %76, %26
  %30 = load i32, ptr %6, align 4
  %31 = load i32, ptr @size, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %79

33:                                               ; preds = %29
  store i32 0, ptr %7, align 4
  br label %34

34:                                               ; preds = %72, %33
  %35 = load i32, ptr %7, align 4
  %36 = load i32, ptr @size, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %75

38:                                               ; preds = %34
  %39 = load i32, ptr %6, align 4
  %40 = load i32, ptr @size, align 4
  %41 = mul nsw i32 %39, %40
  %42 = load i32, ptr %7, align 4
  %43 = mul nsw i32 %42, %40
  %44 = add nsw i32 %41, %43
  %45 = srem i32 %44, %40
  %46 = sext i32 %39 to i64
  %47 = getelementptr inbounds [1024 x [1024 x i32]], ptr @A, i64 0, i64 %46
  %48 = sext i32 %42 to i64
  %49 = getelementptr inbounds [1024 x i32], ptr %47, i64 0, i64 %48
  store i32 %45, ptr %49, align 4
  %50 = load i32, ptr %6, align 4
  %51 = load i32, ptr @size, align 4
  %52 = mul nsw i32 %50, %51
  %53 = load i32, ptr %7, align 4
  %54 = add nsw i32 %52, %53
  %55 = sext i32 %50 to i64
  %56 = getelementptr inbounds [1024 x [1024 x i32]], ptr @B, i64 0, i64 %55
  %57 = sext i32 %53 to i64
  %58 = getelementptr inbounds [1024 x i32], ptr %56, i64 0, i64 %57
  store i32 %54, ptr %58, align 4
  %59 = load i32, ptr %6, align 4
  %60 = load i32, ptr @size, align 4
  %61 = mul nsw i32 %59, %60
  %62 = sdiv i32 %61, 2
  %63 = load i32, ptr %7, align 4
  %64 = mul nsw i32 %63, %60
  %65 = sdiv i32 %64, 2
  %66 = add nsw i32 %62, %65
  %67 = srem i32 %66, %60
  %68 = sext i32 %59 to i64
  %69 = getelementptr inbounds [1024 x [1024 x i32]], ptr @C, i64 0, i64 %68
  %70 = sext i32 %63 to i64
  %71 = getelementptr inbounds [1024 x i32], ptr %69, i64 0, i64 %70
  store i32 %67, ptr %71, align 4
  br label %72

72:                                               ; preds = %38
  %73 = load i32, ptr %7, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %7, align 4
  br label %34

75:                                               ; preds = %34
  br label %76

76:                                               ; preds = %75
  %77 = load i32, ptr %6, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, ptr %6, align 4
  br label %29

79:                                               ; preds = %29
  store i32 0, ptr %6, align 4
  br label %80

80:                                               ; preds = %123, %79
  %81 = load i32, ptr %6, align 4
  %82 = load i32, ptr @size, align 4
  %83 = icmp slt i32 %81, %82
  br i1 %83, label %84, label %126

84:                                               ; preds = %80
  store i32 0, ptr %7, align 4
  br label %85

85:                                               ; preds = %119, %84
  %86 = load i32, ptr %7, align 4
  %87 = load i32, ptr @size, align 4
  %88 = icmp slt i32 %86, %87
  br i1 %88, label %89, label %122

89:                                               ; preds = %85
  %90 = load i32, ptr %6, align 4
  %91 = load i32, ptr %7, align 4
  %92 = mul nsw i32 %90, %91
  %93 = mul nsw i32 %92, %90
  %94 = add nsw i32 %93, 10
  %95 = sitofp i32 %94 to float
  %96 = sext i32 %90 to i64
  %97 = getelementptr inbounds [1024 x [1024 x i32]], ptr @A, i64 0, i64 %96
  %98 = sext i32 %91 to i64
  %99 = getelementptr inbounds [1024 x i32], ptr %97, i64 0, i64 %98
  %100 = load i32, ptr %99, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [1048576 x float], ptr @RA, i64 0, i64 %101
  store float %95, ptr %102, align 4
  %103 = load i32, ptr %6, align 4
  %104 = load i32, ptr %7, align 4
  %105 = mul nsw i32 %104, %103
  %106 = mul nsw i32 %103, %104
  %107 = sdiv i32 %106, 3
  %108 = sub nsw i32 %105, %107
  %109 = add nsw i32 %108, 3
  %110 = sdiv i32 %103, %109
  %111 = sitofp i32 %110 to float
  %112 = sext i32 %103 to i64
  %113 = getelementptr inbounds [1024 x [1024 x i32]], ptr @B, i64 0, i64 %112
  %114 = sext i32 %104 to i64
  %115 = getelementptr inbounds [1024 x i32], ptr %113, i64 0, i64 %114
  %116 = load i32, ptr %115, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [1048576 x float], ptr @RB, i64 0, i64 %117
  store float %111, ptr %118, align 4
  br label %119

119:                                              ; preds = %89
  %120 = load i32, ptr %7, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, ptr %7, align 4
  br label %85

122:                                              ; preds = %85
  br label %123

123:                                              ; preds = %122
  %124 = load i32, ptr %6, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, ptr %6, align 4
  br label %80

126:                                              ; preds = %80
  %127 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @matmult()
  %128 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 0, ptr %6, align 4
  br label %129

129:                                              ; preds = %170, %126
  %130 = load i32, ptr %6, align 4
  %131 = load i32, ptr @size, align 4
  %132 = icmp slt i32 %130, %131
  br i1 %132, label %133, label %173

133:                                              ; preds = %129
  store i32 0, ptr %7, align 4
  br label %134

134:                                              ; preds = %166, %133
  %135 = load i32, ptr %7, align 4
  %136 = load i32, ptr @size, align 4
  %137 = icmp slt i32 %135, %136
  br i1 %137, label %138, label %169

138:                                              ; preds = %134
  %139 = load i32, ptr %6, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [1024 x [1024 x i32]], ptr @C, i64 0, i64 %140
  %142 = load i32, ptr %7, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [1024 x i32], ptr %141, i64 0, i64 %143
  %145 = load i32, ptr %144, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [1048576 x float], ptr @RC, i64 0, i64 %146
  %148 = load float, ptr %147, align 4
  %149 = fcmp ogt float %148, 3.000000e+06
  br i1 %149, label %150, label %165

150:                                              ; preds = %138
  %151 = load i32, ptr %6, align 4
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [1024 x [1024 x i32]], ptr @C, i64 0, i64 %152
  %154 = load i32, ptr %7, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds [1024 x i32], ptr %153, i64 0, i64 %155
  %157 = load i32, ptr %156, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [1048576 x float], ptr @RC, i64 0, i64 %158
  %160 = load float, ptr %159, align 4
  %161 = fdiv float %160, 1.000000e+06
  %162 = fpext float %161 to double
  %163 = load double, ptr @total, align 8
  %164 = fadd double %163, %162
  store double %164, ptr @total, align 8
  br label %165

165:                                              ; preds = %150, %138
  br label %166

166:                                              ; preds = %165
  %167 = load i32, ptr %7, align 4
  %168 = add nsw i32 %167, 3
  store i32 %168, ptr %7, align 4
  br label %134

169:                                              ; preds = %134
  br label %170

170:                                              ; preds = %169
  %171 = load i32, ptr %6, align 4
  %172 = add nsw i32 %171, 2
  store i32 %172, ptr %6, align 4
  br label %129

173:                                              ; preds = %129
  %174 = load i32, ptr @size, align 4
  %175 = icmp eq i32 %174, 64
  br i1 %175, label %176, label %179

176:                                              ; preds = %173
  %177 = load double, ptr @total, align 8
  %178 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %177)
  br label %182

179:                                              ; preds = %173
  %180 = load double, ptr @total, align 8
  %181 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, double noundef %180)
  br label %182

182:                                              ; preds = %179, %176
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind willreturn memory(read) }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
