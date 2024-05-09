; ModuleID = 'basicmath-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.int_sqrt = type { i32, i32 }

@.str = private unnamed_addr constant [39 x i8] c"********* CUBIC FUNCTIONS ***********\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"Solutions:\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c" %f\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.4 = private unnamed_addr constant [41 x i8] c"********* INTEGER SQR ROOTS ***********\0A\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"sqrt(%3d) = %2d\0A\00", align 1
@.str.6 = private unnamed_addr constant [33 x i8] c"\0Asqrt(%lX) = %X, remainder = %X\0A\00", align 1
@.str.7 = private unnamed_addr constant [16 x i8] c"sqrt(%lX) = %X\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca [3 x double], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca %struct.int_sqrt, align 4
  %11 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  store double 1.000000e+00, ptr %2, align 8
  store double -1.050000e+01, ptr %3, align 8
  store double 3.200000e+01, ptr %4, align 8
  store double -3.000000e+01, ptr %5, align 8
  store i64 1072497001, ptr %9, align 8
  store i64 0, ptr %11, align 8
  %12 = load double, ptr %2, align 8
  %13 = load double, ptr %3, align 8
  %14 = load double, ptr %4, align 8
  %15 = load double, ptr %5, align 8
  call void @SolveCubic(double noundef %12, double noundef %13, double noundef %14, double noundef %15, ptr noundef %7, ptr noundef %6)
  store i32 0, ptr %8, align 4
  br label %16

16:                                               ; preds = %22, %0
  %17 = load i32, ptr %8, align 4
  %18 = icmp slt i32 %17, 100
  br i1 %18, label %19, label %25

19:                                               ; preds = %16
  %20 = load i32, ptr %8, align 4
  %21 = sext i32 %20 to i64
  call void @usqrt(i64 noundef %21, ptr noundef %10)
  br label %22

22:                                               ; preds = %19
  %23 = load i32, ptr %8, align 4
  %24 = add nsw i32 %23, 2
  store i32 %24, ptr %8, align 4
  br label %16

25:                                               ; preds = %16
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %27 = load double, ptr %2, align 8
  %28 = load double, ptr %3, align 8
  %29 = load double, ptr %4, align 8
  %30 = load double, ptr %5, align 8
  call void @SolveCubic(double noundef %27, double noundef %28, double noundef %29, double noundef %30, ptr noundef %7, ptr noundef %6)
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %8, align 4
  br label %32

32:                                               ; preds = %42, %25
  %33 = load i32, ptr %8, align 4
  %34 = load i32, ptr %7, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %45

36:                                               ; preds = %32
  %37 = load i32, ptr %8, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %38
  %40 = load double, ptr %39, align 8
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %40)
  br label %42

42:                                               ; preds = %36
  %43 = load i32, ptr %8, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %8, align 4
  br label %32

45:                                               ; preds = %32
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double 1.000000e+00, ptr %2, align 8
  store double -4.500000e+00, ptr %3, align 8
  store double 1.700000e+01, ptr %4, align 8
  store double -3.000000e+01, ptr %5, align 8
  %47 = load double, ptr %2, align 8
  %48 = load double, ptr %3, align 8
  %49 = load double, ptr %4, align 8
  %50 = load double, ptr %5, align 8
  call void @SolveCubic(double noundef %47, double noundef %48, double noundef %49, double noundef %50, ptr noundef %7, ptr noundef %6)
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %8, align 4
  br label %52

52:                                               ; preds = %62, %45
  %53 = load i32, ptr %8, align 4
  %54 = load i32, ptr %7, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %65

56:                                               ; preds = %52
  %57 = load i32, ptr %8, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %58
  %60 = load double, ptr %59, align 8
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %60)
  br label %62

62:                                               ; preds = %56
  %63 = load i32, ptr %8, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, ptr %8, align 4
  br label %52

65:                                               ; preds = %52
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double 1.000000e+00, ptr %2, align 8
  store double -3.500000e+00, ptr %3, align 8
  store double 2.200000e+01, ptr %4, align 8
  store double -3.100000e+01, ptr %5, align 8
  %67 = load double, ptr %2, align 8
  %68 = load double, ptr %3, align 8
  %69 = load double, ptr %4, align 8
  %70 = load double, ptr %5, align 8
  call void @SolveCubic(double noundef %67, double noundef %68, double noundef %69, double noundef %70, ptr noundef %7, ptr noundef %6)
  %71 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %8, align 4
  br label %72

