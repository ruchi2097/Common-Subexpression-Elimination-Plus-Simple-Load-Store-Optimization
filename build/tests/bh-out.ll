; ModuleID = 'bh-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.datapoints = type { [3 x double], [3 x double], ptr, ptr }
%struct.icstruct = type { [3 x i32], i16 }
%struct.tree = type { [3 x double], double, ptr, [64 x ptr], [64 x ptr] }
%struct.bnode = type { i16, double, [3 x double], i32, i32, [3 x double], [3 x double], [3 x double], double, ptr, ptr }
%struct.hgstruct = type { ptr, [3 x double], double, [3 x double] }
%struct.cnode = type { i16, double, [3 x double], i32, i32, [8 x ptr], ptr }
%struct.node = type { i16, double, [3 x double], i32, i32 }
%struct.tms = type { i64, i64, i64, i64 }

@__NumNodes = dso_local global i32 1, align 4
@.str = private unnamed_addr constant [27 x i8] c"nbody = %d, numnodes = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"Bodies per %d = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [22 x i8] c"Assertion Failure #%d\00", align 1
@cp_free_list = dso_local global ptr null, align 8
@bp_free_list = dso_local global ptr null, align 8
@.str.3 = private unnamed_addr constant [29 x i8] c"testdata: not enough memory\0A\00", align 1
@root = dso_local global ptr null, align 8
@rmin = dso_local global [3 x double] zeroinitializer, align 16
@rsize = dso_local global double 0.000000e+00, align 8
@arg1 = dso_local global i32 0, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"times() call failed\0A\00", align 1
@stderr = external global ptr, align 8
@.str.1.8 = private unnamed_addr constant [6 x i8] c"Error\00", align 1
@nbody = dso_local global i32 0, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %5, align 8
  %9 = call i32 @dealwithargs(i32 noundef %7, ptr noundef %8)
  %10 = load i32, ptr @nbody, align 4
  %11 = load i32, ptr @__NumNodes, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %10, i32 noundef %11)
  %13 = call ptr @old_main()
  store ptr %13, ptr %6, align 8
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @old_main() #0 {
  %1 = alloca double, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca [3 x double], align 16
  %7 = alloca [3 x double], align 16
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [64 x i32], align 16
  %12 = alloca [64 x ptr], align 16
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.datapoints, align 8
  %16 = alloca i32, align 4
  %17 = alloca %struct.datapoints, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca %struct.icstruct, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca %struct.icstruct, align 4
  store ptr null, ptr %8, align 8
  store i32 0, ptr %9, align 4
  %26 = load i32, ptr @__NumNodes, align 4
  %27 = sdiv i32 64, %26
  store i32 %27, ptr %10, align 4
  %28 = call i32 @srand(i32 noundef 123) #9
  %29 = call noalias ptr @malloc(i64 noundef 1064) #9
  store ptr %29, ptr %4, align 8
  %30 = getelementptr inbounds %struct.tree, ptr %29, i32 0, i32 2
  store ptr null, ptr %30, align 8
  %31 = load ptr, ptr %4, align 8
  store double -2.000000e+00, ptr %31, align 8
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds [3 x double], ptr %32, i64 0, i64 1
  store double -2.000000e+00, ptr %33, align 8
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds [3 x double], ptr %34, i64 0, i64 2
  store double -2.000000e+00, ptr %35, align 8
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds %struct.tree, ptr %36, i32 0, i32 1
  store double 4.000000e+00, ptr %37, align 8
  store i32 0, ptr %13, align 4
  br label %38

38:                                               ; preds = %45, %0
  %39 = load i32, ptr %13, align 4
  %40 = icmp slt i32 %39, 3
  br i1 %40, label %41, label %48

41:                                               ; preds = %38
  %42 = load i32, ptr %13, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %43
  store double 0.000000e+00, ptr %44, align 8
  br label %45

45:                                               ; preds = %41
  %46 = load i32, ptr %13, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %13, align 4
  br label %38

48:                                               ; preds = %38
  store i32 0, ptr %14, align 4
  br label %49

49:                                               ; preds = %56, %48
  %50 = load i32, ptr %14, align 4
  %51 = icmp slt i32 %50, 3
  br i1 %51, label %52, label %59

52:                                               ; preds = %49
  %53 = load i32, ptr %14, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 %54
  store double 0.000000e+00, ptr %55, align 8
  br label %56

56:                                               ; preds = %52
  %57 = load i32, ptr %14, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %14, align 4
  br label %49

59:                                               ; preds = %49
  store i32 0, ptr %2, align 4
  br label %60

60:                                               ; preds = %119, %59
  %61 = load i32, ptr %2, align 4
  %62 = icmp slt i32 %61, 32
  br i1 %62, label %63, label %122

63:                                               ; preds = %60
  %64 = load i32, ptr %2, align 4
  %65 = load i32, ptr @__NumNodes, align 4
  %66 = sdiv i32 32, %65
  %67 = sdiv i32 %64, %66
  store i32 %67, ptr %16, align 4
  %68 = load i32, ptr @nbody, align 4
  %69 = sdiv i32 %68, 32
  %70 = load i32, ptr %2, align 4
  %71 = add nsw i32 %70, 1
  call void @uniform_testdata(ptr sret(%struct.datapoints) align 8 %17, i32 noundef %67, i32 noundef %69, i32 noundef %71)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %15, ptr align 8 %17, i64 64, i1 false)
  %72 = getelementptr inbounds %struct.datapoints, ptr %15, i32 0, i32 2
  %73 = load ptr, ptr %72, align 8
  %74 = load ptr, ptr %4, align 8
  %75 = getelementptr inbounds %struct.tree, ptr %74, i32 0, i32 3
  %76 = load i32, ptr %2, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [64 x ptr], ptr %75, i64 0, i64 %77
  store ptr %73, ptr %78, align 8
  %79 = load ptr, ptr %8, align 8
  %80 = icmp ne ptr %79, null
  br i1 %80, label %81, label %85

81:                                               ; preds = %63
  %82 = load ptr, ptr %72, align 8
  %83 = load ptr, ptr %8, align 8
  %84 = getelementptr inbounds %struct.bnode, ptr %83, i32 0, i32 9
  store ptr %82, ptr %84, align 8
  br label %85

85:                                               ; preds = %81, %63
  %86 = getelementptr inbounds %struct.datapoints, ptr %15, i32 0, i32 3
  %87 = load ptr, ptr %86, align 8
  store ptr %87, ptr %8, align 8
  store i32 0, ptr %18, align 4
  br label %88

88:                                               ; preds = %99, %85
  %89 = load i32, ptr %18, align 4
  %90 = icmp slt i32 %89, 3
  br i1 %90, label %91, label %102

91:                                               ; preds = %88
  %92 = load i32, ptr %18, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %93
  %95 = load double, ptr %94, align 8
  %96 = getelementptr inbounds [3 x double], ptr %15, i64 0, i64 %93
  %97 = load double, ptr %96, align 8
  %98 = fadd double %95, %97
  store double %98, ptr %94, align 8
  br label %99

99:                                               ; preds = %91
  %100 = load i32, ptr %18, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, ptr %18, align 4
  br label %88

102:                                              ; preds = %88
  store i32 0, ptr %19, align 4
  br label %103

103:                                              ; preds = %115, %102
  %104 = load i32, ptr %19, align 4
  %105 = icmp slt i32 %104, 3
  br i1 %105, label %106, label %118

106:                                              ; preds = %103
  %107 = load i32, ptr %19, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 %108
  %110 = load double, ptr %109, align 8
  %111 = getelementptr inbounds %struct.datapoints, ptr %15, i32 0, i32 1
  %112 = getelementptr inbounds [3 x double], ptr %111, i64 0, i64 %108
  %113 = load double, ptr %112, align 8
  %114 = fadd double %110, %113
  store double %114, ptr %109, align 8
  br label %115

115:                                              ; preds = %106
  %116 = load i32, ptr %19, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %19, align 4
  br label %103

118:                                              ; preds = %103
  br label %119

119:                                              ; preds = %118
  %120 = load i32, ptr %2, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, ptr %2, align 4
  br label %60

122:                                              ; preds = %60
  store i32 0, ptr %20, align 4
  br label %123

123:                                              ; preds = %134, %122
  %124 = load i32, ptr %20, align 4
  %125 = icmp slt i32 %124, 3
  br i1 %125, label %126, label %137

126:                                              ; preds = %123
  %127 = load i32, ptr %20, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %128
  %130 = load double, ptr %129, align 8
  %131 = load i32, ptr @nbody, align 4
  %132 = sitofp i32 %131 to double
  %133 = fdiv double %130, %132
  store double %133, ptr %129, align 8
  br label %134

134:                                              ; preds = %126
  %135 = load i32, ptr %20, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, ptr %20, align 4
  br label %123

137:                                              ; preds = %123
  store i32 0, ptr %21, align 4
  br label %138

138:                                              ; preds = %149, %137
  %139 = load i32, ptr %21, align 4
  %140 = icmp slt i32 %139, 3
  br i1 %140, label %141, label %152

141:                                              ; preds = %138
  %142 = load i32, ptr %21, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 %143
  %145 = load double, ptr %144, align 8
  %146 = load i32, ptr @nbody, align 4
  %147 = sitofp i32 %146 to double
  %148 = fdiv double %145, %147
  store double %148, ptr %144, align 8
  br label %149

149:                                              ; preds = %141
  %150 = load i32, ptr %21, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, ptr %21, align 4
  br label %138

152:                                              ; preds = %138
  store i32 0, ptr %9, align 4
  br label %153

153:                                              ; preds = %163, %152
  %154 = load i32, ptr %9, align 4
  %155 = icmp slt i32 %154, 64
  br i1 %155, label %156, label %166

156:                                              ; preds = %153
  %157 = load i32, ptr %9, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [64 x i32], ptr %11, i64 0, i64 %158
  store i32 0, ptr %159, align 4
  %160 = load i32, ptr %9, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [64 x ptr], ptr %12, i64 0, i64 %161
  store ptr null, ptr %162, align 8
  br label %163

163:                                              ; preds = %156
  %164 = load i32, ptr %9, align 4
  %165 = add nsw i32 %164, 1
  store i32 %165, ptr %9, align 4
  br label %153

166:                                              ; preds = %153
  %167 = load ptr, ptr %4, align 8
  %168 = getelementptr inbounds %struct.tree, ptr %167, i32 0, i32 3
  %169 = load ptr, ptr %168, align 8
  store ptr %169, ptr %5, align 8
  br label %170

170:                                              ; preds = %242, %166
  %171 = load ptr, ptr %5, align 8
  %172 = icmp ne ptr %171, null
  br i1 %172, label %173, label %246

173:                                              ; preds = %170
  store i32 0, ptr %23, align 4
  br label %174

174:                                              ; preds = %187, %173
  %175 = load i32, ptr %23, align 4
  %176 = icmp slt i32 %175, 3
  br i1 %176, label %177, label %190

177:                                              ; preds = %174
  %178 = load ptr, ptr %5, align 8
  %179 = getelementptr inbounds %struct.bnode, ptr %178, i32 0, i32 2
  %180 = load i32, ptr %23, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [3 x double], ptr %179, i64 0, i64 %181
  %183 = load double, ptr %182, align 8
  %184 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %181
  %185 = load double, ptr %184, align 8
  %186 = fsub double %183, %185
  store double %186, ptr %182, align 8
  br label %187

187:                                              ; preds = %177
  %188 = load i32, ptr %23, align 4
  %189 = add nsw i32 %188, 1
  store i32 %189, ptr %23, align 4
  br label %174

190:                                              ; preds = %174
  store i32 0, ptr %24, align 4
  br label %191

191:                                              ; preds = %204, %190
  %192 = load i32, ptr %24, align 4
  %193 = icmp slt i32 %192, 3
  br i1 %193, label %194, label %207

194:                                              ; preds = %191
  %195 = load ptr, ptr %5, align 8
  %196 = getelementptr inbounds %struct.bnode, ptr %195, i32 0, i32 5
  %197 = load i32, ptr %24, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [3 x double], ptr %196, i64 0, i64 %198
  %200 = load double, ptr %199, align 8
  %201 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 %198
  %202 = load double, ptr %201, align 8
  %203 = fsub double %200, %202
  store double %203, ptr %199, align 8
  br label %204

204:                                              ; preds = %194
  %205 = load i32, ptr %24, align 4
  %206 = add nsw i32 %205, 1
  store i32 %206, ptr %24, align 4
  br label %191

207:                                              ; preds = %191
  %208 = load ptr, ptr %5, align 8
  %209 = load ptr, ptr %4, align 8
  %210 = call { i64, i64 } @intcoord(ptr noundef %208, ptr noundef %209)
  %211 = extractvalue { i64, i64 } %210, 0
  store i64 %211, ptr %25, align 4
  %212 = getelementptr inbounds { i64, i64 }, ptr %25, i32 0, i32 1
  %213 = extractvalue { i64, i64 } %210, 1
  store i64 %213, ptr %212, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %22, ptr align 4 %25, i64 16, i1 false)
  %214 = load i64, ptr %22, align 4
  %215 = getelementptr inbounds { i64, i64 }, ptr %22, i32 0, i32 1
  %216 = load i64, ptr %215, align 4
  %217 = call i32 @old_subindex(i64 %214, i64 %216, i32 noundef 536870912)
  %218 = shl i32 %217, 3
  %219 = load i64, ptr %22, align 4
  %220 = load i64, ptr %215, align 4
  %221 = call i32 @old_subindex(i64 %219, i64 %220, i32 noundef 268435456)
  %222 = add nsw i32 %218, %221
  %223 = load i32, ptr %10, align 4
  %224 = sdiv i32 %222, %223
  store i32 %224, ptr %9, align 4
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds [64 x i32], ptr %11, i64 0, i64 %225
  %227 = load i32, ptr %226, align 4
  %228 = add nsw i32 %227, 1
  store i32 %228, ptr %226, align 4
  %229 = load i32, ptr %9, align 4
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [64 x ptr], ptr %12, i64 0, i64 %230
  %232 = load ptr, ptr %231, align 8
  %233 = load ptr, ptr %5, align 8
  %234 = getelementptr inbounds %struct.bnode, ptr %233, i32 0, i32 10
  store ptr %232, ptr %234, align 8
  %235 = load ptr, ptr %5, align 8
  %236 = load i32, ptr %9, align 4
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [64 x ptr], ptr %12, i64 0, i64 %237
  store ptr %235, ptr %238, align 8
  %239 = load i32, ptr %9, align 4
  %240 = load ptr, ptr %5, align 8
  %241 = getelementptr inbounds %struct.bnode, ptr %240, i32 0, i32 3
  store i32 %239, ptr %241, align 8
  br label %242

242:                                              ; preds = %207
  %243 = load ptr, ptr %5, align 8
  %244 = getelementptr inbounds %struct.bnode, ptr %243, i32 0, i32 9
  %245 = load ptr, ptr %244, align 8
  store ptr %245, ptr %5, align 8
  br label %170

246:                                              ; preds = %170
  store i32 0, ptr %9, align 4
  br label %247

247:                                              ; preds = %264, %246
  %248 = load i32, ptr %9, align 4
  %249 = load i32, ptr @__NumNodes, align 4
  %250 = icmp slt i32 %248, %249
  br i1 %250, label %251, label %267

251:                                              ; preds = %247
  %252 = load i32, ptr %9, align 4
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds [64 x i32], ptr %11, i64 0, i64 %253
  %255 = load i32, ptr %254, align 4
  %256 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %252, i32 noundef %255)
  %257 = load i32, ptr %9, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [64 x ptr], ptr %12, i64 0, i64 %258
  %260 = load ptr, ptr %259, align 8
  %261 = load ptr, ptr %4, align 8
  %262 = getelementptr inbounds %struct.tree, ptr %261, i32 0, i32 4
  %263 = getelementptr inbounds [64 x ptr], ptr %262, i64 0, i64 %258
  store ptr %260, ptr %263, align 8
  br label %264

264:                                              ; preds = %251
  %265 = load i32, ptr %9, align 4
  %266 = add nsw i32 %265, 1
  store i32 %266, ptr %9, align 4
  br label %247

