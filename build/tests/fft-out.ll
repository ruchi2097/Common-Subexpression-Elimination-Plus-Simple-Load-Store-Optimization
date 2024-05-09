; ModuleID = 'fft-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"Usage: fft <waves> <length> -i\0A\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"-i performs an inverse fft\0A\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"make <waves> random sinusoids\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"<length> is the number of samples\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"-i\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"RealOut:\0A\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"%f \09\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"ImagOut:\0A\00", align 1
@.str.9 = private unnamed_addr constant [73 x i8] c">>> Error in fftmisc.c: argument %d to NumberOfBitsNeeded is too small.\0A\00", align 1
@stderr = external global ptr, align 8
@.str.12 = private unnamed_addr constant [52 x i8] c"Error in fft():  NumSamples=%u is not power of two\0A\00", align 1
@.str.1.13 = private unnamed_addr constant [7 x i8] c"RealIn\00", align 1
@.str.2.14 = private unnamed_addr constant [8 x i8] c"RealOut\00", align 1
@.str.3.15 = private unnamed_addr constant [8 x i8] c"ImagOut\00", align 1
@.str.4.16 = private unnamed_addr constant [35 x i8] c"Error in fft_float():  %s == NULL\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i32 0, ptr %16, align 4
  %17 = load i32, ptr %4, align 4
  %18 = icmp slt i32 %17, 3
  br i1 %18, label %19, label %24

19:                                               ; preds = %2
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %22 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %23 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  call void @exit(i32 noundef -1) #7
  unreachable

24:                                               ; preds = %2
  %25 = load i32, ptr %4, align 4
  %26 = icmp eq i32 %25, 4
  br i1 %26, label %27, label %35

27:                                               ; preds = %24
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds ptr, ptr %28, i64 3
  %30 = load ptr, ptr %29, align 8
  %31 = call i32 @strncmp(ptr noundef %30, ptr noundef @.str.4, i64 noundef 2) #8
  %32 = icmp ne i32 %31, 0
  %33 = xor i1 %32, true
  %34 = zext i1 %33 to i32
  store i32 %34, ptr %16, align 4
  br label %35

35:                                               ; preds = %27, %24
  br label %36

36:                                               ; preds = %35
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds ptr, ptr %37, i64 2
  %39 = load ptr, ptr %38, align 8
  %40 = call i32 @atoi(ptr noundef %39) #8
  store i32 %40, ptr %6, align 4
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds ptr, ptr %41, i64 1
  %43 = load ptr, ptr %42, align 8
  %44 = call i32 @atoi(ptr noundef %43) #8
  store i32 %44, ptr %7, align 4
  call void @srand(i32 noundef 1) #9
  %45 = load i32, ptr %6, align 4
  %46 = zext i32 %45 to i64
  %47 = mul i64 4, %46
  %48 = call noalias ptr @malloc(i64 noundef %47) #10
  store ptr %48, ptr %10, align 8
  %49 = load i32, ptr %6, align 4
  %50 = zext i32 %49 to i64
  %51 = mul i64 4, %50
  %52 = call noalias ptr @malloc(i64 noundef %51) #10
  store ptr %52, ptr %11, align 8
  %53 = load i32, ptr %6, align 4
  %54 = zext i32 %53 to i64
  %55 = mul i64 4, %54
  %56 = call noalias ptr @malloc(i64 noundef %55) #10
  store ptr %56, ptr %12, align 8
  %57 = load i32, ptr %6, align 4
  %58 = zext i32 %57 to i64
  %59 = mul i64 4, %58
  %60 = call noalias ptr @malloc(i64 noundef %59) #10
  store ptr %60, ptr %13, align 8
  %61 = load i32, ptr %7, align 4
  %62 = zext i32 %61 to i64
  %63 = mul i64 4, %62
  %64 = call noalias ptr @malloc(i64 noundef %63) #10
  store ptr %64, ptr %14, align 8
  %65 = load i32, ptr %7, align 4
  %66 = zext i32 %65 to i64
  %67 = mul i64 4, %66
  %68 = call noalias ptr @malloc(i64 noundef %67) #10
  store ptr %68, ptr %15, align 8
  store i32 0, ptr %8, align 4
  br label %69