72:                                               ; preds = %82, %65
  %73 = load i32, ptr %8, align 4
  %74 = load i32, ptr %7, align 4
  %75 = icmp slt i32 %73, %74
  br i1 %75, label %76, label %85

76:                                               ; preds = %72
  %77 = load i32, ptr %8, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %78
  %80 = load double, ptr %79, align 8
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %80)
  br label %82

82:                                               ; preds = %76
  %83 = load i32, ptr %8, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, ptr %8, align 4
  br label %72

85:                                               ; preds = %72
  %86 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double 1.000000e+00, ptr %2, align 8
  store double -1.370000e+01, ptr %3, align 8
  store double 1.000000e+00, ptr %4, align 8
  store double -3.500000e+01, ptr %5, align 8
  %87 = load double, ptr %2, align 8
  %88 = load double, ptr %3, align 8
  %89 = load double, ptr %4, align 8
  %90 = load double, ptr %5, align 8
  call void @SolveCubic(double noundef %87, double noundef %88, double noundef %89, double noundef %90, ptr noundef %7, ptr noundef %6)
  %91 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %8, align 4
  br label %92

92:                                               ; preds = %102, %85
  %93 = load i32, ptr %8, align 4
  %94 = load i32, ptr %7, align 4
  %95 = icmp slt i32 %93, %94
  br i1 %95, label %96, label %105

96:                                               ; preds = %92
  %97 = load i32, ptr %8, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %98
  %100 = load double, ptr %99, align 8
  %101 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %100)
  br label %102

102:                                              ; preds = %96
  %103 = load i32, ptr %8, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, ptr %8, align 4
  br label %92

105:                                              ; preds = %92
  %106 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double 3.000000e+00, ptr %2, align 8
  store double 1.234000e+01, ptr %3, align 8
  store double 5.000000e+00, ptr %4, align 8
  store double 1.200000e+01, ptr %5, align 8
  %107 = load double, ptr %2, align 8
  %108 = load double, ptr %3, align 8
  %109 = load double, ptr %4, align 8
  %110 = load double, ptr %5, align 8
  call void @SolveCubic(double noundef %107, double noundef %108, double noundef %109, double noundef %110, ptr noundef %7, ptr noundef %6)
  %111 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %8, align 4
  br label %112

112:                                              ; preds = %122, %105
  %113 = load i32, ptr %8, align 4
  %114 = load i32, ptr %7, align 4
  %115 = icmp slt i32 %113, %114
  br i1 %115, label %116, label %125

116:                                              ; preds = %112
  %117 = load i32, ptr %8, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %118
  %120 = load double, ptr %119, align 8
  %121 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %120)
  br label %122

122:                                              ; preds = %116
  %123 = load i32, ptr %8, align 4
  %124 = add nsw i32 %123, 1
  store i32 %124, ptr %8, align 4
  br label %112

125:                                              ; preds = %112
  %126 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double -8.000000e+00, ptr %2, align 8
  store double -6.789000e+01, ptr %3, align 8
  store double 6.000000e+00, ptr %4, align 8
  store double -2.360000e+01, ptr %5, align 8
  %127 = load double, ptr %2, align 8
  %128 = load double, ptr %3, align 8
  %129 = load double, ptr %4, align 8
  %130 = load double, ptr %5, align 8
  call void @SolveCubic(double noundef %127, double noundef %128, double noundef %129, double noundef %130, ptr noundef %7, ptr noundef %6)
  %131 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %132 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double 4.500000e+01, ptr %2, align 8
  store double 8.670000e+00, ptr %3, align 8
  store double 7.500000e+00, ptr %4, align 8
  store double 3.400000e+01, ptr %5, align 8
  %133 = load double, ptr %2, align 8
  %134 = load double, ptr %3, align 8
  %135 = load double, ptr %4, align 8
  %136 = load double, ptr %5, align 8
  call void @SolveCubic(double noundef %133, double noundef %134, double noundef %135, double noundef %136, ptr noundef %7, ptr noundef %6)
  %137 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %138 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double -1.200000e+01, ptr %2, align 8
  store double -1.700000e+00, ptr %3, align 8
  store double 5.300000e+00, ptr %4, align 8
  store double 1.600000e+01, ptr %5, align 8
  %139 = load double, ptr %2, align 8
  %140 = load double, ptr %3, align 8
  %141 = load double, ptr %4, align 8
  %142 = load double, ptr %5, align 8
  call void @SolveCubic(double noundef %139, double noundef %140, double noundef %141, double noundef %142, ptr noundef %7, ptr noundef %6)
  %143 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %8, align 4
  br label %144