267:                                              ; preds = %247
  store i32 0, ptr %9, align 4
  store double 0.000000e+00, ptr %1, align 8
  store i32 0, ptr %2, align 4
  store i32 10, ptr %3, align 4
  br label %268

268:                                              ; preds = %277, %267
  %269 = load double, ptr %1, align 8
  %270 = fcmp olt double %269, 2.001250e+00
  br i1 %270, label %271, label %275

271:                                              ; preds = %268
  %272 = load i32, ptr %2, align 4
  %273 = load i32, ptr %3, align 4
  %274 = icmp slt i32 %272, %273
  br label %275

275:                                              ; preds = %271, %268
  %276 = phi i1 [ false, %268 ], [ %274, %271 ]
  br i1 %276, label %277, label %285

277:                                              ; preds = %275
  %278 = load ptr, ptr %4, align 8
  %279 = load i32, ptr %2, align 4
  %280 = call i32 @stepsystem(ptr noundef %278, i32 noundef %279)
  %281 = load double, ptr %1, align 8
  %282 = fadd double %281, 1.250000e-02
  store double %282, ptr %1, align 8
  %283 = load i32, ptr %2, align 4
  %284 = add nsw i32 %283, 1
  store i32 %284, ptr %2, align 4
  br label %268

285:                                              ; preds = %275
  %286 = load ptr, ptr %4, align 8
  ret ptr %286
}

; Function Attrs: nounwind
declare i32 @srand(i32 noundef) #2