69:                                               ; preds = %88, %36
  %70 = load i32, ptr %8, align 4
  %71 = load i32, ptr %7, align 4
  %72 = icmp ult i32 %70, %71
  br i1 %72, label %73, label %91

73:                                               ; preds = %69
  %74 = call i32 @rand() #9
  %75 = srem i32 %74, 1000
  %76 = sitofp i32 %75 to float
  %77 = load ptr, ptr %14, align 8
  %78 = load i32, ptr %8, align 4
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds float, ptr %77, i64 %79
  store float %76, ptr %80, align 4
  %81 = call i32 @rand() #9
  %82 = srem i32 %81, 1000
  %83 = sitofp i32 %82 to float
  %84 = load ptr, ptr %15, align 8
  %85 = load i32, ptr %8, align 4
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds float, ptr %84, i64 %86
  store float %83, ptr %87, align 4
  br label %88

88:                                               ; preds = %73
  %89 = load i32, ptr %8, align 4
  %90 = add i32 %89, 1
  store i32 %90, ptr %8, align 4
  br label %69

91:                                               ; preds = %69
  store i32 0, ptr %8, align 4
  br label %92

92:                                               ; preds = %164, %91
  %93 = load i32, ptr %8, align 4
  %94 = load i32, ptr %6, align 4
  %95 = icmp ult i32 %93, %94
  br i1 %95, label %96, label %167

96:                                               ; preds = %92
  %97 = load ptr, ptr %10, align 8
  %98 = load i32, ptr %8, align 4
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds float, ptr %97, i64 %99
  store float 0.000000e+00, ptr %100, align 4
  store i32 0, ptr %9, align 4
  br label %101

101:                                              ; preds = %160, %96
  %102 = load i32, ptr %9, align 4
  %103 = load i32, ptr %7, align 4
  %104 = icmp ult i32 %102, %103
  br i1 %104, label %105, label %163

105:                                              ; preds = %101
  %106 = call i32 @rand() #9
  %107 = srem i32 %106, 2
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %132

109:                                              ; preds = %105
  %110 = load ptr, ptr %14, align 8
  %111 = load i32, ptr %9, align 4
  %112 = zext i32 %111 to i64
  %113 = getelementptr inbounds float, ptr %110, i64 %112
  %114 = load float, ptr %113, align 4
  %115 = fpext float %114 to double
  %116 = load ptr, ptr %15, align 8
  %117 = getelementptr inbounds float, ptr %116, i64 %112
  %118 = load float, ptr %117, align 4
  %119 = load i32, ptr %8, align 4
  %120 = uitofp i32 %119 to float
  %121 = fmul float %118, %120
  %122 = fpext float %121 to double
  %123 = call double @cos(double noundef %122) #9
  %124 = load ptr, ptr %10, align 8
  %125 = load i32, ptr %8, align 4
  %126 = zext i32 %125 to i64
  %127 = getelementptr inbounds float, ptr %124, i64 %126
  %128 = load float, ptr %127, align 4
  %129 = fpext float %128 to double
  %130 = call double @llvm.fmuladd.f64(double %115, double %123, double %129)
  %131 = fptrunc double %130 to float
  store float %131, ptr %127, align 4
  br label %155

132:                                              ; preds = %105
  %133 = load ptr, ptr %14, align 8
  %134 = load i32, ptr %9, align 4
  %135 = zext i32 %134 to i64
  %136 = getelementptr inbounds float, ptr %133, i64 %135
  %137 = load float, ptr %136, align 4
  %138 = fpext float %137 to double
  %139 = load ptr, ptr %15, align 8
  %140 = getelementptr inbounds float, ptr %139, i64 %135
  %141 = load float, ptr %140, align 4
  %142 = load i32, ptr %8, align 4
  %143 = uitofp i32 %142 to float
  %144 = fmul float %141, %143
  %145 = fpext float %144 to double
  %146 = call double @sin(double noundef %145) #9
  %147 = load ptr, ptr %10, align 8
  %148 = load i32, ptr %8, align 4
  %149 = zext i32 %148 to i64
  %150 = getelementptr inbounds float, ptr %147, i64 %149
  %151 = load float, ptr %150, align 4
  %152 = fpext float %151 to double
  %153 = call double @llvm.fmuladd.f64(double %138, double %146, double %152)
  %154 = fptrunc double %153 to float
  store float %154, ptr %150, align 4
  br label %155