144:                                              ; preds = %154, %125
  %145 = load i32, ptr %8, align 4
  %146 = load i32, ptr %7, align 4
  %147 = icmp slt i32 %145, %146
  br i1 %147, label %148, label %157

148:                                              ; preds = %144
  %149 = load i32, ptr %8, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %150
  %152 = load double, ptr %151, align 8
  %153 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %152)
  br label %154

154:                                              ; preds = %148
  %155 = load i32, ptr %8, align 4
  %156 = add nsw i32 %155, 1
  store i32 %156, ptr %8, align 4
  br label %144

157:                                              ; preds = %144
  %158 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store double 1.000000e+00, ptr %2, align 8
  br label %159

159:                                              ; preds = %207, %157
  %160 = load double, ptr %2, align 8
  %161 = fcmp olt double %160, 1.000000e+01
  br i1 %161, label %162, label %210

162:                                              ; preds = %159
  store double 1.000000e+01, ptr %3, align 8
  br label %163

163:                                              ; preds = %203, %162
  %164 = load double, ptr %3, align 8
  %165 = fcmp ogt double %164, 0.000000e+00
  br i1 %165, label %166, label %206

166:                                              ; preds = %163
  store double 5.000000e+00, ptr %4, align 8
  br label %167

167:                                              ; preds = %199, %166
  %168 = load double, ptr %4, align 8
  %169 = fcmp olt double %168, 1.500000e+01
  br i1 %169, label %170, label %202

170:                                              ; preds = %167
  store double -1.000000e+00, ptr %5, align 8
  br label %171

171:                                              ; preds = %195, %170
  %172 = load double, ptr %5, align 8
  %173 = fcmp ogt double %172, -5.000000e+00
  br i1 %173, label %174, label %198

174:                                              ; preds = %171
  %175 = load double, ptr %2, align 8
  %176 = load double, ptr %3, align 8
  %177 = load double, ptr %4, align 8
  %178 = load double, ptr %5, align 8
  call void @SolveCubic(double noundef %175, double noundef %176, double noundef %177, double noundef %178, ptr noundef %7, ptr noundef %6)
  %179 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 0, ptr %8, align 4
  br label %180

180:                                              ; preds = %190, %174
  %181 = load i32, ptr %8, align 4
  %182 = load i32, ptr %7, align 4
  %183 = icmp slt i32 %181, %182
  br i1 %183, label %184, label %193

184:                                              ; preds = %180
  %185 = load i32, ptr %8, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %186
  %188 = load double, ptr %187, align 8
  %189 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, double noundef %188)
  br label %190

190:                                              ; preds = %184
  %191 = load i32, ptr %8, align 4
  %192 = add nsw i32 %191, 1
  store i32 %192, ptr %8, align 4
  br label %180

193:                                              ; preds = %180
  %194 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %195

195:                                              ; preds = %193
  %196 = load double, ptr %5, align 8
  %197 = fsub double %196, 4.510000e-01
  store double %197, ptr %5, align 8
  br label %171

198:                                              ; preds = %171
  br label %199

199:                                              ; preds = %198
  %200 = load double, ptr %4, align 8
  %201 = fadd double %200, 6.100000e-01
  store double %201, ptr %4, align 8
  br label %167

202:                                              ; preds = %167
  br label %203

203:                                              ; preds = %202
  %204 = load double, ptr %3, align 8
  %205 = fsub double %204, 2.500000e-01
  store double %205, ptr %3, align 8
  br label %163

206:                                              ; preds = %163
  br label %207

207:                                              ; preds = %206
  %208 = load double, ptr %2, align 8
  %209 = fadd double %208, 1.000000e+00
  store double %209, ptr %2, align 8
  br label %159

210:                                              ; preds = %159
  %211 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 0, ptr %8, align 4
  br label %212

212:                                              ; preds = %221, %210
  %213 = load i32, ptr %8, align 4
  %214 = icmp slt i32 %213, 100000
  br i1 %214, label %215, label %224