; Function Attrs: nounwind
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @uniform_testdata(ptr noalias sret(%struct.datapoints) align 8 %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  %21 = alloca i32, align 4
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca double, align 8
  %25 = alloca double, align 8
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 %3, ptr %7, align 4
  %32 = sitofp i32 %3 to double
  %33 = fmul double 1.230000e+02, %32
  store double %33, ptr %20, align 8
  store double 0x3FE2D97C7F3321D2, ptr %8, align 8
  %34 = call double @sqrt(double noundef 0x3FFB2995E7B7B604) #9
  store double %34, ptr %9, align 8
  store i32 0, ptr %26, align 4
  br label %35

35:                                               ; preds = %42, %4
  %36 = load i32, ptr %26, align 4
  %37 = icmp slt i32 %36, 3
  br i1 %37, label %38, label %45

38:                                               ; preds = %35
  %39 = load i32, ptr %26, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [3 x double], ptr %0, i64 0, i64 %40
  store double 0.000000e+00, ptr %41, align 8
  br label %42

42:                                               ; preds = %38
  %43 = load i32, ptr %26, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %26, align 4
  br label %35

45:                                               ; preds = %35
  store i32 0, ptr %27, align 4
  br label %46

46:                                               ; preds = %54, %45
  %47 = load i32, ptr %27, align 4
  %48 = icmp slt i32 %47, 3
  br i1 %48, label %49, label %57

49:                                               ; preds = %46
  %50 = getelementptr inbounds %struct.datapoints, ptr %0, i32 0, i32 1
  %51 = load i32, ptr %27, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [3 x double], ptr %50, i64 0, i64 %52
  store double 0.000000e+00, ptr %53, align 8
  br label %54

54:                                               ; preds = %49
  %55 = load i32, ptr %27, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %27, align 4
  br label %46

57:                                               ; preds = %46
  %58 = load i32, ptr %5, align 4
  %59 = call ptr @ubody_alloc(i32 noundef %58)
  store ptr %59, ptr %14, align 8
  store ptr %59, ptr %16, align 8
  store i32 0, ptr %17, align 4
  br label %60

60:                                               ; preds = %227, %57
  %61 = load i32, ptr %17, align 4
  %62 = load i32, ptr %6, align 4
  %63 = icmp slt i32 %61, %62
  br i1 %63, label %64, label %230

64:                                               ; preds = %60
  %65 = load i32, ptr %5, align 4
  %66 = call ptr @ubody_alloc(i32 noundef %65)
  store ptr %66, ptr %15, align 8
  %67 = icmp eq ptr %66, null
  br i1 %67, label %68, label %70

68:                                               ; preds = %64
  %69 = call i32 @error(ptr noundef @.str.3)
  br label %70

70:                                               ; preds = %68, %64
  %71 = load ptr, ptr %15, align 8
  %72 = load ptr, ptr %16, align 8
  %73 = getelementptr inbounds %struct.bnode, ptr %72, i32 0, i32 9
  store ptr %71, ptr %73, align 8
  %74 = load ptr, ptr %15, align 8
  store ptr %74, ptr %16, align 8
  %75 = load ptr, ptr %15, align 8
  store i16 1, ptr %75, align 8
  %76 = load i32, ptr %6, align 4
  %77 = sitofp i32 %76 to double
  %78 = fdiv double 1.000000e+00, %77
  %79 = load ptr, ptr %15, align 8
  %80 = getelementptr inbounds %struct.bnode, ptr %79, i32 0, i32 1
  store double %78, ptr %80, align 8
  %81 = load double, ptr %20, align 8
  %82 = call double (double, ...) @my_rand(double noundef %81)
  store double %82, ptr %20, align 8
  %83 = call double (double, double, double, ...) @xrand(double noundef 0.000000e+00, double noundef 0x3FEFF7CED916872B, double noundef %82)
  store double %83, ptr %19, align 8
  %84 = call double @pow(double noundef %83, double noundef 0xBFE5555555555555) #9
  %85 = fsub double %84, 1.000000e+00
  store double %85, ptr %18, align 8
  %86 = call double @sqrt(double noundef %85) #9
  %87 = fdiv double 1.000000e+00, %86
  store double %87, ptr %10, align 8
  store double 4.000000e+00, ptr %25, align 8
  store i32 0, ptr %21, align 4
  br label %88

88:                                               ; preds = %103, %70
  %89 = load i32, ptr %21, align 4
  %90 = icmp slt i32 %89, 3
  br i1 %90, label %91, label %106

91:                                               ; preds = %88
  %92 = load double, ptr %20, align 8
  %93 = call double (double, ...) @my_rand(double noundef %92)
  store double %93, ptr %20, align 8
  %94 = call double (double, double, double, ...) @xrand(double noundef 0.000000e+00, double noundef 0x3FEFF7CED916872B, double noundef %93)
  store double %94, ptr %10, align 8
  %95 = load double, ptr %25, align 8
  %96 = load double, ptr %10, align 8
  %97 = fmul double %95, %96
  %98 = load ptr, ptr %15, align 8
  %99 = getelementptr inbounds %struct.bnode, ptr %98, i32 0, i32 2
  %100 = load i32, ptr %21, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [3 x double], ptr %99, i64 0, i64 %101
  store double %97, ptr %102, align 8
  br label %103

103:                                              ; preds = %91
  %104 = load i32, ptr %21, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, ptr %21, align 4
  br label %88

106:                                              ; preds = %88
  store i32 0, ptr %28, align 4
  br label %107

107:                                              ; preds = %121, %106
  %108 = load i32, ptr %28, align 4
  %109 = icmp slt i32 %108, 3
  br i1 %109, label %110, label %124

110:                                              ; preds = %107
  %111 = load i32, ptr %28, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [3 x double], ptr %0, i64 0, i64 %112
  %114 = load double, ptr %113, align 8
  %115 = load ptr, ptr %15, align 8
  %116 = getelementptr inbounds %struct.bnode, ptr %115, i32 0, i32 2
  %117 = getelementptr inbounds [3 x double], ptr %116, i64 0, i64 %112
  %118 = load double, ptr %117, align 8
  %119 = fadd double %114, %118
  %120 = getelementptr inbounds [3 x double], ptr %0, i64 0, i64 %112
  store double %119, ptr %120, align 8
  br label %121

121:                                              ; preds = %110
  %122 = load i32, ptr %28, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, ptr %28, align 4
  br label %107

124:                                              ; preds = %107
  br label %125

125:                                              ; preds = %132, %124
  %126 = load double, ptr %20, align 8
  %127 = call double (double, ...) @my_rand(double noundef %126)
  store double %127, ptr %20, align 8
  %128 = call double (double, double, double, ...) @xrand(double noundef 0.000000e+00, double noundef 1.000000e+00, double noundef %127)
  store double %128, ptr %12, align 8
  %129 = load double, ptr %20, align 8
  %130 = call double (double, ...) @my_rand(double noundef %129)
  store double %130, ptr %20, align 8
  %131 = call double (double, double, double, ...) @xrand(double noundef 0.000000e+00, double noundef 1.000000e-01, double noundef %130)
  store double %131, ptr %13, align 8
  br label %132

132:                                              ; preds = %125
  %133 = load double, ptr %13, align 8
  %134 = load double, ptr %12, align 8
  %135 = fmul double %134, %134
  %136 = fneg double %134
  %137 = call double @llvm.fmuladd.f64(double %136, double %134, double 1.000000e+00)
  %138 = call double @pow(double noundef %137, double noundef 3.500000e+00) #9
  %139 = fmul double %135, %138
  %140 = fcmp ogt double %133, %139
  br i1 %140, label %125, label %141

141:                                              ; preds = %132
  %142 = call double @sqrt(double noundef 2.000000e+00) #9
  %143 = load double, ptr %12, align 8
  %144 = fmul double %142, %143
  %145 = load double, ptr %10, align 8
  %146 = call double @llvm.fmuladd.f64(double %145, double %145, double 1.000000e+00)
  %147 = call double @pow(double noundef %146, double noundef 2.500000e-01) #9
  %148 = fdiv double %144, %147
  store double %148, ptr %11, align 8
  %149 = load double, ptr %9, align 8
  %150 = load double, ptr %11, align 8
  %151 = fmul double %149, %150
  store double %151, ptr %24, align 8
  br label %152

152:                                              ; preds = %185, %141
  store i32 0, ptr %21, align 4
  br label %153

153:                                              ; preds = %165, %152
  %154 = load i32, ptr %21, align 4
  %155 = icmp slt i32 %154, 3
  br i1 %155, label %156, label %168

156:                                              ; preds = %153
  %157 = load double, ptr %20, align 8
  %158 = call double (double, ...) @my_rand(double noundef %157)
  store double %158, ptr %20, align 8
  %159 = call double (double, double, double, ...) @xrand(double noundef -1.000000e+00, double noundef 1.000000e+00, double noundef %158)
  %160 = load ptr, ptr %15, align 8
  %161 = getelementptr inbounds %struct.bnode, ptr %160, i32 0, i32 5
  %162 = load i32, ptr %21, align 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds [3 x double], ptr %161, i64 0, i64 %163
  store double %159, ptr %164, align 8
  br label %165

165:                                              ; preds = %156
  %166 = load i32, ptr %21, align 4
  %167 = add nsw i32 %166, 1
  store i32 %167, ptr %21, align 4
  br label %153

168:                                              ; preds = %153
  store double 0.000000e+00, ptr %22, align 8
  store i32 0, ptr %29, align 4
  br label %169

169:                                              ; preds = %181, %168
  %170 = load i32, ptr %29, align 4
  %171 = icmp slt i32 %170, 3
  br i1 %171, label %172, label %184

172:                                              ; preds = %169
  %173 = load ptr, ptr %15, align 8
  %174 = getelementptr inbounds %struct.bnode, ptr %173, i32 0, i32 5
  %175 = load i32, ptr %29, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [3 x double], ptr %174, i64 0, i64 %176
  %178 = load double, ptr %177, align 8
  %179 = load double, ptr %22, align 8
  %180 = call double @llvm.fmuladd.f64(double %178, double %178, double %179)
  store double %180, ptr %22, align 8
  br label %181

181:                                              ; preds = %172
  %182 = load i32, ptr %29, align 4
  %183 = add nsw i32 %182, 1
  store i32 %183, ptr %29, align 4
  br label %169

184:                                              ; preds = %169
  br label %185

185:                                              ; preds = %184
  %186 = load double, ptr %22, align 8
  %187 = fcmp ogt double %186, 1.000000e+00
  br i1 %187, label %152, label %188

188:                                              ; preds = %185
  %189 = load double, ptr %24, align 8
  %190 = load double, ptr %22, align 8
  %191 = call double @sqrt(double noundef %190) #9
  %192 = fdiv double %189, %191
  store double %192, ptr %23, align 8
  store i32 0, ptr %30, align 4
  br label %193

193:                                              ; preds = %205, %188
  %194 = load i32, ptr %30, align 4
  %195 = icmp slt i32 %194, 3
  br i1 %195, label %196, label %208

196:                                              ; preds = %193
  %197 = load ptr, ptr %15, align 8
  %198 = getelementptr inbounds %struct.bnode, ptr %197, i32 0, i32 5
  %199 = load i32, ptr %30, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [3 x double], ptr %198, i64 0, i64 %200
  %202 = load double, ptr %201, align 8
  %203 = load double, ptr %23, align 8
  %204 = fmul double %202, %203
  store double %204, ptr %201, align 8
  br label %205

205:                                              ; preds = %196
  %206 = load i32, ptr %30, align 4
  %207 = add nsw i32 %206, 1
  store i32 %207, ptr %30, align 4
  br label %193

208:                                              ; preds = %193
  store i32 0, ptr %31, align 4
  br label %209

209:                                              ; preds = %223, %208
  %210 = load i32, ptr %31, align 4
  %211 = icmp slt i32 %210, 3
  br i1 %211, label %212, label %226

212:                                              ; preds = %209
  %213 = getelementptr inbounds %struct.datapoints, ptr %0, i32 0, i32 1
  %214 = load i32, ptr %31, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [3 x double], ptr %213, i64 0, i64 %215
  %217 = load double, ptr %216, align 8
  %218 = load ptr, ptr %15, align 8
  %219 = getelementptr inbounds %struct.bnode, ptr %218, i32 0, i32 5
  %220 = getelementptr inbounds [3 x double], ptr %219, i64 0, i64 %215
  %221 = load double, ptr %220, align 8
  %222 = fadd double %217, %221
  store double %222, ptr %216, align 8
  br label %223

223:                                              ; preds = %212
  %224 = load i32, ptr %31, align 4
  %225 = add nsw i32 %224, 1
  store i32 %225, ptr %31, align 4
  br label %209

226:                                              ; preds = %209
  br label %227

227:                                              ; preds = %226
  %228 = load i32, ptr %17, align 4
  %229 = add nsw i32 %228, 1
  store i32 %229, ptr %17, align 4
  br label %60

230:                                              ; preds = %60
  %231 = load ptr, ptr %16, align 8
  %232 = getelementptr inbounds %struct.bnode, ptr %231, i32 0, i32 9
  store ptr null, ptr %232, align 8
  %233 = load ptr, ptr %14, align 8
  %234 = getelementptr inbounds %struct.bnode, ptr %233, i32 0, i32 9
  %235 = load ptr, ptr %234, align 8
  %236 = getelementptr inbounds %struct.datapoints, ptr %0, i32 0, i32 2
  store ptr %235, ptr %236, align 8
  %237 = load ptr, ptr %16, align 8
  %238 = getelementptr inbounds %struct.datapoints, ptr %0, i32 0, i32 3
  store ptr %237, ptr %238, align 8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @intcoord(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca %struct.icstruct, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca [3 x double], align 16
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %9 = getelementptr inbounds %struct.icstruct, ptr %3, i32 0, i32 1
  store i16 1, ptr %9, align 4
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.tree, ptr %10, i32 0, i32 1
  %12 = load double, ptr %11, align 8
  store double %12, ptr %7, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.bnode, ptr %13, i32 0, i32 2
  %15 = load double, ptr %14, align 8
  store double %15, ptr %8, align 16
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.bnode, ptr %16, i32 0, i32 2
  %18 = getelementptr inbounds [3 x double], ptr %17, i64 0, i64 1
  %19 = load double, ptr %18, align 8
  %20 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 1
  store double %19, ptr %20, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds %struct.bnode, ptr %21, i32 0, i32 2
  %23 = getelementptr inbounds [3 x double], ptr %22, i64 0, i64 2
  %24 = load double, ptr %23, align 8
  %25 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 2
  store double %24, ptr %25, align 16
  %26 = load double, ptr %8, align 16
  %27 = load ptr, ptr %5, align 8
  %28 = load double, ptr %27, align 8
  %29 = fsub double %26, %28
  %30 = load double, ptr %7, align 8
  %31 = fdiv double %29, %30
  store double %31, ptr %6, align 8
  %32 = fcmp ole double 0.000000e+00, %31
  br i1 %32, label %33, label %41

33:                                               ; preds = %2
  %34 = load double, ptr %6, align 8
  %35 = fcmp olt double %34, 1.000000e+00
  br i1 %35, label %36, label %41

36:                                               ; preds = %33
  %37 = load double, ptr %6, align 8
  %38 = fmul double 0x41D0000000000000, %37
  %39 = call double @llvm.floor.f64(double %38)
  %40 = fptosi double %39 to i32
  store i32 %40, ptr %3, align 4
  br label %42

41:                                               ; preds = %33, %2
  store i16 0, ptr %9, align 4
  br label %42

42:                                               ; preds = %41, %36
  %43 = load double, ptr %20, align 8
  %44 = load ptr, ptr %5, align 8
  %45 = getelementptr inbounds [3 x double], ptr %44, i64 0, i64 1
  %46 = load double, ptr %45, align 8
  %47 = fsub double %43, %46
  %48 = load double, ptr %7, align 8
  %49 = fdiv double %47, %48
  store double %49, ptr %6, align 8
  %50 = fcmp ole double 0.000000e+00, %49
  br i1 %50, label %51, label %60

51:                                               ; preds = %42
  %52 = load double, ptr %6, align 8
  %53 = fcmp olt double %52, 1.000000e+00
  br i1 %53, label %54, label %60

54:                                               ; preds = %51
  %55 = load double, ptr %6, align 8
  %56 = fmul double 0x41D0000000000000, %55
  %57 = call double @llvm.floor.f64(double %56)
  %58 = fptosi double %57 to i32
  %59 = getelementptr inbounds [3 x i32], ptr %3, i64 0, i64 1
  store i32 %58, ptr %59, align 4
  br label %62

60:                                               ; preds = %51, %42
  %61 = getelementptr inbounds %struct.icstruct, ptr %3, i32 0, i32 1
  store i16 0, ptr %61, align 4
  br label %62

62:                                               ; preds = %60, %54
  %63 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 2
  %64 = load double, ptr %63, align 16
  %65 = load ptr, ptr %5, align 8
  %66 = getelementptr inbounds [3 x double], ptr %65, i64 0, i64 2
  %67 = load double, ptr %66, align 8
  %68 = fsub double %64, %67
  %69 = load double, ptr %7, align 8
  %70 = fdiv double %68, %69
  store double %70, ptr %6, align 8
  %71 = fcmp ole double 0.000000e+00, %70
  br i1 %71, label %72, label %81

72:                                               ; preds = %62
  %73 = load double, ptr %6, align 8
  %74 = fcmp olt double %73, 1.000000e+00
  br i1 %74, label %75, label %81

75:                                               ; preds = %72
  %76 = load double, ptr %6, align 8
  %77 = fmul double 0x41D0000000000000, %76
  %78 = call double @llvm.floor.f64(double %77)
  %79 = fptosi double %78 to i32
  %80 = getelementptr inbounds [3 x i32], ptr %3, i64 0, i64 2
  store i32 %79, ptr %80, align 4
  br label %83

81:                                               ; preds = %72, %62
  %82 = getelementptr inbounds %struct.icstruct, ptr %3, i32 0, i32 1
  store i16 0, ptr %82, align 4
  br label %83

83:                                               ; preds = %81, %75
  %84 = load { i64, i64 }, ptr %3, align 4
  ret { i64, i64 } %84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @old_subindex(i64 %0, i64 %1, i32 noundef %2) #0 {
  %4 = alloca %struct.icstruct, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i64 %0, ptr %4, align 4
  %8 = getelementptr inbounds { i64, i64 }, ptr %4, i32 0, i32 1
  store i64 %1, ptr %8, align 4
  store i32 %2, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %9

9:                                                ; preds = %27, %3
  %10 = load i32, ptr %7, align 4
  %11 = icmp slt i32 %10, 3
  br i1 %11, label %12, label %30

12:                                               ; preds = %9
  %13 = load i32, ptr %7, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [3 x i32], ptr %4, i64 0, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = load i32, ptr %5, align 4
  %18 = and i32 %16, %17
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %26

20:                                               ; preds = %12
  %21 = load i32, ptr %7, align 4
  %22 = add nsw i32 %21, 1
  %23 = ashr i32 8, %22
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %6, align 4
  br label %26

26:                                               ; preds = %20, %12
  br label %27

27:                                               ; preds = %26
  %28 = load i32, ptr %7, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %7, align 4
  br label %9

30:                                               ; preds = %9
  %31 = load i32, ptr %6, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @stepsystem(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.tree, ptr %7, i32 0, i32 2
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %6, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %16

11:                                               ; preds = %2
  %12 = load ptr, ptr %6, align 8
  %13 = call i32 @freetree1(ptr noundef %12)
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.tree, ptr %14, i32 0, i32 2
  store ptr null, ptr %15, align 8
  br label %16

16:                                               ; preds = %11, %2
  %17 = load ptr, ptr %5, align 8
  %18 = load i32, ptr @nbody, align 4
  %19 = load ptr, ptr %3, align 8
  %20 = load i32, ptr %4, align 4
  %21 = call ptr @maketree(ptr noundef %17, i32 noundef %18, ptr noundef %19, i32 noundef %20, i32 noundef 0)
  store ptr %21, ptr %6, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.tree, ptr %22, i32 0, i32 2
  store ptr %21, ptr %23, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = load i32, ptr %4, align 4
  %26 = call i32 @computegrav(ptr noundef %24, i32 noundef %25)
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.tree, ptr %27, i32 0, i32 4
  %29 = load ptr, ptr %28, align 8
  %30 = load i32, ptr %4, align 4
  %31 = call i32 @vp(ptr noundef %29, i32 noundef %30)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @freetree1(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = call i32 @freetree(ptr noundef %0)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @maketree(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca %struct.icstruct, align 4
  %15 = alloca %struct.icstruct, align 4
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  %16 = load ptr, ptr %8, align 8
  %17 = getelementptr inbounds %struct.tree, ptr %16, i32 0, i32 2
  store ptr null, ptr %17, align 8
  %18 = load i32, ptr %7, align 4
  store i32 %18, ptr @nbody, align 4
  %19 = load i32, ptr @__NumNodes, align 4
  %20 = sub nsw i32 %19, 1
  store i32 %20, ptr %12, align 4
  br label %21

21:                                               ; preds = %69, %5
  %22 = load i32, ptr %12, align 4
  %23 = icmp sge i32 %22, 0
  br i1 %23, label %24, label %72

24:                                               ; preds = %21
  %25 = load ptr, ptr %8, align 8
  %26 = getelementptr inbounds %struct.tree, ptr %25, i32 0, i32 4
  %27 = load i32, ptr %12, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [64 x ptr], ptr %26, i64 0, i64 %28
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %6, align 8
  store ptr %30, ptr %11, align 8
  br label %31

31:                                               ; preds = %64, %24
  %32 = load ptr, ptr %11, align 8
  %33 = icmp ne ptr %32, null
  br i1 %33, label %34, label %68

34:                                               ; preds = %31
  %35 = load ptr, ptr %11, align 8
  %36 = getelementptr inbounds %struct.bnode, ptr %35, i32 0, i32 1
  %37 = load double, ptr %36, align 8
  %38 = fcmp une double %37, 0.000000e+00
  br i1 %38, label %39, label %63

39:                                               ; preds = %34
  %40 = load ptr, ptr %11, align 8
  %41 = load ptr, ptr %8, align 8
  %42 = load i32, ptr %9, align 4
  %43 = load i32, ptr %10, align 4
  %44 = call i32 @expandbox(ptr noundef %40, ptr noundef %41, i32 noundef %42, i32 noundef %43)
  %45 = load ptr, ptr %11, align 8
  %46 = load ptr, ptr %8, align 8
  %47 = call { i64, i64 } @intcoord(ptr noundef %45, ptr noundef %46)
  %48 = extractvalue { i64, i64 } %47, 0
  store i64 %48, ptr %15, align 4
  %49 = getelementptr inbounds { i64, i64 }, ptr %15, i32 0, i32 1
  %50 = extractvalue { i64, i64 } %47, 1
  store i64 %50, ptr %49, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %14, ptr align 4 %15, i64 16, i1 false)
  %51 = load ptr, ptr %8, align 8
  %52 = getelementptr inbounds %struct.tree, ptr %51, i32 0, i32 2
  %53 = load ptr, ptr %52, align 8
  store ptr %53, ptr %13, align 8
  %54 = load ptr, ptr %11, align 8
  %55 = load ptr, ptr %13, align 8
  %56 = load ptr, ptr %8, align 8
  %57 = load i64, ptr %14, align 4
  %58 = getelementptr inbounds { i64, i64 }, ptr %14, i32 0, i32 1
  %59 = load i64, ptr %58, align 4
  %60 = call ptr @loadtree(ptr noundef %54, i64 %57, i64 %59, ptr noundef %55, i32 noundef 536870912, ptr noundef %56)
  store ptr %60, ptr %13, align 8
  %61 = load ptr, ptr %8, align 8
  %62 = getelementptr inbounds %struct.tree, ptr %61, i32 0, i32 2
  store ptr %60, ptr %62, align 8
  br label %63

63:                                               ; preds = %39, %34
  br label %64

64:                                               ; preds = %63
  %65 = load ptr, ptr %11, align 8
  %66 = getelementptr inbounds %struct.bnode, ptr %65, i32 0, i32 10
  %67 = load ptr, ptr %66, align 8
  store ptr %67, ptr %11, align 8
  br label %31

68:                                               ; preds = %31
  br label %69

69:                                               ; preds = %68
  %70 = load i32, ptr %12, align 4
  %71 = add nsw i32 %70, -1
  store i32 %71, ptr %12, align 4
  br label %21

72:                                               ; preds = %21
  %73 = load ptr, ptr %8, align 8
  %74 = getelementptr inbounds %struct.tree, ptr %73, i32 0, i32 2
  %75 = load ptr, ptr %74, align 8
  store ptr %75, ptr %13, align 8
  %76 = call double @hackcofm(ptr noundef %75)
  %77 = load ptr, ptr %8, align 8
  %78 = getelementptr inbounds %struct.tree, ptr %77, i32 0, i32 2
  %79 = load ptr, ptr %78, align 8
  ret ptr %79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @computegrav(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.tree, ptr %10, i32 0, i32 1
  %12 = load double, ptr %11, align 8
  store double %12, ptr %6, align 8
  store double 6.250000e-03, ptr %7, align 8
  %13 = load i32, ptr @__NumNodes, align 4
  %14 = sub nsw i32 %13, 1
  store i32 %14, ptr %5, align 4
  br label %15

15:                                               ; preds = %34, %2
  %16 = load i32, ptr %5, align 4
  %17 = icmp sge i32 %16, 0
  br i1 %17, label %18, label %37

18:                                               ; preds = %15
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.tree, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %8, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.tree, ptr %22, i32 0, i32 4
  %24 = load i32, ptr %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [64 x ptr], ptr %23, i64 0, i64 %25
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %9, align 8
  %28 = load double, ptr %6, align 8
  %29 = load ptr, ptr %8, align 8
  %30 = load ptr, ptr %9, align 8
  %31 = load i32, ptr %4, align 4
  %32 = load double, ptr %7, align 8
  %33 = call i32 @grav(double noundef %28, ptr noundef %29, ptr noundef %30, i32 noundef %31, double noundef %32)
  br label %34

34:                                               ; preds = %18
  %35 = load i32, ptr %5, align 4
  %36 = add nsw i32 %35, -1
  store i32 %36, ptr %5, align 4
  br label %15

37:                                               ; preds = %15
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @vp(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  %6 = alloca [3 x double], align 16
  %7 = alloca [3 x double], align 16
  %8 = alloca [3 x double], align 16
  %9 = alloca [3 x double], align 16
  %10 = alloca [3 x double], align 16
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca i32, align 4
  %21 = alloca double, align 8
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca i32, align 4
  %25 = alloca double, align 8
  %26 = alloca double, align 8
  %27 = alloca double, align 8
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca double, align 8
  %34 = alloca double, align 8
  %35 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store double 6.250000e-03, ptr %5, align 8
  %36 = load ptr, ptr %3, align 8
  %37 = icmp ne ptr %36, null
  br i1 %37, label %38, label %40

38:                                               ; preds = %2
  %39 = load ptr, ptr %3, align 8
  store ptr %39, ptr %11, align 8
  br label %40

40:                                               ; preds = %38, %2
  br label %41

41:                                               ; preds = %455, %40
  %42 = load ptr, ptr %3, align 8
  %43 = icmp ne ptr %42, null
  br i1 %43, label %44, label %459

44:                                               ; preds = %41
  store i32 0, ptr %12, align 4
  br label %45

45:                                               ; preds = %56, %44
  %46 = load i32, ptr %12, align 4
  %47 = icmp slt i32 %46, 3
  br i1 %47, label %48, label %59

48:                                               ; preds = %45
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds %struct.bnode, ptr %49, i32 0, i32 7
  %51 = load i32, ptr %12, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [3 x double], ptr %50, i64 0, i64 %52
  %54 = load double, ptr %53, align 8
  %55 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %52
  store double %54, ptr %55, align 8
  br label %56

56:                                               ; preds = %48
  %57 = load i32, ptr %12, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %12, align 4
  br label %45

59:                                               ; preds = %45
  %60 = load i32, ptr %4, align 4
  %61 = icmp sgt i32 %60, 0
  br i1 %61, label %62, label %128

62:                                               ; preds = %59
  store i32 0, ptr %13, align 4
  br label %63

63:                                               ; preds = %77, %62
  %64 = load i32, ptr %13, align 4
  %65 = icmp slt i32 %64, 3
  br i1 %65, label %66, label %80

66:                                               ; preds = %63
  %67 = load i32, ptr %13, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %68
  %70 = load double, ptr %69, align 8
  %71 = load ptr, ptr %3, align 8
  %72 = getelementptr inbounds %struct.bnode, ptr %71, i32 0, i32 6
  %73 = getelementptr inbounds [3 x double], ptr %72, i64 0, i64 %68
  %74 = load double, ptr %73, align 8
  %75 = fsub double %70, %74
  %76 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 %68
  store double %75, ptr %76, align 8
  br label %77

77:                                               ; preds = %66
  %78 = load i32, ptr %13, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, ptr %13, align 4
  br label %63

80:                                               ; preds = %63
  store i32 0, ptr %14, align 4
  br label %81

81:                                               ; preds = %92, %80
  %82 = load i32, ptr %14, align 4
  %83 = icmp slt i32 %82, 3
  br i1 %83, label %84, label %95

84:                                               ; preds = %81
  %85 = load i32, ptr %14, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 %86
  %88 = load double, ptr %87, align 8
  %89 = load double, ptr %5, align 8
  %90 = fmul double %88, %89
  %91 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %86
  store double %90, ptr %91, align 8
  br label %92

92:                                               ; preds = %84
  %93 = load i32, ptr %14, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, ptr %14, align 4
  br label %81

95:                                               ; preds = %81
  store i32 0, ptr %15, align 4
  br label %96

96:                                               ; preds = %109, %95
  %97 = load i32, ptr %15, align 4
  %98 = icmp slt i32 %97, 3
  br i1 %98, label %99, label %112

99:                                               ; preds = %96
  %100 = load ptr, ptr %3, align 8
  %101 = getelementptr inbounds %struct.bnode, ptr %100, i32 0, i32 5
  %102 = load i32, ptr %15, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [3 x double], ptr %101, i64 0, i64 %103
  %105 = load double, ptr %104, align 8
  %106 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %103
  %107 = load double, ptr %106, align 8
  %108 = fadd double %105, %107
  store double %108, ptr %106, align 8
  br label %109

109:                                              ; preds = %99
  %110 = load i32, ptr %15, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, ptr %15, align 4
  br label %96

112:                                              ; preds = %96
  store i32 0, ptr %16, align 4
  br label %113

113:                                              ; preds = %124, %112
  %114 = load i32, ptr %16, align 4
  %115 = icmp slt i32 %114, 3
  br i1 %115, label %116, label %127

116:                                              ; preds = %113
  %117 = load i32, ptr %16, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %118
  %120 = load double, ptr %119, align 8
  %121 = load ptr, ptr %3, align 8
  %122 = getelementptr inbounds %struct.bnode, ptr %121, i32 0, i32 5
  %123 = getelementptr inbounds [3 x double], ptr %122, i64 0, i64 %118
  store double %120, ptr %123, align 8
  br label %124

124:                                              ; preds = %116
  %125 = load i32, ptr %16, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, ptr %16, align 4
  br label %113

127:                                              ; preds = %113
  br label %128

128:                                              ; preds = %127, %59
  %129 = load ptr, ptr %3, align 8
  %130 = getelementptr inbounds %struct.bnode, ptr %129, i32 0, i32 2
  %131 = load double, ptr %130, align 8
  store double %131, ptr %17, align 8
  %132 = load ptr, ptr %3, align 8
  %133 = getelementptr inbounds %struct.bnode, ptr %132, i32 0, i32 2
  %134 = getelementptr inbounds [3 x double], ptr %133, i64 0, i64 1
  %135 = load double, ptr %134, align 8
  store double %135, ptr %18, align 8
  %136 = load ptr, ptr %3, align 8
  %137 = getelementptr inbounds %struct.bnode, ptr %136, i32 0, i32 2
  %138 = getelementptr inbounds [3 x double], ptr %137, i64 0, i64 2
  %139 = load double, ptr %138, align 8
  store double %139, ptr %19, align 8
  %140 = load double, ptr %17, align 8
  %141 = call i32 (double, ...) @isnan(double noundef %140)
  %142 = icmp ne i32 %141, 0
  br i1 %142, label %143, label %146

143:                                              ; preds = %128
  %144 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 99)
  %145 = call i32 @exit(i32 noundef 0) #10
  unreachable

146:                                              ; preds = %128
  %147 = load double, ptr %18, align 8
  %148 = call i32 (double, ...) @isnan(double noundef %147)
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %150, label %153

150:                                              ; preds = %146
  %151 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 98)
  %152 = call i32 @exit(i32 noundef 0) #10
  unreachable

153:                                              ; preds = %146
  %154 = load double, ptr %19, align 8
  %155 = call i32 (double, ...) @isnan(double noundef %154)
  %156 = icmp ne i32 %155, 0
  br i1 %156, label %157, label %160

157:                                              ; preds = %153
  %158 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 97)
  %159 = call i32 @exit(i32 noundef 0) #10
  unreachable

160:                                              ; preds = %153
  %161 = load double, ptr %17, align 8
  %162 = call double @llvm.fabs.f64(double %161)
  %163 = fcmp olt double %162, 1.000000e+01
  br i1 %163, label %167, label %164

164:                                              ; preds = %160
  %165 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 96)
  %166 = call i32 @exit(i32 noundef 0) #10
  unreachable

167:                                              ; preds = %160
  %168 = load double, ptr %18, align 8
  %169 = call double @llvm.fabs.f64(double %168)
  %170 = fcmp olt double %169, 1.000000e+01
  br i1 %170, label %174, label %171

171:                                              ; preds = %167
  %172 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 95)
  %173 = call i32 @exit(i32 noundef 0) #10
  unreachable

174:                                              ; preds = %167
  %175 = load double, ptr %19, align 8
  %176 = call double @llvm.fabs.f64(double %175)
  %177 = fcmp olt double %176, 1.000000e+01
  br i1 %177, label %181, label %178

178:                                              ; preds = %174
  %179 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 94)
  %180 = call i32 @exit(i32 noundef 0) #10
  unreachable