155:                                              ; preds = %132, %109
  %156 = load ptr, ptr %11, align 8
  %157 = load i32, ptr %8, align 4
  %158 = zext i32 %157 to i64
  %159 = getelementptr inbounds float, ptr %156, i64 %158
  store float 0.000000e+00, ptr %159, align 4
  br label %160

160:                                              ; preds = %155
  %161 = load i32, ptr %9, align 4
  %162 = add i32 %161, 1
  store i32 %162, ptr %9, align 4
  br label %101

163:                                              ; preds = %101
  br label %164

164:                                              ; preds = %163
  %165 = load i32, ptr %8, align 4
  %166 = add i32 %165, 1
  store i32 %166, ptr %8, align 4
  br label %92

167:                                              ; preds = %92
  %168 = load i32, ptr %6, align 4
  %169 = load i32, ptr %16, align 4
  %170 = load ptr, ptr %10, align 8
  %171 = load ptr, ptr %11, align 8
  %172 = load ptr, ptr %12, align 8
  %173 = load ptr, ptr %13, align 8
  %174 = call i32 (i32, i32, ptr, ptr, ptr, ptr, ...) @fft_float(i32 noundef %168, i32 noundef %169, ptr noundef %170, ptr noundef %171, ptr noundef %172, ptr noundef %173)
  %175 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  store i32 0, ptr %8, align 4
  br label %176

176:                                              ; preds = %188, %167
  %177 = load i32, ptr %8, align 4
  %178 = load i32, ptr %6, align 4
  %179 = icmp ult i32 %177, %178
  br i1 %179, label %180, label %191

180:                                              ; preds = %176
  %181 = load ptr, ptr %12, align 8
  %182 = load i32, ptr %8, align 4
  %183 = zext i32 %182 to i64
  %184 = getelementptr inbounds float, ptr %181, i64 %183
  %185 = load float, ptr %184, align 4
  %186 = fpext float %185 to double
  %187 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, double noundef %186)
  br label %188

188:                                              ; preds = %180
  %189 = load i32, ptr %8, align 4
  %190 = add i32 %189, 1
  store i32 %190, ptr %8, align 4
  br label %176

191:                                              ; preds = %176
  %192 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %193 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  store i32 0, ptr %8, align 4
  br label %194

194:                                              ; preds = %206, %191
  %195 = load i32, ptr %8, align 4
  %196 = load i32, ptr %6, align 4
  %197 = icmp ult i32 %195, %196
  br i1 %197, label %198, label %209

198:                                              ; preds = %194
  %199 = load ptr, ptr %13, align 8
  %200 = load i32, ptr %8, align 4
  %201 = zext i32 %200 to i64
  %202 = getelementptr inbounds float, ptr %199, i64 %201
  %203 = load float, ptr %202, align 4
  %204 = fpext float %203 to double
  %205 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, double noundef %204)
  br label %206

206:                                              ; preds = %198
  %207 = load i32, ptr %8, align 4
  %208 = add i32 %207, 1
  store i32 %208, ptr %8, align 4
  br label %194

209:                                              ; preds = %194
  %210 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %211 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %211) #9
  %212 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %212) #9
  %213 = load ptr, ptr %12, align 8
  call void @free(ptr noundef %213) #9
  %214 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %214) #9
  %215 = load ptr, ptr %14, align 8
  call void @free(ptr noundef %215) #9
  %216 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %216) #9
  call void @exit(i32 noundef 0) #7
  unreachable
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strncmp(ptr noundef, ptr noundef, i64 noundef) #3

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #3

; Function Attrs: nounwind
declare void @srand(i32 noundef) #4

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #5

; Function Attrs: nounwind
declare i32 @rand() #4

; Function Attrs: nounwind
declare double @cos(double noundef) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #6