215:                                              ; preds = %212
  %216 = load i32, ptr %8, align 4
  %217 = sext i32 %216 to i64
  call void @usqrt(i64 noundef %217, ptr noundef %10)
  %218 = load i32, ptr %8, align 4
  %219 = load i32, ptr %10, align 4
  %220 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %218, i32 noundef %219)
  br label %221

221:                                              ; preds = %215
  %222 = load i32, ptr %8, align 4
  %223 = add nsw i32 %222, 2
  store i32 %223, ptr %8, align 4
  br label %212

224:                                              ; preds = %212
  %225 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i64 1072497001, ptr %9, align 8
  br label %226

226:                                              ; preds = %239, %224
  %227 = load i64, ptr %9, align 8
  %228 = icmp ult i64 %227, 1072513385
  br i1 %228, label %229, label %242

229:                                              ; preds = %226
  %230 = load i64, ptr %9, align 8
  call void @usqrt(i64 noundef %230, ptr noundef %10)
  %231 = load i64, ptr %9, align 8
  %232 = load i32, ptr %10, align 4
  %233 = getelementptr inbounds %struct.int_sqrt, ptr %10, i32 0, i32 1
  %234 = load i32, ptr %233, align 4
  %235 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i64 noundef %231, i32 noundef %232, i32 noundef %234)
  %236 = load i64, ptr %9, align 8
  %237 = load i32, ptr %10, align 4
  %238 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i64 noundef %236, i32 noundef %237)
  br label %239

239:                                              ; preds = %229
  %240 = load i64, ptr %9, align 8
  %241 = add i64 %240, 1
  store i64 %241, ptr %9, align 8
  br label %226

242:                                              ; preds = %226
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local double @rad2deg(double noundef %0) #0 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8
  %3 = fmul double 1.800000e+02, %0
  %4 = call double @atan(double noundef 1.000000e+00) #5
  %5 = fmul double 4.000000e+00, %4
  %6 = fdiv double %3, %5
  ret double %6
}

; Function Attrs: nounwind
declare double @atan(double noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local double @deg2rad(double noundef %0) #0 {
  %2 = alloca double, align 8
  store double %0, ptr %2, align 8
  %3 = call double @atan(double noundef 1.000000e+00) #5
  %4 = fmul double 4.000000e+00, %3
  %5 = load double, ptr %2, align 8
  %6 = fmul double %4, %5
  %7 = fdiv double %6, 1.800000e+02
  ret double %7
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @SolveCubic(double noundef %0, double noundef %1, double noundef %2, double noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca x86_fp80, align 16
  %14 = alloca x86_fp80, align 16
  %15 = alloca x86_fp80, align 16
  %16 = alloca x86_fp80, align 16
  %17 = alloca x86_fp80, align 16
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  store double %0, ptr %7, align 8
  store double %1, ptr %8, align 8
  store double %2, ptr %9, align 8
  store double %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  %20 = load double, ptr %8, align 8
  %21 = load double, ptr %7, align 8
  %22 = fdiv double %20, %21
  %23 = fpext double %22 to x86_fp80
  store x86_fp80 %23, ptr %13, align 16
  %24 = load double, ptr %9, align 8
  %25 = load double, ptr %7, align 8
  %26 = fdiv double %24, %25
  %27 = fpext double %26 to x86_fp80
  store x86_fp80 %27, ptr %14, align 16
  %28 = load double, ptr %10, align 8
  %29 = load double, ptr %7, align 8
  %30 = fdiv double %28, %29
  %31 = fpext double %30 to x86_fp80
  store x86_fp80 %31, ptr %15, align 16
  %32 = load x86_fp80, ptr %13, align 16
  %33 = load x86_fp80, ptr %14, align 16
  %34 = fmul x86_fp80 0xK4000C000000000000000, %33
  %35 = fneg x86_fp80 %34
  %36 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %32, x86_fp80 %32, x86_fp80 %35)
  %37 = fdiv x86_fp80 %36, 0xK40029000000000000000
  store x86_fp80 %37, ptr %16, align 16
  %38 = load x86_fp80, ptr %13, align 16
  %39 = fmul x86_fp80 0xK40008000000000000000, %38
  %40 = fmul x86_fp80 %39, %38
  %41 = fmul x86_fp80 0xK40029000000000000000, %38
  %42 = load x86_fp80, ptr %14, align 16
  %43 = fmul x86_fp80 %41, %42
  %44 = fneg x86_fp80 %43
  %45 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %40, x86_fp80 %38, x86_fp80 %44)
  %46 = load x86_fp80, ptr %15, align 16
  %47 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 0xK4003D800000000000000, x86_fp80 %46, x86_fp80 %45)
  %48 = fdiv x86_fp80 %47, 0xK4004D800000000000000
  store x86_fp80 %48, ptr %17, align 16
  %49 = load x86_fp80, ptr %17, align 16
  %50 = load x86_fp80, ptr %16, align 16
  %51 = fmul x86_fp80 %50, %50
  %52 = fmul x86_fp80 %51, %50
  %53 = fneg x86_fp80 %52
  %54 = call x86_fp80 @llvm.fmuladd.f80(x86_fp80 %48, x86_fp80 %49, x86_fp80 %53)
  %55 = fptrunc x86_fp80 %54 to double
  store double %55, ptr %18, align 8
  %56 = fcmp ole double %55, 0.000000e+00
  br i1 %56, label %57, label %119