181:                                              ; preds = %174
  store i32 0, ptr %20, align 4
  br label %182

182:                                              ; preds = %193, %181
  %183 = load i32, ptr %20, align 4
  %184 = icmp slt i32 %183, 3
  br i1 %184, label %185, label %196

185:                                              ; preds = %182
  %186 = load i32, ptr %20, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %187
  %189 = load double, ptr %188, align 8
  %190 = load ptr, ptr %3, align 8
  %191 = getelementptr inbounds %struct.bnode, ptr %190, i32 0, i32 6
  %192 = getelementptr inbounds [3 x double], ptr %191, i64 0, i64 %187
  store double %189, ptr %192, align 8
  br label %193

193:                                              ; preds = %185
  %194 = load i32, ptr %20, align 4
  %195 = add nsw i32 %194, 1
  store i32 %195, ptr %20, align 4
  br label %182

196:                                              ; preds = %182
  %197 = load ptr, ptr %3, align 8
  %198 = getelementptr inbounds %struct.bnode, ptr %197, i32 0, i32 6
  %199 = load double, ptr %198, align 8
  store double %199, ptr %21, align 8
  %200 = load ptr, ptr %3, align 8
  %201 = getelementptr inbounds %struct.bnode, ptr %200, i32 0, i32 6
  %202 = getelementptr inbounds [3 x double], ptr %201, i64 0, i64 1
  %203 = load double, ptr %202, align 8
  store double %203, ptr %22, align 8
  %204 = load ptr, ptr %3, align 8
  %205 = getelementptr inbounds %struct.bnode, ptr %204, i32 0, i32 6
  %206 = getelementptr inbounds [3 x double], ptr %205, i64 0, i64 2
  %207 = load double, ptr %206, align 8
  store double %207, ptr %23, align 8
  %208 = load double, ptr %21, align 8
  %209 = call i32 (double, ...) @isnan(double noundef %208)
  %210 = icmp ne i32 %209, 0
  br i1 %210, label %211, label %214

211:                                              ; preds = %196
  %212 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 89)
  %213 = call i32 @exit(i32 noundef 0) #10
  unreachable

214:                                              ; preds = %196
  %215 = load double, ptr %22, align 8
  %216 = call i32 (double, ...) @isnan(double noundef %215)
  %217 = icmp ne i32 %216, 0
  br i1 %217, label %218, label %221

218:                                              ; preds = %214
  %219 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 88)
  %220 = call i32 @exit(i32 noundef 0) #10
  unreachable

221:                                              ; preds = %214
  %222 = load double, ptr %23, align 8
  %223 = call i32 (double, ...) @isnan(double noundef %222)
  %224 = icmp ne i32 %223, 0
  br i1 %224, label %225, label %228

225:                                              ; preds = %221
  %226 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 87)
  %227 = call i32 @exit(i32 noundef 0) #10
  unreachable

228:                                              ; preds = %221
  %229 = load double, ptr %21, align 8
  %230 = call double @llvm.fabs.f64(double %229)
  %231 = fcmp olt double %230, 1.000000e+04
  br i1 %231, label %235, label %232

232:                                              ; preds = %228
  %233 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 86)
  %234 = call i32 @exit(i32 noundef 0) #10
  unreachable

235:                                              ; preds = %228
  %236 = load double, ptr %22, align 8
  %237 = call double @llvm.fabs.f64(double %236)
  %238 = fcmp olt double %237, 1.000000e+04
  br i1 %238, label %242, label %239

239:                                              ; preds = %235
  %240 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 85)
  %241 = call i32 @exit(i32 noundef 0) #10
  unreachable

242:                                              ; preds = %235
  %243 = load double, ptr %23, align 8
  %244 = call double @llvm.fabs.f64(double %243)
  %245 = fcmp olt double %244, 1.000000e+04
  br i1 %245, label %249, label %246

246:                                              ; preds = %242
  %247 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 84)
  %248 = call i32 @exit(i32 noundef 0) #10
  unreachable

249:                                              ; preds = %242
  store i32 0, ptr %24, align 4
  br label %250

250:                                              ; preds = %263, %249
  %251 = load i32, ptr %24, align 4
  %252 = icmp slt i32 %251, 3
  br i1 %252, label %253, label %266

253:                                              ; preds = %250
  %254 = load ptr, ptr %3, align 8
  %255 = getelementptr inbounds %struct.bnode, ptr %254, i32 0, i32 6
  %256 = load i32, ptr %24, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [3 x double], ptr %255, i64 0, i64 %257
  %259 = load double, ptr %258, align 8
  %260 = load double, ptr %5, align 8
  %261 = fmul double %259, %260
  %262 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %257
  store double %261, ptr %262, align 8
  br label %263

263:                                              ; preds = %253
  %264 = load i32, ptr %24, align 4
  %265 = add nsw i32 %264, 1
  store i32 %265, ptr %24, align 4
  br label %250

266:                                              ; preds = %250
  %267 = load ptr, ptr %3, align 8
  %268 = getelementptr inbounds %struct.bnode, ptr %267, i32 0, i32 5
  %269 = load double, ptr %268, align 8
  store double %269, ptr %25, align 8
  %270 = load ptr, ptr %3, align 8
  %271 = getelementptr inbounds %struct.bnode, ptr %270, i32 0, i32 5
  %272 = getelementptr inbounds [3 x double], ptr %271, i64 0, i64 1
  %273 = load double, ptr %272, align 8
  store double %273, ptr %26, align 8
  %274 = load ptr, ptr %3, align 8
  %275 = getelementptr inbounds %struct.bnode, ptr %274, i32 0, i32 5
  %276 = getelementptr inbounds [3 x double], ptr %275, i64 0, i64 2
  %277 = load double, ptr %276, align 8
  store double %277, ptr %27, align 8
  %278 = load double, ptr %25, align 8
  %279 = call i32 (double, ...) @isnan(double noundef %278)
  %280 = icmp ne i32 %279, 0
  br i1 %280, label %281, label %284

281:                                              ; preds = %266
  %282 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 79)
  %283 = call i32 @exit(i32 noundef 0) #10
  unreachable

284:                                              ; preds = %266
  %285 = load double, ptr %26, align 8
  %286 = call i32 (double, ...) @isnan(double noundef %285)
  %287 = icmp ne i32 %286, 0
  br i1 %287, label %288, label %291

288:                                              ; preds = %284
  %289 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 78)
  %290 = call i32 @exit(i32 noundef 0) #10
  unreachable

291:                                              ; preds = %284
  %292 = load double, ptr %27, align 8
  %293 = call i32 (double, ...) @isnan(double noundef %292)
  %294 = icmp ne i32 %293, 0
  br i1 %294, label %295, label %298

295:                                              ; preds = %291
  %296 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 77)
  %297 = call i32 @exit(i32 noundef 0) #10
  unreachable

298:                                              ; preds = %291
  %299 = load double, ptr %25, align 8
  %300 = call double @llvm.fabs.f64(double %299)
  %301 = fcmp olt double %300, 1.000000e+04
  br i1 %301, label %305, label %302

302:                                              ; preds = %298
  %303 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 76)
  %304 = call i32 @exit(i32 noundef 0) #10
  unreachable

305:                                              ; preds = %298
  %306 = load double, ptr %26, align 8
  %307 = call double @llvm.fabs.f64(double %306)
  %308 = fcmp olt double %307, 1.000000e+04
  br i1 %308, label %312, label %309

309:                                              ; preds = %305
  %310 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 75)
  %311 = call i32 @exit(i32 noundef 0) #10
  unreachable

312:                                              ; preds = %305
  %313 = load double, ptr %27, align 8
  %314 = call double @llvm.fabs.f64(double %313)
  %315 = fcmp olt double %314, 1.000000e+04
  br i1 %315, label %319, label %316

316:                                              ; preds = %312
  %317 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 74)
  %318 = call i32 @exit(i32 noundef 0) #10
  unreachable

319:                                              ; preds = %312
  store i32 0, ptr %28, align 4
  br label %320

320:                                              ; preds = %334, %319
  %321 = load i32, ptr %28, align 4
  %322 = icmp slt i32 %321, 3
  br i1 %322, label %323, label %337

323:                                              ; preds = %320
  %324 = load ptr, ptr %3, align 8
  %325 = getelementptr inbounds %struct.bnode, ptr %324, i32 0, i32 5
  %326 = load i32, ptr %28, align 4
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds [3 x double], ptr %325, i64 0, i64 %327
  %329 = load double, ptr %328, align 8
  %330 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %327
  %331 = load double, ptr %330, align 8
  %332 = fadd double %329, %331
  %333 = getelementptr inbounds [3 x double], ptr %9, i64 0, i64 %327
  store double %332, ptr %333, align 8
  br label %334

334:                                              ; preds = %323
  %335 = load i32, ptr %28, align 4
  %336 = add nsw i32 %335, 1
  store i32 %336, ptr %28, align 4
  br label %320

337:                                              ; preds = %320
  store i32 0, ptr %29, align 4
  br label %338

338:                                              ; preds = %348, %337
  %339 = load i32, ptr %29, align 4
  %340 = icmp slt i32 %339, 3
  br i1 %340, label %341, label %351

341:                                              ; preds = %338
  %342 = load i32, ptr %29, align 4
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds [3 x double], ptr %9, i64 0, i64 %343
  %345 = load double, ptr %344, align 8
  %346 = fmul double %345, 1.250000e-02
  %347 = getelementptr inbounds [3 x double], ptr %10, i64 0, i64 %343
  store double %346, ptr %347, align 8
  br label %348

348:                                              ; preds = %341
  %349 = load i32, ptr %29, align 4
  %350 = add nsw i32 %349, 1
  store i32 %350, ptr %29, align 4
  br label %338

351:                                              ; preds = %338
  store i32 0, ptr %30, align 4
  br label %352

352:                                              ; preds = %365, %351
  %353 = load i32, ptr %30, align 4
  %354 = icmp slt i32 %353, 3
  br i1 %354, label %355, label %368

355:                                              ; preds = %352
  %356 = load ptr, ptr %3, align 8
  %357 = getelementptr inbounds %struct.bnode, ptr %356, i32 0, i32 2
  %358 = load i32, ptr %30, align 4
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds [3 x double], ptr %357, i64 0, i64 %359
  %361 = load double, ptr %360, align 8
  %362 = getelementptr inbounds [3 x double], ptr %10, i64 0, i64 %359
  %363 = load double, ptr %362, align 8
  %364 = fadd double %361, %363
  store double %364, ptr %362, align 8
  br label %365

365:                                              ; preds = %355
  %366 = load i32, ptr %30, align 4
  %367 = add nsw i32 %366, 1
  store i32 %367, ptr %30, align 4
  br label %352

368:                                              ; preds = %352
  store i32 0, ptr %31, align 4
  br label %369

369:                                              ; preds = %380, %368
  %370 = load i32, ptr %31, align 4
  %371 = icmp slt i32 %370, 3
  br i1 %371, label %372, label %383

372:                                              ; preds = %369
  %373 = load i32, ptr %31, align 4
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds [3 x double], ptr %10, i64 0, i64 %374
  %376 = load double, ptr %375, align 8
  %377 = load ptr, ptr %3, align 8
  %378 = getelementptr inbounds %struct.bnode, ptr %377, i32 0, i32 2
  %379 = getelementptr inbounds [3 x double], ptr %378, i64 0, i64 %374
  store double %376, ptr %379, align 8
  br label %380

380:                                              ; preds = %372
  %381 = load i32, ptr %31, align 4
  %382 = add nsw i32 %381, 1
  store i32 %382, ptr %31, align 4
  br label %369

383:                                              ; preds = %369
  store i32 0, ptr %32, align 4
  br label %384

384:                                              ; preds = %398, %383
  %385 = load i32, ptr %32, align 4
  %386 = icmp slt i32 %385, 3
  br i1 %386, label %387, label %401

387:                                              ; preds = %384
  %388 = load i32, ptr %32, align 4
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds [3 x double], ptr %9, i64 0, i64 %389
  %391 = load double, ptr %390, align 8
  %392 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %389
  %393 = load double, ptr %392, align 8
  %394 = fadd double %391, %393
  %395 = load ptr, ptr %3, align 8
  %396 = getelementptr inbounds %struct.bnode, ptr %395, i32 0, i32 5
  %397 = getelementptr inbounds [3 x double], ptr %396, i64 0, i64 %389
  store double %394, ptr %397, align 8
  br label %398