; Function Attrs: nounwind
declare double @sin(double noundef) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @IsPowerOfTwo(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = icmp ult i32 %0, 2
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %13

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = sub i32 %7, 1
  %9 = and i32 %7, %8
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %6
  store i32 0, ptr %2, align 4
  br label %13

12:                                               ; preds = %6
  store i32 1, ptr %2, align 4
  br label %13

13:                                               ; preds = %12, %11, %5
  %14 = load i32, ptr %2, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @NumberOfBitsNeeded(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = icmp ult i32 %0, 2
  br i1 %4, label %5, label %9

5:                                                ; preds = %1
  %6 = load ptr, ptr @stderr, align 8
  %7 = load i32, ptr %2, align 4
  %8 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %6, ptr noundef @.str.9, i32 noundef %7)
  call void @exit(i32 noundef 1) #7
  unreachable

9:                                                ; preds = %1
  store i32 0, ptr %3, align 4
  br label %10

10:                                               ; preds = %19, %9
  %11 = load i32, ptr %2, align 4
  %12 = load i32, ptr %3, align 4
  %13 = shl i32 1, %12
  %14 = and i32 %11, %13
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %10
  %17 = load i32, ptr %3, align 4
  ret i32 %17

18:                                               ; preds = %10
  br label %19

19:                                               ; preds = %18
  %20 = load i32, ptr %3, align 4
  %21 = add i32 %20, 1
  store i32 %21, ptr %3, align 4
  br label %10
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ReverseBits(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %5, align 4
  br label %7

7:                                                ; preds = %19, %2
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp ult i32 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load i32, ptr %6, align 4
  %13 = shl i32 %12, 1
  %14 = load i32, ptr %3, align 4
  %15 = and i32 %14, 1
  %16 = or i32 %13, %15
  store i32 %16, ptr %6, align 4
  %17 = load i32, ptr %3, align 4
  %18 = lshr i32 %17, 1
  store i32 %18, ptr %3, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i32, ptr %5, align 4
  %21 = add i32 %20, 1
  store i32 %21, ptr %5, align 4
  br label %7

22:                                               ; preds = %7
  %23 = load i32, ptr %6, align 4
  ret i32 %23
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @Index_to_frequency(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %6 = load i32, ptr %4, align 4
  %7 = icmp uge i32 %1, %6
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store double 0.000000e+00, ptr %3, align 8
  br label %29

9:                                                ; preds = %2
  %10 = load i32, ptr %5, align 4
  %11 = load i32, ptr %4, align 4
  %12 = udiv i32 %11, 2
  %13 = icmp ule i32 %10, %12
  br i1 %13, label %14, label %20

14:                                               ; preds = %9
  %15 = load i32, ptr %5, align 4
  %16 = uitofp i32 %15 to double
  %17 = load i32, ptr %4, align 4
  %18 = uitofp i32 %17 to double
  %19 = fdiv double %16, %18
  store double %19, ptr %3, align 8
  br label %29

20:                                               ; preds = %9
  br label %21

21:                                               ; preds = %20
  %22 = load i32, ptr %4, align 4
  %23 = load i32, ptr %5, align 4
  %24 = sub i32 %22, %23
  %25 = uitofp i32 %24 to double
  %26 = fneg double %25
  %27 = uitofp i32 %22 to double
  %28 = fdiv double %26, %27
  store double %28, ptr %3, align 8
  br label %29

29:                                               ; preds = %21, %14, %8
  %30 = load double, ptr %3, align 8
  ret double %30
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @fft_float(i32 noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca double, align 8
  %21 = alloca double, align 8
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca double, align 8
  %25 = alloca double, align 8
  %26 = alloca double, align 8
  %27 = alloca double, align 8
  %28 = alloca double, align 8
  %29 = alloca [3 x double], align 16
  %30 = alloca [3 x double], align 16
  %31 = alloca double, align 8
  store i32 %0, ptr %7, align 4
  store i32 %1, ptr %8, align 4
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  store double 0x401921FB54442D18, ptr %20, align 8
  %32 = load i32, ptr %7, align 4
  %33 = call i32 @IsPowerOfTwo(i32 noundef %32)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %39, label %35

35:                                               ; preds = %6
  %36 = load ptr, ptr @stderr, align 8
  %37 = load i32, ptr %7, align 4
  %38 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %36, ptr noundef @.str.12, i32 noundef %37)
  call void @exit(i32 noundef 1) #7
  unreachable

39:                                               ; preds = %6
  %40 = load i32, ptr %8, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %45

42:                                               ; preds = %39
  %43 = load double, ptr %20, align 8
  %44 = fneg double %43
  store double %44, ptr %20, align 8
  br label %45

45:                                               ; preds = %42, %39
  %46 = load ptr, ptr %9, align 8
  call void @CheckPointer(ptr noundef %46, ptr noundef @.str.1.13)
  %47 = load ptr, ptr %11, align 8
  call void @CheckPointer(ptr noundef %47, ptr noundef @.str.2.14)
  %48 = load ptr, ptr %12, align 8
  call void @CheckPointer(ptr noundef %48, ptr noundef @.str.3.15)
  %49 = load i32, ptr %7, align 4
  %50 = call i32 @NumberOfBitsNeeded(i32 noundef %49)
  store i32 %50, ptr %13, align 4
  store i32 0, ptr %14, align 4
  br label %51

51:                                               ; preds = %85, %45
  %52 = load i32, ptr %14, align 4
  %53 = load i32, ptr %7, align 4
  %54 = icmp ult i32 %52, %53
  br i1 %54, label %55, label %88

55:                                               ; preds = %51
  %56 = load i32, ptr %14, align 4
  %57 = load i32, ptr %13, align 4
  %58 = call i32 @ReverseBits(i32 noundef %56, i32 noundef %57)
  store i32 %58, ptr %15, align 4
  %59 = load ptr, ptr %9, align 8
  %60 = load i32, ptr %14, align 4
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds float, ptr %59, i64 %61
  %63 = load float, ptr %62, align 4
  %64 = load ptr, ptr %11, align 8
  %65 = load i32, ptr %15, align 4
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, ptr %64, i64 %66
  store float %63, ptr %67, align 4
  %68 = load ptr, ptr %10, align 8
  %69 = icmp eq ptr %68, null
  br i1 %69, label %70, label %71

70:                                               ; preds = %55
  br label %78

71:                                               ; preds = %55
  %72 = load ptr, ptr %10, align 8
  %73 = load i32, ptr %14, align 4
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds float, ptr %72, i64 %74
  %76 = load float, ptr %75, align 4
  %77 = fpext float %76 to double
  br label %78

78:                                               ; preds = %71, %70
  %79 = phi double [ 0.000000e+00, %70 ], [ %77, %71 ]
  %80 = fptrunc double %79 to float
  %81 = load ptr, ptr %12, align 8
  %82 = load i32, ptr %15, align 4
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds float, ptr %81, i64 %83
  store float %80, ptr %84, align 4
  br label %85

85:                                               ; preds = %78
  %86 = load i32, ptr %14, align 4
  %87 = add i32 %86, 1
  store i32 %87, ptr %14, align 4
  br label %51

88:                                               ; preds = %51
  store i32 1, ptr %19, align 4
  store i32 2, ptr %18, align 4
  br label %89

89:                                               ; preds = %233, %88
  %90 = load i32, ptr %18, align 4
  %91 = load i32, ptr %7, align 4
  %92 = icmp ule i32 %90, %91
  br i1 %92, label %93, label %236

93:                                               ; preds = %89
  %94 = load double, ptr %20, align 8
  %95 = load i32, ptr %18, align 4
  %96 = uitofp i32 %95 to double
  %97 = fdiv double %94, %96
  store double %97, ptr %23, align 8
  %98 = fmul double -2.000000e+00, %97
  %99 = call double @sin(double noundef %98) #9
  store double %99, ptr %24, align 8
  %100 = load double, ptr %23, align 8
  %101 = fneg double %100
  %102 = call double @sin(double noundef %101) #9
  store double %102, ptr %25, align 8
  %103 = load double, ptr %23, align 8
  %104 = fmul double -2.000000e+00, %103
  %105 = call double @cos(double noundef %104) #9
  store double %105, ptr %26, align 8
  %106 = load double, ptr %23, align 8
  %107 = fneg double %106
  %108 = call double @cos(double noundef %107) #9
  store double %108, ptr %27, align 8
  %109 = fmul double 2.000000e+00, %108
  store double %109, ptr %28, align 8
  store i32 0, ptr %14, align 4
  br label %110

110:                                              ; preds = %227, %93
  %111 = load i32, ptr %14, align 4
  %112 = load i32, ptr %7, align 4
  %113 = icmp ult i32 %111, %112
  br i1 %113, label %114, label %231

114:                                              ; preds = %110
  %115 = load double, ptr %26, align 8
  %116 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 2
  store double %115, ptr %116, align 16
  %117 = load double, ptr %27, align 8
  %118 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 1
  store double %117, ptr %118, align 8
  %119 = load double, ptr %24, align 8
  %120 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 2
  store double %119, ptr %120, align 16
  %121 = load double, ptr %25, align 8
  %122 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 1
  store double %121, ptr %122, align 8
  %123 = load i32, ptr %14, align 4
  store i32 %123, ptr %15, align 4
  store i32 0, ptr %17, align 4
  br label %124

124:                                              ; preds = %221, %114
  %125 = load i32, ptr %17, align 4
  %126 = load i32, ptr %19, align 4
  %127 = icmp ult i32 %125, %126
  br i1 %127, label %128, label %226

128:                                              ; preds = %124
  %129 = load double, ptr %28, align 8
  %130 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 1
  %131 = load double, ptr %130, align 8
  %132 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 2
  %133 = load double, ptr %132, align 16
  %134 = fneg double %133
  %135 = call double @llvm.fmuladd.f64(double %129, double %131, double %134)
  store double %135, ptr %29, align 16
  %136 = load double, ptr %130, align 8
  store double %136, ptr %132, align 16
  %137 = load double, ptr %29, align 16
  store double %137, ptr %130, align 8
  %138 = load double, ptr %28, align 8
  %139 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 1
  %140 = load double, ptr %139, align 8
  %141 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 2
  %142 = load double, ptr %141, align 16
  %143 = fneg double %142
  %144 = call double @llvm.fmuladd.f64(double %138, double %140, double %143)
  store double %144, ptr %30, align 16
  %145 = load double, ptr %139, align 8
  store double %145, ptr %141, align 16
  %146 = load double, ptr %30, align 16
  store double %146, ptr %139, align 8
  %147 = load i32, ptr %15, align 4
  %148 = load i32, ptr %19, align 4
  %149 = add i32 %147, %148
  store i32 %149, ptr %16, align 4
  %150 = load double, ptr %29, align 16
  %151 = load ptr, ptr %11, align 8
  %152 = load i32, ptr %16, align 4
  %153 = zext i32 %152 to i64
  %154 = getelementptr inbounds float, ptr %151, i64 %153
  %155 = load float, ptr %154, align 4
  %156 = fpext float %155 to double
  %157 = load double, ptr %30, align 16
  %158 = load ptr, ptr %12, align 8
  %159 = getelementptr inbounds float, ptr %158, i64 %153
  %160 = load float, ptr %159, align 4
  %161 = fpext float %160 to double
  %162 = fmul double %157, %161
  %163 = fneg double %162
  %164 = call double @llvm.fmuladd.f64(double %150, double %156, double %163)
  store double %164, ptr %21, align 8
  %165 = load double, ptr %29, align 16
  %166 = load ptr, ptr %12, align 8
  %167 = load i32, ptr %16, align 4
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds float, ptr %166, i64 %168
  %170 = load float, ptr %169, align 4
  %171 = fpext float %170 to double
  %172 = load double, ptr %30, align 16
  %173 = load ptr, ptr %11, align 8
  %174 = getelementptr inbounds float, ptr %173, i64 %168
  %175 = load float, ptr %174, align 4
  %176 = fpext float %175 to double
  %177 = fmul double %172, %176
  %178 = call double @llvm.fmuladd.f64(double %165, double %171, double %177)
  store double %178, ptr %22, align 8
  %179 = load ptr, ptr %11, align 8
  %180 = load i32, ptr %15, align 4
  %181 = zext i32 %180 to i64
  %182 = getelementptr inbounds float, ptr %179, i64 %181
  %183 = load float, ptr %182, align 4
  %184 = fpext float %183 to double
  %185 = load double, ptr %21, align 8
  %186 = fsub double %184, %185
  %187 = fptrunc double %186 to float
  %188 = load i32, ptr %16, align 4
  %189 = zext i32 %188 to i64
  %190 = getelementptr inbounds float, ptr %179, i64 %189
  store float %187, ptr %190, align 4
  %191 = load ptr, ptr %12, align 8
  %192 = load i32, ptr %15, align 4
  %193 = zext i32 %192 to i64
  %194 = getelementptr inbounds float, ptr %191, i64 %193
  %195 = load float, ptr %194, align 4
  %196 = fpext float %195 to double
  %197 = load double, ptr %22, align 8
  %198 = fsub double %196, %197
  %199 = fptrunc double %198 to float
  %200 = load i32, ptr %16, align 4
  %201 = zext i32 %200 to i64
  %202 = getelementptr inbounds float, ptr %191, i64 %201
  store float %199, ptr %202, align 4
  %203 = load double, ptr %21, align 8
  %204 = load ptr, ptr %11, align 8
  %205 = load i32, ptr %15, align 4
  %206 = zext i32 %205 to i64
  %207 = getelementptr inbounds float, ptr %204, i64 %206
  %208 = load float, ptr %207, align 4
  %209 = fpext float %208 to double
  %210 = fadd double %209, %203
  %211 = fptrunc double %210 to float
  store float %211, ptr %207, align 4
  %212 = load double, ptr %22, align 8
  %213 = load ptr, ptr %12, align 8
  %214 = load i32, ptr %15, align 4
  %215 = zext i32 %214 to i64
  %216 = getelementptr inbounds float, ptr %213, i64 %215
  %217 = load float, ptr %216, align 4
  %218 = fpext float %217 to double
  %219 = fadd double %218, %212
  %220 = fptrunc double %219 to float
  store float %220, ptr %216, align 4
  br label %221

221:                                              ; preds = %128
  %222 = load i32, ptr %15, align 4
  %223 = add i32 %222, 1
  store i32 %223, ptr %15, align 4
  %224 = load i32, ptr %17, align 4
  %225 = add i32 %224, 1
  store i32 %225, ptr %17, align 4
  br label %124

226:                                              ; preds = %124
  br label %227

227:                                              ; preds = %226
  %228 = load i32, ptr %18, align 4
  %229 = load i32, ptr %14, align 4
  %230 = add i32 %229, %228
  store i32 %230, ptr %14, align 4
  br label %110

231:                                              ; preds = %110
  %232 = load i32, ptr %18, align 4
  store i32 %232, ptr %19, align 4
  br label %233

233:                                              ; preds = %231
  %234 = load i32, ptr %18, align 4
  %235 = shl i32 %234, 1
  store i32 %235, ptr %18, align 4
  br label %89

236:                                              ; preds = %89
  %237 = load i32, ptr %8, align 4
  %238 = icmp ne i32 %237, 0
  br i1 %238, label %239, label %269

239:                                              ; preds = %236
  %240 = load i32, ptr %7, align 4
  %241 = uitofp i32 %240 to double
  store double %241, ptr %31, align 8
  store i32 0, ptr %14, align 4
  br label %242

242:                                              ; preds = %265, %239
  %243 = load i32, ptr %14, align 4
  %244 = load i32, ptr %7, align 4
  %245 = icmp ult i32 %243, %244
  br i1 %245, label %246, label %268

246:                                              ; preds = %242
  %247 = load double, ptr %31, align 8
  %248 = load ptr, ptr %11, align 8
  %249 = load i32, ptr %14, align 4
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds float, ptr %248, i64 %250
  %252 = load float, ptr %251, align 4
  %253 = fpext float %252 to double
  %254 = fdiv double %253, %247
  %255 = fptrunc double %254 to float
  store float %255, ptr %251, align 4
  %256 = load double, ptr %31, align 8
  %257 = load ptr, ptr %12, align 8
  %258 = load i32, ptr %14, align 4
  %259 = zext i32 %258 to i64
  %260 = getelementptr inbounds float, ptr %257, i64 %259
  %261 = load float, ptr %260, align 4
  %262 = fpext float %261 to double
  %263 = fdiv double %262, %256
  %264 = fptrunc double %263 to float
  store float %264, ptr %260, align 4
  br label %265

265:                                              ; preds = %246
  %266 = load i32, ptr %14, align 4
  %267 = add i32 %266, 1
  store i32 %267, ptr %14, align 4
  br label %242

268:                                              ; preds = %242
  br label %269

269:                                              ; preds = %268, %236
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @CheckPointer(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = load ptr, ptr @stderr, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef @.str.4.16, ptr noundef %9)
  call void @exit(i32 noundef 1) #7
  unreachable

11:                                               ; preds = %2
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { nounwind }
attributes #10 = { nounwind allocsize(0) }

!llvm.ident = !{!0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