57:                                               ; preds = %6
  %58 = load ptr, ptr %11, align 8
  store i32 3, ptr %58, align 4
  %59 = load x86_fp80, ptr %17, align 16
  %60 = load x86_fp80, ptr %16, align 16
  %61 = fmul x86_fp80 %60, %60
  %62 = fmul x86_fp80 %61, %60
  %63 = fptrunc x86_fp80 %62 to double
  %64 = call double @sqrt(double noundef %63) #5
  %65 = fpext double %64 to x86_fp80
  %66 = fdiv x86_fp80 %59, %65
  %67 = fptrunc x86_fp80 %66 to double
  %68 = call double @acos(double noundef %67) #5
  store double %68, ptr %19, align 8
  %69 = load x86_fp80, ptr %16, align 16
  %70 = fptrunc x86_fp80 %69 to double
  %71 = call double @sqrt(double noundef %70) #5
  %72 = fmul double -2.000000e+00, %71
  %73 = load double, ptr %19, align 8
  %74 = fdiv double %73, 3.000000e+00
  %75 = call double @cos(double noundef %74) #5
  %76 = fmul double %72, %75
  %77 = fpext double %76 to x86_fp80
  %78 = load x86_fp80, ptr %13, align 16
  %79 = fdiv x86_fp80 %78, 0xK4000C000000000000000
  %80 = fsub x86_fp80 %77, %79
  %81 = fptrunc x86_fp80 %80 to double
  %82 = load ptr, ptr %12, align 8
  store double %81, ptr %82, align 8
  %83 = load x86_fp80, ptr %16, align 16
  %84 = fptrunc x86_fp80 %83 to double
  %85 = call double @sqrt(double noundef %84) #5
  %86 = fmul double -2.000000e+00, %85
  %87 = load double, ptr %19, align 8
  %88 = call double @atan(double noundef 1.000000e+00) #5
  %89 = fmul double 4.000000e+00, %88
  %90 = call double @llvm.fmuladd.f64(double 2.000000e+00, double %89, double %87)
  %91 = fdiv double %90, 3.000000e+00
  %92 = call double @cos(double noundef %91) #5
  %93 = fmul double %86, %92
  %94 = fpext double %93 to x86_fp80
  %95 = load x86_fp80, ptr %13, align 16
  %96 = fdiv x86_fp80 %95, 0xK4000C000000000000000
  %97 = fsub x86_fp80 %94, %96
  %98 = fptrunc x86_fp80 %97 to double
  %99 = load ptr, ptr %12, align 8
  %100 = getelementptr inbounds double, ptr %99, i64 1
  store double %98, ptr %100, align 8
  %101 = load x86_fp80, ptr %16, align 16
  %102 = fptrunc x86_fp80 %101 to double
  %103 = call double @sqrt(double noundef %102) #5
  %104 = fmul double -2.000000e+00, %103
  %105 = load double, ptr %19, align 8
  %106 = call double @atan(double noundef 1.000000e+00) #5
  %107 = fmul double 4.000000e+00, %106
  %108 = call double @llvm.fmuladd.f64(double 4.000000e+00, double %107, double %105)
  %109 = fdiv double %108, 3.000000e+00
  %110 = call double @cos(double noundef %109) #5
  %111 = fmul double %104, %110
  %112 = fpext double %111 to x86_fp80
  %113 = load x86_fp80, ptr %13, align 16
  %114 = fdiv x86_fp80 %113, 0xK4000C000000000000000
  %115 = fsub x86_fp80 %112, %114
  %116 = fptrunc x86_fp80 %115 to double
  %117 = load ptr, ptr %12, align 8
  %118 = getelementptr inbounds double, ptr %117, i64 2
  store double %116, ptr %118, align 8
  br label %152