398:                                              ; preds = %387
  %399 = load i32, ptr %32, align 4
  %400 = add nsw i32 %399, 1
  store i32 %400, ptr %32, align 4
  br label %384

401:                                              ; preds = %384
  %402 = load ptr, ptr %3, align 8
  %403 = getelementptr inbounds %struct.bnode, ptr %402, i32 0, i32 2
  %404 = load double, ptr %403, align 8
  store double %404, ptr %33, align 8
  %405 = load ptr, ptr %3, align 8
  %406 = getelementptr inbounds %struct.bnode, ptr %405, i32 0, i32 2
  %407 = getelementptr inbounds [3 x double], ptr %406, i64 0, i64 1
  %408 = load double, ptr %407, align 8
  store double %408, ptr %34, align 8
  %409 = load ptr, ptr %3, align 8
  %410 = getelementptr inbounds %struct.bnode, ptr %409, i32 0, i32 2
  %411 = getelementptr inbounds [3 x double], ptr %410, i64 0, i64 2
  %412 = load double, ptr %411, align 8
  store double %412, ptr %35, align 8
  %413 = load double, ptr %33, align 8
  %414 = call i32 (double, ...) @isnan(double noundef %413)
  %415 = icmp ne i32 %414, 0
  br i1 %415, label %416, label %419

416:                                              ; preds = %401
  %417 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 69)
  %418 = call i32 @exit(i32 noundef 0) #10
  unreachable

419:                                              ; preds = %401
  %420 = load double, ptr %34, align 8
  %421 = call i32 (double, ...) @isnan(double noundef %420)
  %422 = icmp ne i32 %421, 0
  br i1 %422, label %423, label %426

423:                                              ; preds = %419
  %424 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 68)
  %425 = call i32 @exit(i32 noundef 0) #10
  unreachable

426:                                              ; preds = %419
  %427 = load double, ptr %35, align 8
  %428 = call i32 (double, ...) @isnan(double noundef %427)
  %429 = icmp ne i32 %428, 0
  br i1 %429, label %430, label %433

430:                                              ; preds = %426
  %431 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 67)
  %432 = call i32 @exit(i32 noundef 0) #10
  unreachable

433:                                              ; preds = %426
  %434 = load double, ptr %33, align 8
  %435 = call double @llvm.fabs.f64(double %434)
  %436 = fcmp olt double %435, 1.000000e+04
  br i1 %436, label %440, label %437

437:                                              ; preds = %433
  %438 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 66)
  %439 = call i32 @exit(i32 noundef 0) #10
  unreachable

440:                                              ; preds = %433
  %441 = load double, ptr %34, align 8
  %442 = call double @llvm.fabs.f64(double %441)
  %443 = fcmp olt double %442, 1.000000e+04
  br i1 %443, label %447, label %444

444:                                              ; preds = %440
  %445 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 65)
  %446 = call i32 @exit(i32 noundef 0) #10
  unreachable

447:                                              ; preds = %440
  %448 = load double, ptr %35, align 8
  %449 = call double @llvm.fabs.f64(double %448)
  %450 = fcmp olt double %449, 1.000000e+04
  br i1 %450, label %454, label %451

451:                                              ; preds = %447
  %452 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 64)
  %453 = call i32 @exit(i32 noundef 0) #10
  unreachable

454:                                              ; preds = %447
  br label %455

455:                                              ; preds = %454
  %456 = load ptr, ptr %3, align 8
  %457 = getelementptr inbounds %struct.bnode, ptr %456, i32 0, i32 10
  %458 = load ptr, ptr %457, align 8
  store ptr %458, ptr %3, align 8
  br label %41

459:                                              ; preds = %41
  ret i32 0
}

declare i32 @isnan(...) #1

; Function Attrs: noreturn nounwind
declare i32 @exit(i32 noundef) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @grav(double noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, double noundef %4) #0 {
  %6 = alloca double, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  store double %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  store double %4, ptr %10, align 8
  store i32 0, ptr %12, align 4
  %14 = load ptr, ptr %8, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %18

16:                                               ; preds = %5
  %17 = load ptr, ptr %8, align 8
  store ptr %17, ptr %13, align 8
  br label %18

18:                                               ; preds = %16, %5
  %19 = load ptr, ptr %8, align 8
  store ptr %19, ptr %11, align 8
  br label %20

20:                                               ; preds = %23, %18
  %21 = load ptr, ptr %11, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %35

23:                                               ; preds = %20
  %24 = load double, ptr %6, align 8
  %25 = load ptr, ptr %7, align 8
  %26 = load ptr, ptr %11, align 8
  %27 = load i32, ptr %9, align 4
  %28 = load double, ptr %10, align 8
  %29 = call i32 @gravstep(double noundef %24, ptr noundef %25, ptr noundef %26, i32 noundef %27, double noundef %28)
  %30 = load ptr, ptr %11, align 8
  %31 = getelementptr inbounds %struct.bnode, ptr %30, i32 0, i32 10
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr %11, align 8
  %33 = load i32, ptr %12, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %12, align 4
  br label %20

35:                                               ; preds = %20
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @gravstep(double noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, double noundef %4) #0 {
  %6 = alloca double, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  store double %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  store double %4, ptr %10, align 8
  %11 = load ptr, ptr %8, align 8
  %12 = load double, ptr %6, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = call i32 @hackgrav(ptr noundef %11, double noundef %12, ptr noundef %13)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @hackgrav(ptr noundef %0, double noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.hgstruct, align 8
  %8 = alloca double, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.hgstruct, align 8
  %12 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store double %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %13 = load ptr, ptr %4, align 8
  store ptr %13, ptr %7, align 8
  store i32 0, ptr %9, align 4
  br label %14

14:                                               ; preds = %26, %3
  %15 = load i32, ptr %9, align 4
  %16 = icmp slt i32 %15, 3
  br i1 %16, label %17, label %29

17:                                               ; preds = %14
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.bnode, ptr %18, i32 0, i32 2
  %20 = load i32, ptr %9, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [3 x double], ptr %19, i64 0, i64 %21
  %23 = load double, ptr %22, align 8
  %24 = getelementptr inbounds %struct.hgstruct, ptr %7, i32 0, i32 1
  %25 = getelementptr inbounds [3 x double], ptr %24, i64 0, i64 %21
  store double %23, ptr %25, align 8
  br label %26

26:                                               ; preds = %17
  %27 = load i32, ptr %9, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %9, align 4
  br label %14

29:                                               ; preds = %14
  %30 = getelementptr inbounds %struct.hgstruct, ptr %7, i32 0, i32 2
  store double 0.000000e+00, ptr %30, align 8
  store i32 0, ptr %10, align 4
  br label %31

31:                                               ; preds = %39, %29
  %32 = load i32, ptr %10, align 4
  %33 = icmp slt i32 %32, 3
  br i1 %33, label %34, label %42

34:                                               ; preds = %31
  %35 = getelementptr inbounds %struct.hgstruct, ptr %7, i32 0, i32 3
  %36 = load i32, ptr %10, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [3 x double], ptr %35, i64 0, i64 %37
  store double 0.000000e+00, ptr %38, align 8
  br label %39

39:                                               ; preds = %34
  %40 = load i32, ptr %10, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %10, align 4
  br label %31

42:                                               ; preds = %31
  %43 = load double, ptr %5, align 8
  %44 = fmul double %43, %43
  store double %44, ptr %8, align 8
  %45 = load ptr, ptr %6, align 8
  %46 = load double, ptr %8, align 8
  call void @walksub(ptr sret(%struct.hgstruct) align 8 %11, ptr noundef %45, double noundef %46, double noundef 1.000000e+00, ptr noundef byval(%struct.hgstruct) align 8 %7, i32 noundef 0)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %11, i64 64, i1 false)
  %47 = getelementptr inbounds %struct.hgstruct, ptr %7, i32 0, i32 2
  %48 = load double, ptr %47, align 8
  %49 = load ptr, ptr %4, align 8
  %50 = getelementptr inbounds %struct.bnode, ptr %49, i32 0, i32 8
  store double %48, ptr %50, align 8
  store i32 0, ptr %12, align 4
  br label %51

51:                                               ; preds = %63, %42
  %52 = load i32, ptr %12, align 4
  %53 = icmp slt i32 %52, 3
  br i1 %53, label %54, label %66

54:                                               ; preds = %51
  %55 = getelementptr inbounds %struct.hgstruct, ptr %7, i32 0, i32 3
  %56 = load i32, ptr %12, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [3 x double], ptr %55, i64 0, i64 %57
  %59 = load double, ptr %58, align 8
  %60 = load ptr, ptr %4, align 8
  %61 = getelementptr inbounds %struct.bnode, ptr %60, i32 0, i32 7
  %62 = getelementptr inbounds [3 x double], ptr %61, i64 0, i64 %57
  store double %59, ptr %62, align 8
  br label %63

63:                                               ; preds = %54
  %64 = load i32, ptr %12, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %12, align 4
  br label %51

66:                                               ; preds = %51
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @walksub(ptr noalias sret(%struct.hgstruct) align 8 %0, ptr noundef %1, double noundef %2, double noundef %3, ptr noundef byval(%struct.hgstruct) align 8 %4, i32 noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca %struct.hgstruct, align 8
  %14 = alloca %struct.hgstruct, align 8
  store ptr %1, ptr %7, align 8
  store double %2, ptr %8, align 8
  store double %3, ptr %9, align 8
  store i32 %5, ptr %10, align 4
  %15 = load ptr, ptr %7, align 8
  %16 = load double, ptr %8, align 8
  %17 = load double, ptr %9, align 8
  %18 = call signext i16 @subdivp(ptr noundef %15, double noundef %16, double noundef %17, ptr noundef byval(%struct.hgstruct) align 8 %4)
  %19 = icmp ne i16 %18, 0
  br i1 %19, label %20, label %44

20:                                               ; preds = %6
  store i32 0, ptr %11, align 4
  br label %21

21:                                               ; preds = %40, %20
  %22 = load i32, ptr %11, align 4
  %23 = icmp slt i32 %22, 8
  br i1 %23, label %24, label %43

24:                                               ; preds = %21
  %25 = load ptr, ptr %7, align 8
  %26 = getelementptr inbounds %struct.cnode, ptr %25, i32 0, i32 5
  %27 = load i32, ptr %11, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [8 x ptr], ptr %26, i64 0, i64 %28
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %12, align 8
  %31 = icmp ne ptr %30, null
  br i1 %31, label %32, label %39

32:                                               ; preds = %24
  %33 = load ptr, ptr %12, align 8
  %34 = load double, ptr %8, align 8
  %35 = fdiv double %34, 4.000000e+00
  %36 = load double, ptr %9, align 8
  %37 = load i32, ptr %10, align 4
  %38 = add nsw i32 %37, 1
  call void @walksub(ptr sret(%struct.hgstruct) align 8 %13, ptr noundef %33, double noundef %35, double noundef %36, ptr noundef byval(%struct.hgstruct) align 8 %4, i32 noundef %38)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %13, i64 64, i1 false)
  br label %39

39:                                               ; preds = %32, %24
  br label %40

40:                                               ; preds = %39
  %41 = load i32, ptr %11, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %11, align 4
  br label %21

43:                                               ; preds = %21
  br label %51

44:                                               ; preds = %6
  %45 = load ptr, ptr %7, align 8
  %46 = load ptr, ptr %4, align 8
  %47 = icmp ne ptr %45, %46
  br i1 %47, label %48, label %50

48:                                               ; preds = %44
  %49 = load ptr, ptr %7, align 8
  call void @gravsub(ptr sret(%struct.hgstruct) align 8 %14, ptr noundef %49, ptr noundef byval(%struct.hgstruct) align 8 %4)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %4, ptr align 8 %14, i64 64, i1 false)
  br label %50

50:                                               ; preds = %48, %44
  br label %51

51:                                               ; preds = %50, %43
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 %4, i64 64, i1 false)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @subdivp(ptr noundef %0, double noundef %1, double noundef %2, ptr noundef byval(%struct.hgstruct) align 8 %3) #0 {
  %5 = alloca i16, align 2
  %6 = alloca ptr, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca ptr, align 8
  %10 = alloca [3 x double], align 16
  %11 = alloca double, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store double %1, ptr %7, align 8
  store double %2, ptr %8, align 8
  %14 = load ptr, ptr %6, align 8
  store ptr %14, ptr %9, align 8
  %15 = load i16, ptr %14, align 8
  %16 = sext i16 %15 to i32
  %17 = icmp eq i32 %16, 1
  br i1 %17, label %18, label %19

18:                                               ; preds = %4
  store i16 0, ptr %5, align 2
  br label %60

19:                                               ; preds = %4
  store i32 0, ptr %12, align 4
  br label %20

20:                                               ; preds = %35, %19
  %21 = load i32, ptr %12, align 4
  %22 = icmp slt i32 %21, 3
  br i1 %22, label %23, label %38

23:                                               ; preds = %20
  %24 = load ptr, ptr %9, align 8
  %25 = getelementptr inbounds %struct.node, ptr %24, i32 0, i32 2
  %26 = load i32, ptr %12, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [3 x double], ptr %25, i64 0, i64 %27
  %29 = load double, ptr %28, align 8
  %30 = getelementptr inbounds %struct.hgstruct, ptr %3, i32 0, i32 1
  %31 = getelementptr inbounds [3 x double], ptr %30, i64 0, i64 %27
  %32 = load double, ptr %31, align 8
  %33 = fsub double %29, %32
  %34 = getelementptr inbounds [3 x double], ptr %10, i64 0, i64 %27
  store double %33, ptr %34, align 8
  br label %35

35:                                               ; preds = %23
  %36 = load i32, ptr %12, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %12, align 4
  br label %20

38:                                               ; preds = %20
  store double 0.000000e+00, ptr %11, align 8
  store i32 0, ptr %13, align 4
  br label %39

39:                                               ; preds = %49, %38
  %40 = load i32, ptr %13, align 4
  %41 = icmp slt i32 %40, 3
  br i1 %41, label %42, label %52

42:                                               ; preds = %39
  %43 = load i32, ptr %13, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [3 x double], ptr %10, i64 0, i64 %44
  %46 = load double, ptr %45, align 8
  %47 = load double, ptr %11, align 8
  %48 = call double @llvm.fmuladd.f64(double %46, double %46, double %47)
  store double %48, ptr %11, align 8
  br label %49

49:                                               ; preds = %42
  %50 = load i32, ptr %13, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %13, align 4
  br label %39

52:                                               ; preds = %39
  %53 = load double, ptr %8, align 8
  %54 = load double, ptr %11, align 8
  %55 = fmul double %53, %54
  %56 = load double, ptr %7, align 8
  %57 = fcmp olt double %55, %56
  %58 = zext i1 %57 to i32
  %59 = trunc i32 %58 to i16
  store i16 %59, ptr %5, align 2
  br label %60

60:                                               ; preds = %52, %18
  %61 = load i16, ptr %5, align 2
  ret i16 %61
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @gravsub(ptr noalias sret(%struct.hgstruct) align 8 %0, ptr noundef %1, ptr noundef byval(%struct.hgstruct) align 8 %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca [3 x double], align 16
  %9 = alloca [3 x double], align 16
  %10 = alloca double, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %11, align 4
  br label %15

15:                                               ; preds = %30, %3
  %16 = load i32, ptr %11, align 4
  %17 = icmp slt i32 %16, 3
  br i1 %17, label %18, label %33

18:                                               ; preds = %15
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.node, ptr %19, i32 0, i32 2
  %21 = load i32, ptr %11, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [3 x double], ptr %20, i64 0, i64 %22
  %24 = load double, ptr %23, align 8
  %25 = getelementptr inbounds %struct.hgstruct, ptr %2, i32 0, i32 1
  %26 = getelementptr inbounds [3 x double], ptr %25, i64 0, i64 %22
  %27 = load double, ptr %26, align 8
  %28 = fsub double %24, %27
  %29 = getelementptr inbounds [3 x double], ptr %9, i64 0, i64 %22
  store double %28, ptr %29, align 8
  br label %30

30:                                               ; preds = %18
  %31 = load i32, ptr %11, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %11, align 4
  br label %15

33:                                               ; preds = %15
  store double 0.000000e+00, ptr %10, align 8
  store i32 0, ptr %12, align 4
  br label %34

34:                                               ; preds = %44, %33
  %35 = load i32, ptr %12, align 4
  %36 = icmp slt i32 %35, 3
  br i1 %36, label %37, label %47

37:                                               ; preds = %34
  %38 = load i32, ptr %12, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [3 x double], ptr %9, i64 0, i64 %39
  %41 = load double, ptr %40, align 8
  %42 = load double, ptr %10, align 8
  %43 = call double @llvm.fmuladd.f64(double %41, double %41, double %42)
  store double %43, ptr %10, align 8
  br label %44

44:                                               ; preds = %37
  %45 = load i32, ptr %12, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %12, align 4
  br label %34

47:                                               ; preds = %34
  %48 = load double, ptr %10, align 8
  %49 = fadd double %48, 0x3F647AE147AE147C
  store double %49, ptr %10, align 8
  %50 = call double @sqrt(double noundef %49) #9
  store double %50, ptr %5, align 8
  %51 = load ptr, ptr %4, align 8
  %52 = getelementptr inbounds %struct.node, ptr %51, i32 0, i32 1
  %53 = load double, ptr %52, align 8
  %54 = load double, ptr %5, align 8
  %55 = fdiv double %53, %54
  store double %55, ptr %6, align 8
  %56 = getelementptr inbounds %struct.hgstruct, ptr %2, i32 0, i32 2
  %57 = load double, ptr %56, align 8
  %58 = fsub double %57, %55
  store double %58, ptr %56, align 8
  %59 = load double, ptr %6, align 8
  %60 = load double, ptr %10, align 8
  %61 = fdiv double %59, %60
  store double %61, ptr %7, align 8
  store i32 0, ptr %13, align 4
  br label %62

62:                                               ; preds = %73, %47
  %63 = load i32, ptr %13, align 4
  %64 = icmp slt i32 %63, 3
  br i1 %64, label %65, label %76

65:                                               ; preds = %62
  %66 = load i32, ptr %13, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [3 x double], ptr %9, i64 0, i64 %67
  %69 = load double, ptr %68, align 8
  %70 = load double, ptr %7, align 8
  %71 = fmul double %69, %70
  %72 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %67
  store double %71, ptr %72, align 8
  br label %73

73:                                               ; preds = %65
  %74 = load i32, ptr %13, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %13, align 4
  br label %62

76:                                               ; preds = %62
  store i32 0, ptr %14, align 4
  br label %77

77:                                               ; preds = %89, %76
  %78 = load i32, ptr %14, align 4
  %79 = icmp slt i32 %78, 3
  br i1 %79, label %80, label %92

80:                                               ; preds = %77
  %81 = getelementptr inbounds %struct.hgstruct, ptr %2, i32 0, i32 3
  %82 = load i32, ptr %14, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [3 x double], ptr %81, i64 0, i64 %83
  %85 = load double, ptr %84, align 8
  %86 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 %83
  %87 = load double, ptr %86, align 8
  %88 = fadd double %85, %87
  store double %88, ptr %84, align 8
  br label %89

89:                                               ; preds = %80
  %90 = load i32, ptr %14, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %14, align 4
  br label %77

92:                                               ; preds = %77
  %93 = load ptr, ptr %4, align 8
  %94 = load i16, ptr %93, align 8
  %95 = sext i16 %94 to i32
  %96 = icmp eq i32 %95, 2
  br i1 %96, label %97, label %98

97:                                               ; preds = %92
  br label %98

98:                                               ; preds = %97, %92
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 %2, i64 64, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #5

; Function Attrs: nounwind
declare double @sqrt(double noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @expandbox(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.icstruct, align 4
  %10 = alloca i32, align 4
  %11 = alloca [3 x double], align 16
  %12 = alloca ptr, align 8
  %13 = alloca double, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca double, align 8
  %17 = alloca %struct.icstruct, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %18 = load ptr, ptr %5, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = call i32 @ic_test(ptr noundef %18, ptr noundef %19)
  store i32 %20, ptr %14, align 4
  br label %21

21:                                               ; preds = %130, %4
  %22 = load i32, ptr %14, align 4
  %23 = icmp ne i32 %22, 0
  %24 = xor i1 %23, true
  br i1 %24, label %25, label %131

25:                                               ; preds = %21
  %26 = load ptr, ptr %6, align 8
  %27 = getelementptr inbounds %struct.tree, ptr %26, i32 0, i32 1
  %28 = load double, ptr %27, align 8
  store double %28, ptr %13, align 8
  %29 = fcmp olt double %28, 1.000000e+03
  br i1 %29, label %33, label %30

30:                                               ; preds = %25
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 999)
  %32 = call i32 @exit(i32 noundef 0) #10
  unreachable

33:                                               ; preds = %25
  store i32 0, ptr %15, align 4
  br label %34

34:                                               ; preds = %48, %33
  %35 = load i32, ptr %15, align 4
  %36 = icmp slt i32 %35, 3
  br i1 %36, label %37, label %51

37:                                               ; preds = %34
  %38 = load ptr, ptr %6, align 8
  %39 = load i32, ptr %15, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [3 x double], ptr %38, i64 0, i64 %40
  %42 = load double, ptr %41, align 8
  %43 = load double, ptr %13, align 8
  %44 = call double @llvm.fmuladd.f64(double 5.000000e-01, double %43, double %42)
  %45 = load i32, ptr %15, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 %46
  store double %44, ptr %47, align 8
  br label %48

48:                                               ; preds = %37
  %49 = load i32, ptr %15, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, ptr %15, align 4
  br label %34

51:                                               ; preds = %34
  store i32 0, ptr %10, align 4
  br label %52

52:                                               ; preds = %78, %51
  %53 = load i32, ptr %10, align 4
  %54 = icmp slt i32 %53, 3
  br i1 %54, label %55, label %81

55:                                               ; preds = %52
  %56 = load ptr, ptr %5, align 8
  %57 = getelementptr inbounds %struct.bnode, ptr %56, i32 0, i32 2
  %58 = load i32, ptr %10, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [3 x double], ptr %57, i64 0, i64 %59
  %61 = load double, ptr %60, align 8
  %62 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 %59
  %63 = load double, ptr %62, align 8
  %64 = fcmp olt double %61, %63
  br i1 %64, label %65, label %77

65:                                               ; preds = %55
  %66 = load ptr, ptr %6, align 8
  %67 = load i32, ptr %10, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [3 x double], ptr %66, i64 0, i64 %68
  %70 = load double, ptr %69, align 8
  store double %70, ptr %16, align 8
  %71 = load double, ptr %13, align 8
  %72 = fsub double %70, %71
  %73 = load ptr, ptr %6, align 8
  %74 = load i32, ptr %10, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [3 x double], ptr %73, i64 0, i64 %75
  store double %72, ptr %76, align 8
  br label %77

77:                                               ; preds = %65, %55
  br label %78

78:                                               ; preds = %77
  %79 = load i32, ptr %10, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %10, align 4
  br label %52

81:                                               ; preds = %52
  %82 = load double, ptr %13, align 8
  %83 = fmul double 2.000000e+00, %82
  %84 = load ptr, ptr %6, align 8
  %85 = getelementptr inbounds %struct.tree, ptr %84, i32 0, i32 1
  store double %83, ptr %85, align 8
  %86 = load ptr, ptr %6, align 8
  %87 = getelementptr inbounds %struct.tree, ptr %86, i32 0, i32 1
  %88 = load double, ptr %87, align 8
  store double %88, ptr %13, align 8
  %89 = load ptr, ptr %6, align 8
  %90 = getelementptr inbounds %struct.tree, ptr %89, i32 0, i32 2
  %91 = load ptr, ptr %90, align 8
  %92 = icmp ne ptr %91, null
  br i1 %92, label %93, label %130

93:                                               ; preds = %81
  %94 = call ptr @cell_alloc(i32 noundef 0)
  store ptr %94, ptr %12, align 8
  %95 = load double, ptr %11, align 16
  %96 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 1
  %97 = load double, ptr %96, align 8
  %98 = getelementptr inbounds [3 x double], ptr %11, i64 0, i64 2
  %99 = load double, ptr %98, align 16
  %100 = load ptr, ptr %6, align 8
  %101 = call { i64, i64 } @intcoord1(double noundef %95, double noundef %97, double noundef %99, ptr noundef %100)
  %102 = extractvalue { i64, i64 } %101, 0
  store i64 %102, ptr %17, align 4
  %103 = getelementptr inbounds { i64, i64 }, ptr %17, i32 0, i32 1
  %104 = extractvalue { i64, i64 } %101, 1
  store i64 %104, ptr %103, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %9, ptr align 4 %17, i64 16, i1 false)
  %105 = getelementptr inbounds %struct.icstruct, ptr %9, i32 0, i32 1
  %106 = load i16, ptr %105, align 4
  %107 = icmp ne i16 %106, 0
  br i1 %107, label %111, label %108

108:                                              ; preds = %93
  %109 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 1)
  %110 = call i32 @exit(i32 noundef 0) #10
  unreachable

111:                                              ; preds = %93
  %112 = load i64, ptr %9, align 4
  %113 = getelementptr inbounds { i64, i64 }, ptr %9, i32 0, i32 1
  %114 = load i64, ptr %113, align 4
  %115 = call i32 @old_subindex(i64 %112, i64 %114, i32 noundef 536870912)
  store i32 %115, ptr %10, align 4
  %116 = load ptr, ptr %6, align 8
  %117 = getelementptr inbounds %struct.tree, ptr %116, i32 0, i32 2
  %118 = load ptr, ptr %117, align 8
  %119 = load ptr, ptr %12, align 8
  %120 = getelementptr inbounds %struct.cnode, ptr %119, i32 0, i32 5
  %121 = load i32, ptr %10, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [8 x ptr], ptr %120, i64 0, i64 %122
  store ptr %118, ptr %123, align 8
  %124 = load ptr, ptr %12, align 8
  %125 = load ptr, ptr %6, align 8
  %126 = getelementptr inbounds %struct.tree, ptr %125, i32 0, i32 2
  store ptr %124, ptr %126, align 8
  %127 = load ptr, ptr %5, align 8
  %128 = load ptr, ptr %6, align 8
  %129 = call i32 @ic_test(ptr noundef %127, ptr noundef %128)
  store i32 %129, ptr %14, align 4
  br label %130

130:                                              ; preds = %111, %81
  br label %21

131:                                              ; preds = %21
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @loadtree(ptr noundef %0, i64 %1, i64 %2, ptr noundef %3, i32 noundef %4, ptr noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca %struct.icstruct, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  store i64 %1, ptr %8, align 4
  %17 = getelementptr inbounds { i64, i64 }, ptr %8, i32 0, i32 1
  store i64 %2, ptr %17, align 4
  store ptr %0, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store i32 %4, ptr %11, align 4
  store ptr %5, ptr %12, align 8
  %18 = load ptr, ptr %10, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %22

20:                                               ; preds = %6
  %21 = load ptr, ptr %9, align 8
  store ptr %21, ptr %7, align 8
  br label %76

22:                                               ; preds = %6
  %23 = load i32, ptr %11, align 4
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %28, label %25

25:                                               ; preds = %22
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 2)
  %27 = call i32 @exit(i32 noundef 0) #10
  unreachable

28:                                               ; preds = %22
  %29 = load ptr, ptr %10, align 8
  %30 = load i16, ptr %29, align 8
  %31 = sext i16 %30 to i32
  %32 = icmp eq i32 %31, 1
  br i1 %32, label %33, label %49

33:                                               ; preds = %28
  %34 = load ptr, ptr %10, align 8
  %35 = ptrtoint ptr %34 to i32
  %36 = and i32 %35, 127
  store i32 %36, ptr %16, align 4
  %37 = call ptr @cell_alloc(i32 noundef %36)
  store ptr %37, ptr %14, align 8
  %38 = load ptr, ptr %10, align 8
  %39 = load ptr, ptr %12, align 8
  %40 = load i32, ptr %11, align 4
  %41 = call i32 @subindex(ptr noundef %38, ptr noundef %39, i32 noundef %40)
  store i32 %41, ptr %13, align 4
  %42 = load ptr, ptr %10, align 8
  %43 = load ptr, ptr %14, align 8
  %44 = getelementptr inbounds %struct.cnode, ptr %43, i32 0, i32 5
  %45 = load i32, ptr %13, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [8 x ptr], ptr %44, i64 0, i64 %46
  store ptr %42, ptr %47, align 8
  %48 = load ptr, ptr %14, align 8
  store ptr %48, ptr %10, align 8
  br label %49

49:                                               ; preds = %33, %28
  %50 = load i32, ptr %11, align 4
  %51 = load i64, ptr %8, align 4
  %52 = getelementptr inbounds { i64, i64 }, ptr %8, i32 0, i32 1
  %53 = load i64, ptr %52, align 4
  %54 = call i32 @old_subindex(i64 %51, i64 %53, i32 noundef %50)
  store i32 %54, ptr %13, align 4
  %55 = load ptr, ptr %10, align 8
  %56 = getelementptr inbounds %struct.cnode, ptr %55, i32 0, i32 5
  %57 = load i32, ptr %13, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [8 x ptr], ptr %56, i64 0, i64 %58
  %60 = load ptr, ptr %59, align 8
  store ptr %60, ptr %15, align 8
  %61 = load ptr, ptr %9, align 8
  %62 = load ptr, ptr %15, align 8
  %63 = load i32, ptr %11, align 4
  %64 = ashr i32 %63, 1
  %65 = load ptr, ptr %12, align 8
  %66 = load i64, ptr %8, align 4
  %67 = load i64, ptr %52, align 4
  %68 = call ptr @loadtree(ptr noundef %61, i64 %66, i64 %67, ptr noundef %62, i32 noundef %64, ptr noundef %65)
  %69 = load ptr, ptr %10, align 8
  %70 = getelementptr inbounds %struct.cnode, ptr %69, i32 0, i32 5
  %71 = load i32, ptr %13, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [8 x ptr], ptr %70, i64 0, i64 %72
  store ptr %68, ptr %73, align 8
  br label %74

74:                                               ; preds = %49
  %75 = load ptr, ptr %10, align 8
  store ptr %75, ptr %7, align 8
  br label %76

76:                                               ; preds = %74, %20
  %77 = load ptr, ptr %7, align 8
  ret ptr %77
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @hackcofm(ptr noundef %0) #0 {
  %2 = alloca double, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca [3 x double], align 16
  %7 = alloca [3 x double], align 16
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %14 = load i16, ptr %0, align 8
  %15 = sext i16 %14 to i32
  %16 = icmp eq i32 %15, 2
  br i1 %16, label %17, label %116

17:                                               ; preds = %1
  store double 0.000000e+00, ptr %8, align 8
  store i32 0, ptr %10, align 4
  br label %18

18:                                               ; preds = %25, %17
  %19 = load i32, ptr %10, align 4
  %20 = icmp slt i32 %19, 3
  br i1 %20, label %21, label %28

21:                                               ; preds = %18
  %22 = load i32, ptr %10, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 %23
  store double 0.000000e+00, ptr %24, align 8
  br label %25

25:                                               ; preds = %21
  %26 = load i32, ptr %10, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %10, align 4
  br label %18

28:                                               ; preds = %18
  store i32 0, ptr %4, align 4
  br label %29

29:                                               ; preds = %78, %28
  %30 = load i32, ptr %4, align 4
  %31 = icmp slt i32 %30, 8
  br i1 %31, label %32, label %81

32:                                               ; preds = %29
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds %struct.cnode, ptr %33, i32 0, i32 5
  %35 = load i32, ptr %4, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [8 x ptr], ptr %34, i64 0, i64 %36
  %38 = load ptr, ptr %37, align 8
  store ptr %38, ptr %5, align 8
  %39 = icmp ne ptr %38, null
  br i1 %39, label %40, label %77