119:                                              ; preds = %6
  %120 = load ptr, ptr %11, align 8
  store i32 1, ptr %120, align 4
  %121 = load double, ptr %18, align 8
  %122 = call double @sqrt(double noundef %121) #5
  %123 = load x86_fp80, ptr %17, align 16
  %124 = fptrunc x86_fp80 %123 to double
  %125 = call double @llvm.fabs.f64(double %124)
  %126 = fadd double %122, %125
  %127 = call double @pow(double noundef %126, double noundef 0x3FD5555555555555) #5
  %128 = load ptr, ptr %12, align 8
  store double %127, ptr %128, align 8
  %129 = load x86_fp80, ptr %16, align 16
  %130 = load ptr, ptr %12, align 8
  %131 = load double, ptr %130, align 8
  %132 = fpext double %131 to x86_fp80
  %133 = fdiv x86_fp80 %129, %132
  %134 = load double, ptr %130, align 8
  %135 = fpext double %134 to x86_fp80
  %136 = fadd x86_fp80 %135, %133
  %137 = fptrunc x86_fp80 %136 to double
  store double %137, ptr %130, align 8
  %138 = load x86_fp80, ptr %17, align 16
  %139 = fcmp olt x86_fp80 %138, 0xK00000000000000000000
  %140 = select i1 %139, i32 1, i32 -1
  %141 = sitofp i32 %140 to double
  %142 = load ptr, ptr %12, align 8
  %143 = load double, ptr %142, align 8
  %144 = fmul double %143, %141
  store double %144, ptr %142, align 8
  %145 = load x86_fp80, ptr %13, align 16
  %146 = fdiv x86_fp80 %145, 0xK4000C000000000000000
  %147 = load ptr, ptr %12, align 8
  %148 = load double, ptr %147, align 8
  %149 = fpext double %148 to x86_fp80
  %150 = fsub x86_fp80 %149, %146
  %151 = fptrunc x86_fp80 %150 to double
  store double %151, ptr %147, align 8
  br label %152

152:                                              ; preds = %119, %57
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare x86_fp80 @llvm.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80) #3

; Function Attrs: nounwind
declare double @sqrt(double noundef) #2

; Function Attrs: nounwind
declare double @acos(double noundef) #2

; Function Attrs: nounwind
declare double @cos(double noundef) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #3

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @usqrt(i64 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  store i64 %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i64 0, ptr %5, align 8
  store i64 0, ptr %6, align 8
  store i64 0, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %9

9:                                                ; preds = %35, %2
  %10 = load i32, ptr %8, align 4
  %11 = icmp slt i32 %10, 32
  br i1 %11, label %12, label %38

12:                                               ; preds = %9
  %13 = load i64, ptr %6, align 8
  %14 = shl i64 %13, 2
  %15 = load i64, ptr %3, align 8
  %16 = and i64 %15, 3221225472
  %17 = lshr i64 %16, 30
  %18 = add i64 %14, %17
  store i64 %18, ptr %6, align 8
  %19 = load i64, ptr %3, align 8
  %20 = shl i64 %19, 2
  store i64 %20, ptr %3, align 8
  %21 = load i64, ptr %5, align 8
  %22 = shl i64 %21, 1
  store i64 %22, ptr %5, align 8
  %23 = shl i64 %22, 1
  %24 = add i64 %23, 1
  store i64 %24, ptr %7, align 8
  %25 = load i64, ptr %6, align 8
  %26 = load i64, ptr %7, align 8
  %27 = icmp uge i64 %25, %26
  br i1 %27, label %28, label %34

28:                                               ; preds = %12
  %29 = load i64, ptr %7, align 8
  %30 = load i64, ptr %6, align 8
  %31 = sub i64 %30, %29
  store i64 %31, ptr %6, align 8
  %32 = load i64, ptr %5, align 8
  %33 = add i64 %32, 1
  store i64 %33, ptr %5, align 8
  br label %34

34:                                               ; preds = %28, %12
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %8, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %8, align 4
  br label %9

38:                                               ; preds = %9
  %39 = load ptr, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %39, ptr align 8 %5, i64 8, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