40:                                               ; preds = %32
  %41 = load ptr, ptr %5, align 8
  %42 = call double @hackcofm(ptr noundef %41)
  store double %42, ptr %9, align 8
  %43 = load double, ptr %8, align 8
  %44 = fadd double %42, %43
  store double %44, ptr %8, align 8
  store i32 0, ptr %11, align 4
  br label %45

45:                                               ; preds = %58, %40
  %46 = load i32, ptr %11, align 4
  %47 = icmp slt i32 %46, 3
  br i1 %47, label %48, label %61

48:                                               ; preds = %45
  %49 = load ptr, ptr %5, align 8
  %50 = getelementptr inbounds %struct.node, ptr %49, i32 0, i32 2
  %51 = load i32, ptr %11, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [3 x double], ptr %50, i64 0, i64 %52
  %54 = load double, ptr %53, align 8
  %55 = load double, ptr %9, align 8
  %56 = fmul double %54, %55
  %57 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %52
  store double %56, ptr %57, align 8
  br label %58

58:                                               ; preds = %48
  %59 = load i32, ptr %11, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %11, align 4
  br label %45

61:                                               ; preds = %45
  store i32 0, ptr %12, align 4
  br label %62

62:                                               ; preds = %73, %61
  %63 = load i32, ptr %12, align 4
  %64 = icmp slt i32 %63, 3
  br i1 %64, label %65, label %76

65:                                               ; preds = %62
  %66 = load i32, ptr %12, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 %67
  %69 = load double, ptr %68, align 8
  %70 = getelementptr inbounds [3 x double], ptr %6, i64 0, i64 %67
  %71 = load double, ptr %70, align 8
  %72 = fadd double %69, %71
  store double %72, ptr %68, align 8
  br label %73

73:                                               ; preds = %65
  %74 = load i32, ptr %12, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %12, align 4
  br label %62

76:                                               ; preds = %62
  br label %77

77:                                               ; preds = %76, %32
  br label %78

78:                                               ; preds = %77
  %79 = load i32, ptr %4, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %4, align 4
  br label %29

81:                                               ; preds = %29
  %82 = load double, ptr %8, align 8
  %83 = load ptr, ptr %3, align 8
  %84 = getelementptr inbounds %struct.node, ptr %83, i32 0, i32 1
  store double %82, ptr %84, align 8
  %85 = load double, ptr %7, align 16
  %86 = load ptr, ptr %3, align 8
  %87 = getelementptr inbounds %struct.node, ptr %86, i32 0, i32 2
  store double %85, ptr %87, align 8
  %88 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 1
  %89 = load double, ptr %88, align 8
  %90 = load ptr, ptr %3, align 8
  %91 = getelementptr inbounds %struct.node, ptr %90, i32 0, i32 2
  %92 = getelementptr inbounds [3 x double], ptr %91, i64 0, i64 1
  store double %89, ptr %92, align 8
  %93 = getelementptr inbounds [3 x double], ptr %7, i64 0, i64 2
  %94 = load double, ptr %93, align 16
  %95 = load ptr, ptr %3, align 8
  %96 = getelementptr inbounds %struct.node, ptr %95, i32 0, i32 2
  %97 = getelementptr inbounds [3 x double], ptr %96, i64 0, i64 2
  store double %94, ptr %97, align 8
  store i32 0, ptr %13, align 4
  br label %98

98:                                               ; preds = %111, %81
  %99 = load i32, ptr %13, align 4
  %100 = icmp slt i32 %99, 3
  br i1 %100, label %101, label %114

101:                                              ; preds = %98
  %102 = load ptr, ptr %3, align 8
  %103 = getelementptr inbounds %struct.node, ptr %102, i32 0, i32 2
  %104 = load i32, ptr %13, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [3 x double], ptr %103, i64 0, i64 %105
  %107 = load double, ptr %106, align 8
  %108 = getelementptr inbounds %struct.node, ptr %102, i32 0, i32 1
  %109 = load double, ptr %108, align 8
  %110 = fdiv double %107, %109
  store double %110, ptr %106, align 8
  br label %111

111:                                              ; preds = %101
  %112 = load i32, ptr %13, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, ptr %13, align 4
  br label %98

114:                                              ; preds = %98
  %115 = load double, ptr %8, align 8
  store double %115, ptr %2, align 8
  br label %120

116:                                              ; preds = %1
  %117 = load ptr, ptr %3, align 8
  %118 = getelementptr inbounds %struct.node, ptr %117, i32 0, i32 1
  %119 = load double, ptr %118, align 8
  store double %119, ptr %8, align 8
  store double %119, ptr %2, align 8
  br label %120

120:                                              ; preds = %116, %114
  %121 = load double, ptr %2, align 8
  ret double %121
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @cell_alloc(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %5 = load ptr, ptr @cp_free_list, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %12

7:                                                ; preds = %1
  %8 = load ptr, ptr @cp_free_list, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr @cp_free_list, align 8
  %10 = getelementptr inbounds %struct.cnode, ptr %9, i32 0, i32 6
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr @cp_free_list, align 8
  br label %14

12:                                               ; preds = %1
  %13 = call noalias ptr @malloc(i64 noundef 120) #9
  store ptr %13, ptr %3, align 8
  br label %14

14:                                               ; preds = %12, %7
  %15 = load ptr, ptr %3, align 8
  store i16 2, ptr %15, align 8
  %16 = load i32, ptr %2, align 4
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.cnode, ptr %17, i32 0, i32 3
  store i32 %16, ptr %18, align 8
  store i32 0, ptr %4, align 4
  br label %19

19:                                               ; preds = %28, %14
  %20 = load i32, ptr %4, align 4
  %21 = icmp slt i32 %20, 8
  br i1 %21, label %22, label %31

22:                                               ; preds = %19
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.cnode, ptr %23, i32 0, i32 5
  %25 = load i32, ptr %4, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [8 x ptr], ptr %24, i64 0, i64 %26
  store ptr null, ptr %27, align 8
  br label %28

28:                                               ; preds = %22
  %29 = load i32, ptr %4, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %4, align 4
  br label %19

31:                                               ; preds = %19
  %32 = load ptr, ptr %3, align 8
  ret ptr %32
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @subindex(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca [3 x i32], align 4
  %12 = alloca [3 x double], align 16
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.bnode, ptr %13, i32 0, i32 2
  %15 = load double, ptr %14, align 8
  store double %15, ptr %12, align 16
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.bnode, ptr %16, i32 0, i32 2
  %18 = getelementptr inbounds [3 x double], ptr %17, i64 0, i64 1
  %19 = load double, ptr %18, align 8
  %20 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 1
  store double %19, ptr %20, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds %struct.bnode, ptr %21, i32 0, i32 2
  %23 = getelementptr inbounds [3 x double], ptr %22, i64 0, i64 2
  %24 = load double, ptr %23, align 8
  %25 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 2
  store double %24, ptr %25, align 16
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds %struct.tree, ptr %26, i32 0, i32 1
  %28 = load double, ptr %27, align 8
  store double %28, ptr %9, align 8
  %29 = load double, ptr %12, align 16
  %30 = load ptr, ptr %5, align 8
  %31 = load double, ptr %30, align 8
  %32 = fsub double %29, %31
  %33 = load double, ptr %9, align 8
  %34 = fdiv double %32, %33
  store double %34, ptr %10, align 8
  %35 = fcmp ole double 0.000000e+00, %34
  br i1 %35, label %36, label %39

36:                                               ; preds = %3
  %37 = load double, ptr %10, align 8
  %38 = fcmp olt double %37, 1.000000e+00
  br i1 %38, label %42, label %39

39:                                               ; preds = %36, %3
  %40 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 5)
  %41 = call i32 @exit(i32 noundef 0) #10
  unreachable

42:                                               ; preds = %36
  %43 = load double, ptr %10, align 8
  %44 = fmul double 0x41D0000000000000, %43
  %45 = call double @llvm.floor.f64(double %44)
  %46 = fptosi double %45 to i32
  store i32 %46, ptr %11, align 4
  %47 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 1
  %48 = load double, ptr %47, align 8
  %49 = load ptr, ptr %5, align 8
  %50 = getelementptr inbounds [3 x double], ptr %49, i64 0, i64 1
  %51 = load double, ptr %50, align 8
  %52 = fsub double %48, %51
  %53 = load double, ptr %9, align 8
  %54 = fdiv double %52, %53
  store double %54, ptr %10, align 8
  %55 = fcmp ole double 0.000000e+00, %54
  br i1 %55, label %56, label %59

56:                                               ; preds = %42
  %57 = load double, ptr %10, align 8
  %58 = fcmp olt double %57, 1.000000e+00
  br i1 %58, label %62, label %59

59:                                               ; preds = %56, %42
  %60 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 6)
  %61 = call i32 @exit(i32 noundef 0) #10
  unreachable

62:                                               ; preds = %56
  %63 = load double, ptr %10, align 8
  %64 = fmul double 0x41D0000000000000, %63
  %65 = call double @llvm.floor.f64(double %64)
  %66 = fptosi double %65 to i32
  %67 = getelementptr inbounds [3 x i32], ptr %11, i64 0, i64 1
  store i32 %66, ptr %67, align 4
  %68 = getelementptr inbounds [3 x double], ptr %12, i64 0, i64 2
  %69 = load double, ptr %68, align 16
  %70 = load ptr, ptr %5, align 8
  %71 = getelementptr inbounds [3 x double], ptr %70, i64 0, i64 2
  %72 = load double, ptr %71, align 8
  %73 = fsub double %69, %72
  %74 = load double, ptr %9, align 8
  %75 = fdiv double %73, %74
  store double %75, ptr %10, align 8
  %76 = fcmp ole double 0.000000e+00, %75
  br i1 %76, label %77, label %80

77:                                               ; preds = %62
  %78 = load double, ptr %10, align 8
  %79 = fcmp olt double %78, 1.000000e+00
  br i1 %79, label %83, label %80

80:                                               ; preds = %77, %62
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 7)
  %82 = call i32 @exit(i32 noundef 0) #10
  unreachable

83:                                               ; preds = %77
  %84 = load double, ptr %10, align 8
  %85 = fmul double 0x41D0000000000000, %84
  %86 = call double @llvm.floor.f64(double %85)
  %87 = fptosi double %86 to i32
  %88 = getelementptr inbounds [3 x i32], ptr %11, i64 0, i64 2
  store i32 %87, ptr %88, align 4
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %89

89:                                               ; preds = %107, %83
  %90 = load i32, ptr %8, align 4
  %91 = icmp slt i32 %90, 3
  br i1 %91, label %92, label %110

92:                                               ; preds = %89
  %93 = load i32, ptr %8, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [3 x i32], ptr %11, i64 0, i64 %94
  %96 = load i32, ptr %95, align 4
  %97 = load i32, ptr %6, align 4
  %98 = and i32 %96, %97
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %106

100:                                              ; preds = %92
  %101 = load i32, ptr %8, align 4
  %102 = add nsw i32 %101, 1
  %103 = ashr i32 8, %102
  %104 = load i32, ptr %7, align 4
  %105 = add nsw i32 %104, %103
  store i32 %105, ptr %7, align 4
  br label %106

106:                                              ; preds = %100, %92
  br label %107

107:                                              ; preds = %106
  %108 = load i32, ptr %8, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, ptr %8, align 4
  br label %89

110:                                              ; preds = %89
  %111 = load i32, ptr %7, align 4
  ret i32 %111
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.floor.f64(double) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ic_test(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  %8 = alloca [3 x double], align 16
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 1, ptr %7, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.bnode, ptr %9, i32 0, i32 2
  %11 = load double, ptr %10, align 8
  store double %11, ptr %8, align 16
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.bnode, ptr %12, i32 0, i32 2
  %14 = getelementptr inbounds [3 x double], ptr %13, i64 0, i64 1
  %15 = load double, ptr %14, align 8
  %16 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 1
  store double %15, ptr %16, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.bnode, ptr %17, i32 0, i32 2
  %19 = getelementptr inbounds [3 x double], ptr %18, i64 0, i64 2
  %20 = load double, ptr %19, align 8
  %21 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 2
  store double %20, ptr %21, align 16
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.tree, ptr %22, i32 0, i32 1
  %24 = load double, ptr %23, align 8
  store double %24, ptr %6, align 8
  %25 = load double, ptr %8, align 16
  %26 = load ptr, ptr %4, align 8
  %27 = load double, ptr %26, align 8
  %28 = fsub double %25, %27
  %29 = load double, ptr %6, align 8
  %30 = fdiv double %28, %29
  store double %30, ptr %5, align 8
  %31 = fcmp ole double 0.000000e+00, %30
  br i1 %31, label %32, label %35

32:                                               ; preds = %2
  %33 = load double, ptr %5, align 8
  %34 = fcmp olt double %33, 1.000000e+00
  br i1 %34, label %36, label %35

35:                                               ; preds = %32, %2
  store i32 0, ptr %7, align 4
  br label %36

36:                                               ; preds = %35, %32
  %37 = load double, ptr %16, align 8
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds [3 x double], ptr %38, i64 0, i64 1
  %40 = load double, ptr %39, align 8
  %41 = fsub double %37, %40
  %42 = load double, ptr %6, align 8
  %43 = fdiv double %41, %42
  store double %43, ptr %5, align 8
  %44 = fcmp ole double 0.000000e+00, %43
  br i1 %44, label %45, label %48

45:                                               ; preds = %36
  %46 = load double, ptr %5, align 8
  %47 = fcmp olt double %46, 1.000000e+00
  br i1 %47, label %49, label %48

48:                                               ; preds = %45, %36
  store i32 0, ptr %7, align 4
  br label %49

49:                                               ; preds = %48, %45
  %50 = getelementptr inbounds [3 x double], ptr %8, i64 0, i64 2
  %51 = load double, ptr %50, align 16
  %52 = load ptr, ptr %4, align 8
  %53 = getelementptr inbounds [3 x double], ptr %52, i64 0, i64 2
  %54 = load double, ptr %53, align 8
  %55 = fsub double %51, %54
  %56 = load double, ptr %6, align 8
  %57 = fdiv double %55, %56
  store double %57, ptr %5, align 8
  %58 = fcmp ole double 0.000000e+00, %57
  br i1 %58, label %59, label %62

59:                                               ; preds = %49
  %60 = load double, ptr %5, align 8
  %61 = fcmp olt double %60, 1.000000e+00
  br i1 %61, label %63, label %62

62:                                               ; preds = %59, %49
  store i32 0, ptr %7, align 4
  br label %63

63:                                               ; preds = %62, %59
  %64 = load i32, ptr %7, align 4
  ret i32 %64
}

; Function Attrs: noinline nounwind uwtable
define dso_local { i64, i64 } @intcoord1(double noundef %0, double noundef %1, double noundef %2, ptr noundef %3) #0 {
  %5 = alloca %struct.icstruct, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca ptr, align 8
  %10 = alloca double, align 8
  store double %0, ptr %6, align 8
  store double %1, ptr %7, align 8
  store double %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %11 = getelementptr inbounds %struct.icstruct, ptr %5, i32 0, i32 1
  store i16 1, ptr %11, align 4
  %12 = load double, ptr %6, align 8
  %13 = load ptr, ptr %9, align 8
  %14 = load double, ptr %13, align 8
  %15 = fsub double %12, %14
  %16 = getelementptr inbounds %struct.tree, ptr %13, i32 0, i32 1
  %17 = load double, ptr %16, align 8
  %18 = fdiv double %15, %17
  store double %18, ptr %10, align 8
  %19 = fcmp ole double 0.000000e+00, %18
  br i1 %19, label %20, label %28

20:                                               ; preds = %4
  %21 = load double, ptr %10, align 8
  %22 = fcmp olt double %21, 1.000000e+00
  br i1 %22, label %23, label %28

23:                                               ; preds = %20
  %24 = load double, ptr %10, align 8
  %25 = fmul double 0x41D0000000000000, %24
  %26 = call double @llvm.floor.f64(double %25)
  %27 = fptosi double %26 to i32
  store i32 %27, ptr %5, align 4
  br label %29

28:                                               ; preds = %20, %4
  store i16 0, ptr %11, align 4
  br label %29

29:                                               ; preds = %28, %23
  %30 = load double, ptr %7, align 8
  %31 = load ptr, ptr %9, align 8
  %32 = getelementptr inbounds [3 x double], ptr %31, i64 0, i64 1
  %33 = load double, ptr %32, align 8
  %34 = fsub double %30, %33
  %35 = getelementptr inbounds %struct.tree, ptr %31, i32 0, i32 1
  %36 = load double, ptr %35, align 8
  %37 = fdiv double %34, %36
  store double %37, ptr %10, align 8
  %38 = fcmp ole double 0.000000e+00, %37
  br i1 %38, label %39, label %48

39:                                               ; preds = %29
  %40 = load double, ptr %10, align 8
  %41 = fcmp olt double %40, 1.000000e+00
  br i1 %41, label %42, label %48

42:                                               ; preds = %39
  %43 = load double, ptr %10, align 8
  %44 = fmul double 0x41D0000000000000, %43
  %45 = call double @llvm.floor.f64(double %44)
  %46 = fptosi double %45 to i32
  %47 = getelementptr inbounds [3 x i32], ptr %5, i64 0, i64 1
  store i32 %46, ptr %47, align 4
  br label %50

48:                                               ; preds = %39, %29
  %49 = getelementptr inbounds %struct.icstruct, ptr %5, i32 0, i32 1
  store i16 0, ptr %49, align 4
  br label %50

50:                                               ; preds = %48, %42
  %51 = load double, ptr %8, align 8
  %52 = load ptr, ptr %9, align 8
  %53 = getelementptr inbounds [3 x double], ptr %52, i64 0, i64 2
  %54 = load double, ptr %53, align 8
  %55 = fsub double %51, %54
  %56 = getelementptr inbounds %struct.tree, ptr %52, i32 0, i32 1
  %57 = load double, ptr %56, align 8
  %58 = fdiv double %55, %57
  store double %58, ptr %10, align 8
  %59 = fcmp ole double 0.000000e+00, %58
  br i1 %59, label %60, label %69

60:                                               ; preds = %50
  %61 = load double, ptr %10, align 8
  %62 = fcmp olt double %61, 1.000000e+00
  br i1 %62, label %63, label %69

63:                                               ; preds = %60
  %64 = load double, ptr %10, align 8
  %65 = fmul double 0x41D0000000000000, %64
  %66 = call double @llvm.floor.f64(double %65)
  %67 = fptosi double %66 to i32
  %68 = getelementptr inbounds [3 x i32], ptr %5, i64 0, i64 2
  store i32 %67, ptr %68, align 4
  br label %71

69:                                               ; preds = %60, %50
  %70 = getelementptr inbounds %struct.icstruct, ptr %5, i32 0, i32 1
  store i16 0, ptr %70, align 4
  br label %71

71:                                               ; preds = %69, %63
  %72 = load { i64, i64 }, ptr %5, align 4
  ret { i64, i64 } %72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @freetree(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %6 = icmp eq ptr %0, null
  br i1 %6, label %12, label %7

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = load i16, ptr %8, align 8
  %10 = sext i16 %9 to i32
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %13

12:                                               ; preds = %7, %1
  store i32 0, ptr %2, align 4
  br label %35

13:                                               ; preds = %7
  store i32 7, ptr %5, align 4
  br label %14

14:                                               ; preds = %29, %13
  %15 = load i32, ptr %5, align 4
  %16 = icmp sge i32 %15, 0
  br i1 %16, label %17, label %32

17:                                               ; preds = %14
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.cnode, ptr %18, i32 0, i32 5
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [8 x ptr], ptr %19, i64 0, i64 %21
  %23 = load ptr, ptr %22, align 8
  store ptr %23, ptr %4, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %28

25:                                               ; preds = %17
  %26 = load ptr, ptr %4, align 8
  %27 = call i32 @freetree(ptr noundef %26)
  br label %28

28:                                               ; preds = %25, %17
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %5, align 4
  %31 = add nsw i32 %30, -1
  store i32 %31, ptr %5, align 4
  br label %14

32:                                               ; preds = %14
  %33 = load ptr, ptr %3, align 8
  %34 = call i32 @my_free(ptr noundef %33)
  store i32 0, ptr %2, align 4
  br label %35

35:                                               ; preds = %32, %12
  %36 = load i32, ptr %2, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @my_free(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load i16, ptr %0, align 8
  %4 = sext i16 %3 to i32
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %6, label %11

6:                                                ; preds = %1
  %7 = load ptr, ptr @bp_free_list, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.bnode, ptr %8, i32 0, i32 9
  store ptr %7, ptr %9, align 8
  %10 = load ptr, ptr %2, align 8
  store ptr %10, ptr @bp_free_list, align 8
  br label %16

11:                                               ; preds = %1
  %12 = load ptr, ptr @cp_free_list, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.cnode, ptr %13, i32 0, i32 6
  store ptr %12, ptr %14, align 8
  %15 = load ptr, ptr %2, align 8
  store ptr %15, ptr @cp_free_list, align 8
  br label %16

16:                                               ; preds = %11, %6
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @ubody_alloc(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 144) #9
  store ptr %4, ptr %3, align 8
  store i16 1, ptr %4, align 8
  %5 = load i32, ptr %2, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.bnode, ptr %6, i32 0, i32 3
  store i32 %5, ptr %7, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.bnode, ptr %8, i32 0, i32 10
  store ptr null, ptr %9, align 8
  %10 = load i32, ptr %2, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds %struct.bnode, ptr %11, i32 0, i32 4
  store i32 %10, ptr %12, align 4
  %13 = load ptr, ptr %3, align 8
  ret ptr %13
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @testdata() #0 {
  %1 = alloca double, align 8
  store double 1.230000e+02, ptr %1, align 8
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef 99)
  %3 = call i32 @exit(i32 noundef 0) #10
  unreachable
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @body_alloc(i32 noundef %0, double noundef %1, double noundef %2, double noundef %3, double noundef %4, double noundef %5, double noundef %6, double noundef %7, double noundef %8, double noundef %9, double noundef %10, ptr noundef %11) #0 {
  %13 = alloca i32, align 4
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  %21 = alloca double, align 8
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  store i32 %0, ptr %13, align 4
  store double %1, ptr %14, align 8
  store double %2, ptr %15, align 8
  store double %3, ptr %16, align 8
  store double %4, ptr %17, align 8
  store double %5, ptr %18, align 8
  store double %6, ptr %19, align 8
  store double %7, ptr %20, align 8
  store double %8, ptr %21, align 8
  store double %9, ptr %22, align 8
  store double %10, ptr %23, align 8
  store ptr %11, ptr %24, align 8
  %26 = load ptr, ptr @bp_free_list, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %33

28:                                               ; preds = %12
  %29 = load ptr, ptr @bp_free_list, align 8
  store ptr %29, ptr %25, align 8
  %30 = load ptr, ptr @bp_free_list, align 8
  %31 = getelementptr inbounds %struct.bnode, ptr %30, i32 0, i32 9
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr @bp_free_list, align 8
  br label %35

33:                                               ; preds = %12
  %34 = call noalias ptr @malloc(i64 noundef 144) #9
  store ptr %34, ptr %25, align 8
  br label %35

35:                                               ; preds = %33, %28
  %36 = load ptr, ptr %25, align 8
  store i16 1, ptr %36, align 8
  %37 = load i32, ptr %13, align 4
  %38 = load ptr, ptr %25, align 8
  %39 = getelementptr inbounds %struct.bnode, ptr %38, i32 0, i32 3
  store i32 %37, ptr %39, align 8
  %40 = load double, ptr %14, align 8
  %41 = load ptr, ptr %25, align 8
  %42 = getelementptr inbounds %struct.bnode, ptr %41, i32 0, i32 2
  store double %40, ptr %42, align 8
  %43 = load double, ptr %15, align 8
  %44 = load ptr, ptr %25, align 8
  %45 = getelementptr inbounds %struct.bnode, ptr %44, i32 0, i32 2
  %46 = getelementptr inbounds [3 x double], ptr %45, i64 0, i64 1
  store double %43, ptr %46, align 8
  %47 = load double, ptr %16, align 8
  %48 = load ptr, ptr %25, align 8
  %49 = getelementptr inbounds %struct.bnode, ptr %48, i32 0, i32 2
  %50 = getelementptr inbounds [3 x double], ptr %49, i64 0, i64 2
  store double %47, ptr %50, align 8
  %51 = load double, ptr %17, align 8
  %52 = load ptr, ptr %25, align 8
  %53 = getelementptr inbounds %struct.bnode, ptr %52, i32 0, i32 5
  store double %51, ptr %53, align 8
  %54 = load double, ptr %18, align 8
  %55 = load ptr, ptr %25, align 8
  %56 = getelementptr inbounds %struct.bnode, ptr %55, i32 0, i32 5
  %57 = getelementptr inbounds [3 x double], ptr %56, i64 0, i64 1
  store double %54, ptr %57, align 8
  %58 = load double, ptr %19, align 8
  %59 = load ptr, ptr %25, align 8
  %60 = getelementptr inbounds %struct.bnode, ptr %59, i32 0, i32 5
  %61 = getelementptr inbounds [3 x double], ptr %60, i64 0, i64 2
  store double %58, ptr %61, align 8
  %62 = load double, ptr %20, align 8
  %63 = load ptr, ptr %25, align 8
  %64 = getelementptr inbounds %struct.bnode, ptr %63, i32 0, i32 6
  store double %62, ptr %64, align 8
  %65 = load double, ptr %21, align 8
  %66 = load ptr, ptr %25, align 8
  %67 = getelementptr inbounds %struct.bnode, ptr %66, i32 0, i32 6
  %68 = getelementptr inbounds [3 x double], ptr %67, i64 0, i64 1
  store double %65, ptr %68, align 8
  %69 = load double, ptr %22, align 8
  %70 = load ptr, ptr %25, align 8
  %71 = getelementptr inbounds %struct.bnode, ptr %70, i32 0, i32 6
  %72 = getelementptr inbounds [3 x double], ptr %71, i64 0, i64 2
  store double %69, ptr %72, align 8
  %73 = load double, ptr %23, align 8
  %74 = load ptr, ptr %25, align 8
  %75 = getelementptr inbounds %struct.bnode, ptr %74, i32 0, i32 1
  store double %73, ptr %75, align 8
  %76 = load ptr, ptr %25, align 8
  ret ptr %76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dis_number(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load i32, ptr @nbody, align 4
  %5 = sitofp i32 %4 to double
  %6 = load i32, ptr @__NumNodes, align 4
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %5, %7
  %9 = call double @llvm.ceil.f64(double %8)
  %10 = fptosi double %9 to i32
  store i32 %10, ptr %3, align 4
  %11 = load ptr, ptr %2, align 8
  %12 = load i32, ptr %3, align 4
  %13 = call i32 @dis2_number(ptr noundef %11, i32 noundef -1, i32 noundef %12)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.ceil.f64(double) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dis2_number(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %10 = load ptr, ptr %5, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %14

12:                                               ; preds = %3
  %13 = load i32, ptr %6, align 4
  store i32 %13, ptr %4, align 4
  br label %47

14:                                               ; preds = %3
  %15 = load ptr, ptr %5, align 8
  %16 = load i16, ptr %15, align 8
  %17 = sext i16 %16 to i32
  %18 = icmp eq i32 %17, 1
  br i1 %18, label %19, label %28

19:                                               ; preds = %14
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %20, 1
  %22 = load i32, ptr %7, align 4
  %23 = sdiv i32 %21, %22
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds %struct.node, ptr %24, i32 0, i32 4
  store i32 %23, ptr %25, align 4
  %26 = load i32, ptr %6, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, ptr %4, align 4
  br label %47

28:                                               ; preds = %14
  store i32 0, ptr %8, align 4
  br label %29

29:                                               ; preds = %42, %28
  %30 = load i32, ptr %8, align 4
  %31 = icmp slt i32 %30, 8
  br i1 %31, label %32, label %45

32:                                               ; preds = %29
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds %struct.cnode, ptr %33, i32 0, i32 5
  %35 = load i32, ptr %8, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [8 x ptr], ptr %34, i64 0, i64 %36
  %38 = load ptr, ptr %37, align 8
  store ptr %38, ptr %9, align 8
  %39 = load i32, ptr %6, align 4
  %40 = load i32, ptr %7, align 4
  %41 = call i32 @dis2_number(ptr noundef %38, i32 noundef %39, i32 noundef %40)
  store i32 %41, ptr %6, align 4
  br label %42

42:                                               ; preds = %32
  %43 = load i32, ptr %8, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %8, align 4
  br label %29

45:                                               ; preds = %29
  %46 = load i32, ptr %6, align 4
  store i32 %46, ptr %4, align 4
  br label %47

47:                                               ; preds = %45, %19, %12
  %48 = load i32, ptr %4, align 4
  ret i32 %48
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @my_rand(double noundef %0) #0 {
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  store double %0, ptr %2, align 8
  %4 = call double @llvm.fmuladd.f64(double 1.680700e+04, double %0, double 1.000000e+00)
  store double %4, ptr %3, align 8
  %5 = load double, ptr %3, align 8
  %6 = fdiv double %5, 0x41DFFFFFFFC00000
  %7 = call double @llvm.floor.f64(double %6)
  %8 = call double @llvm.fmuladd.f64(double 0xC1DFFFFFFFC00000, double %7, double %4)
  store double %8, ptr %2, align 8
  ret double %8
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @xrand(double noundef %0, double noundef %1, double noundef %2) #0 {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  store double %0, ptr %4, align 8
  store double %1, ptr %5, align 8
  store double %2, ptr %6, align 8
  %8 = load double, ptr %4, align 8
  %9 = load double, ptr %5, align 8
  %10 = fsub double %9, %8
  %11 = load double, ptr %6, align 8
  %12 = fmul double %10, %11
  %13 = fdiv double %12, 0x41DFFFFFFFC00000
  %14 = fadd double %8, %13
  store double %14, ptr %7, align 8
  ret double %14
}

; Function Attrs: noinline nounwind uwtable
define dso_local double @cputime() #0 {
  %1 = alloca %struct.tms, align 8
  %2 = call i64 @times(ptr noundef %1) #9
  %3 = icmp eq i64 %2, -1
  br i1 %3, label %4, label %6

4:                                                ; preds = %0
  %5 = call i32 @error(ptr noundef @.str.5, ptr noundef null, ptr noundef null, ptr noundef null, ptr noundef null)
  br label %6

6:                                                ; preds = %4, %0
  %7 = load i64, ptr %1, align 8
  %8 = sitofp i64 %7 to double
  %9 = fdiv double %8, 3.600000e+03
  ret double %9
}

; Function Attrs: nounwind
declare i64 @times(ptr noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @error(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %11 = load ptr, ptr @stderr, align 8
  %12 = load ptr, ptr %6, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = load ptr, ptr %8, align 8
  %15 = load ptr, ptr %9, align 8
  %16 = load ptr, ptr %10, align 8
  %17 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef %12, ptr noundef %13, ptr noundef %14, ptr noundef %15, ptr noundef %16)
  %18 = call ptr @__errno_location() #11
  %19 = load i32, ptr %18, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %5
  call void @perror(ptr noundef @.str.1.8) #12
  br label %22

22:                                               ; preds = %21, %5
  call void @exit(i32 noundef 0) #10
  unreachable
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__errno_location() #6

; Function Attrs: cold
declare void @perror(ptr noundef) #7

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @dealwithargs(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %6 = load i32, ptr %3, align 4
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %8, label %13

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds ptr, ptr %9, i64 1
  %11 = load ptr, ptr %10, align 8
  %12 = call i32 @atoi(ptr noundef %11) #13
  store i32 %12, ptr @nbody, align 4
  br label %14

13:                                               ; preds = %2
  store i32 2048, ptr @nbody, align 4
  br label %14

14:                                               ; preds = %13, %8
  %15 = load i32, ptr %5, align 4
  ret i32 %15
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #8

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind willreturn memory(none) }
attributes #12 = { cold }
attributes #13 = { nounwind willreturn memory(read) }

!llvm.ident = !{!0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
