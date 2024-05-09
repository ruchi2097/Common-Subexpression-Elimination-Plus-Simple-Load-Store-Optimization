; ModuleID = 'patricia-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ptree = type { i64, ptr, i8, i8, ptr, ptr }
%struct.ptree_mask = type { i64, ptr }
%struct.in_addr = type { i32 }

@.str = private unnamed_addr constant [24 x i8] c"Usage: %s <TCP stream>\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"File %s doesn't seem to exist\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"Allocating p-trie node\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"Allocating p-trie mask data\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"Allocating p-trie mask's node data\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%f %d\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"%f %08x: \00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"Found.\0A\00", align 1
@stderr = external global ptr, align 8
@.str.9 = private unnamed_addr constant [22 x i8] c"Failed on pat_insert\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @pat_insert(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %11 = icmp ne ptr %1, null
  br i1 %11, label %12, label %20

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %20

15:                                               ; preds = %12
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.ptree, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %21, label %20

20:                                               ; preds = %15, %12, %2
  store ptr null, ptr %3, align 8
  br label %236

21:                                               ; preds = %15
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.ptree, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = load i64, ptr %24, align 8
  %26 = load i64, ptr %22, align 8
  %27 = and i64 %26, %25
  store i64 %27, ptr %22, align 8
  %28 = load ptr, ptr %5, align 8
  store ptr %28, ptr %6, align 8
  br label %29

29:                                               ; preds = %52, %21
  %30 = load ptr, ptr %6, align 8
  %31 = getelementptr inbounds %struct.ptree, ptr %30, i32 0, i32 3
  %32 = load i8, ptr %31, align 1
  %33 = sext i8 %32 to i32
  store i32 %33, ptr %9, align 4
  %34 = load ptr, ptr %6, align 8
  %35 = getelementptr inbounds %struct.ptree, ptr %34, i32 0, i32 3
  %36 = load i8, ptr %35, align 1
  %37 = sext i8 %36 to i32
  %38 = load ptr, ptr %4, align 8
  %39 = load i64, ptr %38, align 8
  %40 = call i64 @bit(i32 noundef %37, i64 noundef %39)
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %46

42:                                               ; preds = %29
  %43 = load ptr, ptr %6, align 8
  %44 = getelementptr inbounds %struct.ptree, ptr %43, i32 0, i32 5
  %45 = load ptr, ptr %44, align 8
  br label %50

46:                                               ; preds = %29
  %47 = load ptr, ptr %6, align 8
  %48 = getelementptr inbounds %struct.ptree, ptr %47, i32 0, i32 4
  %49 = load ptr, ptr %48, align 8
  br label %50

50:                                               ; preds = %46, %42
  %51 = phi ptr [ %45, %42 ], [ %49, %46 ]
  store ptr %51, ptr %6, align 8
  br label %52

52:                                               ; preds = %50
  %53 = load i32, ptr %9, align 4
  %54 = load ptr, ptr %6, align 8
  %55 = getelementptr inbounds %struct.ptree, ptr %54, i32 0, i32 3
  %56 = load i8, ptr %55, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp slt i32 %53, %57
  br i1 %58, label %29, label %59

59:                                               ; preds = %52
  %60 = load ptr, ptr %4, align 8
  %61 = load i64, ptr %60, align 8
  %62 = load ptr, ptr %6, align 8
  %63 = load i64, ptr %62, align 8
  %64 = icmp eq i64 %61, %63
  br i1 %64, label %65, label %187

65:                                               ; preds = %59
  store i32 0, ptr %9, align 4
  br label %66

66:                                               ; preds = %105, %65
  %67 = load i32, ptr %9, align 4
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds %struct.ptree, ptr %68, i32 0, i32 2
  %70 = load i8, ptr %69, align 8
  %71 = zext i8 %70 to i32
  %72 = icmp slt i32 %67, %71
  br i1 %72, label %73, label %108

73:                                               ; preds = %66
  %74 = load ptr, ptr %4, align 8
  %75 = getelementptr inbounds %struct.ptree, ptr %74, i32 0, i32 1
  %76 = load ptr, ptr %75, align 8
  %77 = load i64, ptr %76, align 8
  %78 = load ptr, ptr %6, align 8
  %79 = getelementptr inbounds %struct.ptree, ptr %78, i32 0, i32 1
  %80 = load ptr, ptr %79, align 8
  %81 = load i32, ptr %9, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds %struct.ptree_mask, ptr %80, i64 %82
  %84 = load i64, ptr %83, align 8
  %85 = icmp eq i64 %77, %84
  br i1 %85, label %86, label %104

86:                                               ; preds = %73
  %87 = load ptr, ptr %4, align 8
  %88 = getelementptr inbounds %struct.ptree, ptr %87, i32 0, i32 1
  %89 = load ptr, ptr %88, align 8
  %90 = getelementptr inbounds %struct.ptree_mask, ptr %89, i32 0, i32 1
  %91 = load ptr, ptr %90, align 8
  %92 = load ptr, ptr %6, align 8
  %93 = getelementptr inbounds %struct.ptree, ptr %92, i32 0, i32 1
  %94 = load ptr, ptr %93, align 8
  %95 = load i32, ptr %9, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds %struct.ptree_mask, ptr %94, i64 %96
  %98 = getelementptr inbounds %struct.ptree_mask, ptr %97, i32 0, i32 1
  store ptr %91, ptr %98, align 8
  %99 = load ptr, ptr %4, align 8
  %100 = getelementptr inbounds %struct.ptree, ptr %99, i32 0, i32 1
  %101 = load ptr, ptr %100, align 8
  call void @free(ptr noundef %101) #7
  %102 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %102) #7
  store ptr null, ptr %4, align 8
  %103 = load ptr, ptr %6, align 8
  store ptr %103, ptr %3, align 8
  br label %236

104:                                              ; preds = %73
  br label %105

105:                                              ; preds = %104
  %106 = load i32, ptr %9, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, ptr %9, align 4
  br label %66

108:                                              ; preds = %66
  %109 = load ptr, ptr %6, align 8
  %110 = getelementptr inbounds %struct.ptree, ptr %109, i32 0, i32 2
  %111 = load i8, ptr %110, align 8
  %112 = zext i8 %111 to i32
  %113 = add nsw i32 %112, 1
  %114 = sext i32 %113 to i64
  %115 = mul i64 16, %114
  %116 = call noalias ptr @malloc(i64 noundef %115) #8
  store ptr %116, ptr %7, align 8
  store i32 0, ptr %10, align 4
  store i32 0, ptr %9, align 4
  %117 = load ptr, ptr %7, align 8
  store ptr %117, ptr %8, align 8
  br label %118

118:                                              ; preds = %159, %108
  %119 = load i32, ptr %9, align 4
  %120 = load ptr, ptr %6, align 8
  %121 = getelementptr inbounds %struct.ptree, ptr %120, i32 0, i32 2
  %122 = load i8, ptr %121, align 8
  %123 = zext i8 %122 to i32
  %124 = icmp slt i32 %119, %123
  br i1 %124, label %125, label %162

125:                                              ; preds = %118
  %126 = load ptr, ptr %4, align 8
  %127 = getelementptr inbounds %struct.ptree, ptr %126, i32 0, i32 1
  %128 = load ptr, ptr %127, align 8
  %129 = load i64, ptr %128, align 8
  %130 = load ptr, ptr %6, align 8
  %131 = getelementptr inbounds %struct.ptree, ptr %130, i32 0, i32 1
  %132 = load ptr, ptr %131, align 8
  %133 = load i32, ptr %9, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds %struct.ptree_mask, ptr %132, i64 %134
  %136 = load i64, ptr %135, align 8
  %137 = icmp ugt i64 %129, %136
  br i1 %137, label %138, label %149

138:                                              ; preds = %125
  %139 = load ptr, ptr %6, align 8
  %140 = getelementptr inbounds %struct.ptree, ptr %139, i32 0, i32 1
  %141 = load ptr, ptr %140, align 8
  %142 = load i32, ptr %9, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds %struct.ptree_mask, ptr %141, i64 %143
  %145 = load ptr, ptr %8, align 8
  %146 = call i32 (ptr, ptr, i64, ...) @bcopy(ptr noundef %144, ptr noundef %145, i64 noundef 16)
  %147 = load i32, ptr %9, align 4
  %148 = add nsw i32 %147, 1
  store i32 %148, ptr %9, align 4
  br label %158

149:                                              ; preds = %125
  %150 = load ptr, ptr %4, align 8
  %151 = getelementptr inbounds %struct.ptree, ptr %150, i32 0, i32 1
  %152 = load ptr, ptr %151, align 8
  %153 = load ptr, ptr %8, align 8
  %154 = call i32 (ptr, ptr, i64, ...) @bcopy(ptr noundef %152, ptr noundef %153, i64 noundef 16)
  %155 = load ptr, ptr %4, align 8
  %156 = getelementptr inbounds %struct.ptree, ptr %155, i32 0, i32 1
  %157 = load ptr, ptr %156, align 8
  store i64 4294967295, ptr %157, align 8
  store i32 1, ptr %10, align 4
  br label %158

158:                                              ; preds = %149, %138
  br label %159

159:                                              ; preds = %158
  %160 = load ptr, ptr %8, align 8
  %161 = getelementptr inbounds %struct.ptree_mask, ptr %160, i32 1
  store ptr %161, ptr %8, align 8
  br label %118

162:                                              ; preds = %118
  %163 = load i32, ptr %10, align 4
  %164 = icmp ne i32 %163, 0
  br i1 %164, label %171, label %165

165:                                              ; preds = %162
  %166 = load ptr, ptr %4, align 8
  %167 = getelementptr inbounds %struct.ptree, ptr %166, i32 0, i32 1
  %168 = load ptr, ptr %167, align 8
  %169 = load ptr, ptr %8, align 8
  %170 = call i32 (ptr, ptr, i64, ...) @bcopy(ptr noundef %168, ptr noundef %169, i64 noundef 16)
  br label %171

171:                                              ; preds = %165, %162
  %172 = load ptr, ptr %4, align 8
  %173 = getelementptr inbounds %struct.ptree, ptr %172, i32 0, i32 1
  %174 = load ptr, ptr %173, align 8
  call void @free(ptr noundef %174) #7
  %175 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %175) #7
  store ptr null, ptr %4, align 8
  %176 = load ptr, ptr %6, align 8
  %177 = getelementptr inbounds %struct.ptree, ptr %176, i32 0, i32 2
  %178 = load i8, ptr %177, align 8
  %179 = add i8 %178, 1
  store i8 %179, ptr %177, align 8
  %180 = load ptr, ptr %6, align 8
  %181 = getelementptr inbounds %struct.ptree, ptr %180, i32 0, i32 1
  %182 = load ptr, ptr %181, align 8
  call void @free(ptr noundef %182) #7
  %183 = load ptr, ptr %7, align 8
  %184 = load ptr, ptr %6, align 8
  %185 = getelementptr inbounds %struct.ptree, ptr %184, i32 0, i32 1
  store ptr %183, ptr %185, align 8
  %186 = load ptr, ptr %6, align 8
  store ptr %186, ptr %3, align 8
  br label %236

187:                                              ; preds = %59
  store i32 1, ptr %9, align 4
  br label %188

188:                                              ; preds = %204, %187
  %189 = load i32, ptr %9, align 4
  %190 = icmp slt i32 %189, 32
  br i1 %190, label %191, label %201

191:                                              ; preds = %188
  %192 = load i32, ptr %9, align 4
  %193 = load ptr, ptr %4, align 8
  %194 = load i64, ptr %193, align 8
  %195 = call i64 @bit(i32 noundef %192, i64 noundef %194)
  %196 = load i32, ptr %9, align 4
  %197 = load ptr, ptr %6, align 8
  %198 = load i64, ptr %197, align 8
  %199 = call i64 @bit(i32 noundef %196, i64 noundef %198)
  %200 = icmp eq i64 %195, %199
  br label %201

201:                                              ; preds = %191, %188
  %202 = phi i1 [ false, %188 ], [ %200, %191 ]
  br i1 %202, label %203, label %207

203:                                              ; preds = %201
  br label %204

204:                                              ; preds = %203
  %205 = load i32, ptr %9, align 4
  %206 = add nsw i32 %205, 1
  store i32 %206, ptr %9, align 4
  br label %188

207:                                              ; preds = %201
  %208 = load ptr, ptr %5, align 8
  %209 = getelementptr inbounds %struct.ptree, ptr %208, i32 0, i32 3
  %210 = load i8, ptr %209, align 1
  %211 = sext i8 %210 to i32
  %212 = load ptr, ptr %4, align 8
  %213 = load i64, ptr %212, align 8
  %214 = call i64 @bit(i32 noundef %211, i64 noundef %213)
  %215 = icmp ne i64 %214, 0
  br i1 %215, label %216, label %225

216:                                              ; preds = %207
  %217 = load ptr, ptr %5, align 8
  %218 = getelementptr inbounds %struct.ptree, ptr %217, i32 0, i32 5
  %219 = load ptr, ptr %218, align 8
  %220 = load ptr, ptr %4, align 8
  %221 = load i32, ptr %9, align 4
  %222 = call ptr @insertR(ptr noundef %219, ptr noundef %220, i32 noundef %221, ptr noundef %217)
  %223 = load ptr, ptr %5, align 8
  %224 = getelementptr inbounds %struct.ptree, ptr %223, i32 0, i32 5
  store ptr %222, ptr %224, align 8
  br label %234

225:                                              ; preds = %207
  %226 = load ptr, ptr %5, align 8
  %227 = getelementptr inbounds %struct.ptree, ptr %226, i32 0, i32 4
  %228 = load ptr, ptr %227, align 8
  %229 = load ptr, ptr %4, align 8
  %230 = load i32, ptr %9, align 4
  %231 = call ptr @insertR(ptr noundef %228, ptr noundef %229, i32 noundef %230, ptr noundef %226)
  %232 = load ptr, ptr %5, align 8
  %233 = getelementptr inbounds %struct.ptree, ptr %232, i32 0, i32 4
  store ptr %231, ptr %233, align 8
  br label %234

234:                                              ; preds = %225, %216
  %235 = load ptr, ptr %4, align 8
  store ptr %235, ptr %3, align 8
  br label %236

236:                                              ; preds = %234, %171, %86, %20
  %237 = load ptr, ptr %3, align 8
  ret ptr %237
}

; Function Attrs: noinline nounwind uwtable
define internal i64 @bit(i32 noundef %0, i64 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  store i32 %0, ptr %3, align 4
  store i64 %1, ptr %4, align 8
  %5 = load i32, ptr %3, align 4
  %6 = sub nsw i32 31, %5
  %7 = shl i32 1, %6
  %8 = sext i32 %7 to i64
  %9 = and i64 %1, %8
  ret i64 %9
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

declare i32 @bcopy(...) #3

; Function Attrs: noinline nounwind uwtable
define internal ptr @insertR(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = getelementptr inbounds %struct.ptree, ptr %10, i32 0, i32 3
  %12 = load i8, ptr %11, align 1
  %13 = sext i8 %12 to i32
  %14 = load i32, ptr %8, align 4
  %15 = icmp sge i32 %13, %14
  br i1 %15, label %26, label %16

16:                                               ; preds = %4
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds %struct.ptree, ptr %17, i32 0, i32 3
  %19 = load i8, ptr %18, align 1
  %20 = sext i8 %19 to i32
  %21 = load ptr, ptr %9, align 8
  %22 = getelementptr inbounds %struct.ptree, ptr %21, i32 0, i32 3
  %23 = load i8, ptr %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp sle i32 %20, %24
  br i1 %25, label %26, label %58

26:                                               ; preds = %16, %4
  %27 = load i32, ptr %8, align 4
  %28 = trunc i32 %27 to i8
  %29 = load ptr, ptr %7, align 8
  %30 = getelementptr inbounds %struct.ptree, ptr %29, i32 0, i32 3
  store i8 %28, ptr %30, align 1
  %31 = load i32, ptr %8, align 4
  %32 = load ptr, ptr %7, align 8
  %33 = load i64, ptr %32, align 8
  %34 = call i64 @bit(i32 noundef %31, i64 noundef %33)
  %35 = icmp ne i64 %34, 0
  br i1 %35, label %36, label %38

36:                                               ; preds = %26
  %37 = load ptr, ptr %6, align 8
  br label %40

38:                                               ; preds = %26
  %39 = load ptr, ptr %7, align 8
  br label %40

40:                                               ; preds = %38, %36
  %41 = phi ptr [ %37, %36 ], [ %39, %38 ]
  %42 = load ptr, ptr %7, align 8
  %43 = getelementptr inbounds %struct.ptree, ptr %42, i32 0, i32 4
  store ptr %41, ptr %43, align 8
  %44 = load i32, ptr %8, align 4
  %45 = load ptr, ptr %7, align 8
  %46 = load i64, ptr %45, align 8
  %47 = call i64 @bit(i32 noundef %44, i64 noundef %46)
  %48 = icmp ne i64 %47, 0
  br i1 %48, label %49, label %51

49:                                               ; preds = %40
  %50 = load ptr, ptr %7, align 8
  br label %53

51:                                               ; preds = %40
  %52 = load ptr, ptr %6, align 8
  br label %53

53:                                               ; preds = %51, %49
  %54 = phi ptr [ %50, %49 ], [ %52, %51 ]
  %55 = load ptr, ptr %7, align 8
  %56 = getelementptr inbounds %struct.ptree, ptr %55, i32 0, i32 5
  store ptr %54, ptr %56, align 8
  %57 = load ptr, ptr %7, align 8
  store ptr %57, ptr %5, align 8
  br label %87

58:                                               ; preds = %16
  %59 = load ptr, ptr %6, align 8
  %60 = getelementptr inbounds %struct.ptree, ptr %59, i32 0, i32 3
  %61 = load i8, ptr %60, align 1
  %62 = sext i8 %61 to i32
  %63 = load ptr, ptr %7, align 8
  %64 = load i64, ptr %63, align 8
  %65 = call i64 @bit(i32 noundef %62, i64 noundef %64)
  %66 = icmp ne i64 %65, 0
  br i1 %66, label %67, label %76

67:                                               ; preds = %58
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds %struct.ptree, ptr %68, i32 0, i32 5
  %70 = load ptr, ptr %69, align 8
  %71 = load ptr, ptr %7, align 8
  %72 = load i32, ptr %8, align 4
  %73 = call ptr @insertR(ptr noundef %70, ptr noundef %71, i32 noundef %72, ptr noundef %68)
  %74 = load ptr, ptr %6, align 8
  %75 = getelementptr inbounds %struct.ptree, ptr %74, i32 0, i32 5
  store ptr %73, ptr %75, align 8
  br label %85

76:                                               ; preds = %58
  %77 = load ptr, ptr %6, align 8
  %78 = getelementptr inbounds %struct.ptree, ptr %77, i32 0, i32 4
  %79 = load ptr, ptr %78, align 8
  %80 = load ptr, ptr %7, align 8
  %81 = load i32, ptr %8, align 4
  %82 = call ptr @insertR(ptr noundef %79, ptr noundef %80, i32 noundef %81, ptr noundef %77)
  %83 = load ptr, ptr %6, align 8
  %84 = getelementptr inbounds %struct.ptree, ptr %83, i32 0, i32 4
  store ptr %82, ptr %84, align 8
  br label %85

85:                                               ; preds = %76, %67
  %86 = load ptr, ptr %6, align 8
  store ptr %86, ptr %5, align 8
  br label %87

87:                                               ; preds = %85, %53
  %88 = load ptr, ptr %5, align 8
  ret ptr %88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @pat_remove(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %24

16:                                               ; preds = %2
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.ptree, ptr %17, i32 0, i32 1
  %19 = load ptr, ptr %18, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %24

21:                                               ; preds = %16
  %22 = load ptr, ptr %10, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %25, label %24

24:                                               ; preds = %21, %16, %2
  store i32 0, ptr %3, align 4
  br label %316

25:                                               ; preds = %21
  %26 = load ptr, ptr %5, align 8
  store ptr %26, ptr %10, align 8
  store ptr %26, ptr %6, align 8
  store ptr %26, ptr %7, align 8
  br label %27

27:                                               ; preds = %52, %25
  %28 = load ptr, ptr %10, align 8
  %29 = getelementptr inbounds %struct.ptree, ptr %28, i32 0, i32 3
  %30 = load i8, ptr %29, align 1
  %31 = sext i8 %30 to i32
  store i32 %31, ptr %13, align 4
  %32 = load ptr, ptr %6, align 8
  store ptr %32, ptr %7, align 8
  %33 = load ptr, ptr %10, align 8
  store ptr %33, ptr %6, align 8
  %34 = load ptr, ptr %10, align 8
  %35 = getelementptr inbounds %struct.ptree, ptr %34, i32 0, i32 3
  %36 = load i8, ptr %35, align 1
  %37 = sext i8 %36 to i32
  %38 = load ptr, ptr %4, align 8
  %39 = load i64, ptr %38, align 8
  %40 = call i64 @bit(i32 noundef %37, i64 noundef %39)
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %46

42:                                               ; preds = %27
  %43 = load ptr, ptr %10, align 8
  %44 = getelementptr inbounds %struct.ptree, ptr %43, i32 0, i32 5
  %45 = load ptr, ptr %44, align 8
  br label %50

46:                                               ; preds = %27
  %47 = load ptr, ptr %10, align 8
  %48 = getelementptr inbounds %struct.ptree, ptr %47, i32 0, i32 4
  %49 = load ptr, ptr %48, align 8
  br label %50

50:                                               ; preds = %46, %42
  %51 = phi ptr [ %45, %42 ], [ %49, %46 ]
  store ptr %51, ptr %10, align 8
  br label %52

52:                                               ; preds = %50
  %53 = load i32, ptr %13, align 4
  %54 = load ptr, ptr %10, align 8
  %55 = getelementptr inbounds %struct.ptree, ptr %54, i32 0, i32 3
  %56 = load i8, ptr %55, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp slt i32 %53, %57
  br i1 %58, label %27, label %59

59:                                               ; preds = %52
  %60 = load ptr, ptr %10, align 8
  %61 = load i64, ptr %60, align 8
  %62 = load ptr, ptr %4, align 8
  %63 = load i64, ptr %62, align 8
  %64 = icmp ne i64 %61, %63
  br i1 %64, label %65, label %66

65:                                               ; preds = %59
  store i32 0, ptr %3, align 4
  br label %316

66:                                               ; preds = %59
  %67 = load ptr, ptr %10, align 8
  %68 = getelementptr inbounds %struct.ptree, ptr %67, i32 0, i32 2
  %69 = load i8, ptr %68, align 8
  %70 = zext i8 %69 to i32
  %71 = icmp eq i32 %70, 1
  br i1 %71, label %72, label %227

72:                                               ; preds = %66
  %73 = load ptr, ptr %10, align 8
  %74 = getelementptr inbounds %struct.ptree, ptr %73, i32 0, i32 3
  %75 = load i8, ptr %74, align 1
  %76 = sext i8 %75 to i32
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %79

78:                                               ; preds = %72
  store i32 0, ptr %3, align 4
  br label %316

79:                                               ; preds = %72
  %80 = load ptr, ptr %10, align 8
  %81 = getelementptr inbounds %struct.ptree, ptr %80, i32 0, i32 1
  %82 = load ptr, ptr %81, align 8
  %83 = load i64, ptr %82, align 8
  %84 = load ptr, ptr %4, align 8
  %85 = getelementptr inbounds %struct.ptree, ptr %84, i32 0, i32 1
  %86 = load ptr, ptr %85, align 8
  %87 = load i64, ptr %86, align 8
  %88 = icmp ne i64 %83, %87
  br i1 %88, label %89, label %90

89:                                               ; preds = %79
  store i32 0, ptr %3, align 4
  br label %316

90:                                               ; preds = %79
  %91 = load ptr, ptr %6, align 8
  store ptr %91, ptr %8, align 8
  store ptr %91, ptr %9, align 8
  br label %92

92:                                               ; preds = %116, %90
  %93 = load ptr, ptr %8, align 8
  %94 = getelementptr inbounds %struct.ptree, ptr %93, i32 0, i32 3
  %95 = load i8, ptr %94, align 1
  %96 = sext i8 %95 to i32
  store i32 %96, ptr %13, align 4
  %97 = load ptr, ptr %8, align 8
  store ptr %97, ptr %9, align 8
  %98 = load ptr, ptr %8, align 8
  %99 = getelementptr inbounds %struct.ptree, ptr %98, i32 0, i32 3
  %100 = load i8, ptr %99, align 1
  %101 = sext i8 %100 to i32
  %102 = load ptr, ptr %6, align 8
  %103 = load i64, ptr %102, align 8
  %104 = call i64 @bit(i32 noundef %101, i64 noundef %103)
  %105 = icmp ne i64 %104, 0
  br i1 %105, label %106, label %110

106:                                              ; preds = %92
  %107 = load ptr, ptr %8, align 8
  %108 = getelementptr inbounds %struct.ptree, ptr %107, i32 0, i32 5
  %109 = load ptr, ptr %108, align 8
  br label %114

110:                                              ; preds = %92
  %111 = load ptr, ptr %8, align 8
  %112 = getelementptr inbounds %struct.ptree, ptr %111, i32 0, i32 4
  %113 = load ptr, ptr %112, align 8
  br label %114

114:                                              ; preds = %110, %106
  %115 = phi ptr [ %109, %106 ], [ %113, %110 ]
  store ptr %115, ptr %8, align 8
  br label %116

116:                                              ; preds = %114
  %117 = load i32, ptr %13, align 4
  %118 = load ptr, ptr %8, align 8
  %119 = getelementptr inbounds %struct.ptree, ptr %118, i32 0, i32 3
  %120 = load i8, ptr %119, align 1
  %121 = sext i8 %120 to i32
  %122 = icmp slt i32 %117, %121
  br i1 %122, label %92, label %123

123:                                              ; preds = %116
  %124 = load ptr, ptr %9, align 8
  %125 = getelementptr inbounds %struct.ptree, ptr %124, i32 0, i32 3
  %126 = load i8, ptr %125, align 1
  %127 = sext i8 %126 to i32
  %128 = load ptr, ptr %6, align 8
  %129 = load i64, ptr %128, align 8
  %130 = call i64 @bit(i32 noundef %127, i64 noundef %129)
  %131 = icmp ne i64 %130, 0
  br i1 %131, label %132, label %136

132:                                              ; preds = %123
  %133 = load ptr, ptr %10, align 8
  %134 = load ptr, ptr %9, align 8
  %135 = getelementptr inbounds %struct.ptree, ptr %134, i32 0, i32 5
  store ptr %133, ptr %135, align 8
  br label %140

136:                                              ; preds = %123
  %137 = load ptr, ptr %10, align 8
  %138 = load ptr, ptr %9, align 8
  %139 = getelementptr inbounds %struct.ptree, ptr %138, i32 0, i32 4
  store ptr %137, ptr %139, align 8
  br label %140

140:                                              ; preds = %136, %132
  %141 = load ptr, ptr %7, align 8
  %142 = getelementptr inbounds %struct.ptree, ptr %141, i32 0, i32 3
  %143 = load i8, ptr %142, align 1
  %144 = sext i8 %143 to i32
  %145 = load ptr, ptr %4, align 8
  %146 = load i64, ptr %145, align 8
  %147 = call i64 @bit(i32 noundef %144, i64 noundef %146)
  %148 = icmp ne i64 %147, 0
  br i1 %148, label %149, label %170

149:                                              ; preds = %140
  %150 = load ptr, ptr %6, align 8
  %151 = getelementptr inbounds %struct.ptree, ptr %150, i32 0, i32 3
  %152 = load i8, ptr %151, align 1
  %153 = sext i8 %152 to i32
  %154 = load ptr, ptr %4, align 8
  %155 = load i64, ptr %154, align 8
  %156 = call i64 @bit(i32 noundef %153, i64 noundef %155)
  %157 = icmp ne i64 %156, 0
  br i1 %157, label %158, label %162

158:                                              ; preds = %149
  %159 = load ptr, ptr %6, align 8
  %160 = getelementptr inbounds %struct.ptree, ptr %159, i32 0, i32 4
  %161 = load ptr, ptr %160, align 8
  br label %166

162:                                              ; preds = %149
  %163 = load ptr, ptr %6, align 8
  %164 = getelementptr inbounds %struct.ptree, ptr %163, i32 0, i32 5
  %165 = load ptr, ptr %164, align 8
  br label %166

166:                                              ; preds = %162, %158
  %167 = phi ptr [ %161, %158 ], [ %165, %162 ]
  %168 = load ptr, ptr %7, align 8
  %169 = getelementptr inbounds %struct.ptree, ptr %168, i32 0, i32 5
  store ptr %167, ptr %169, align 8
  br label %191

170:                                              ; preds = %140
  %171 = load ptr, ptr %6, align 8
  %172 = getelementptr inbounds %struct.ptree, ptr %171, i32 0, i32 3
  %173 = load i8, ptr %172, align 1
  %174 = sext i8 %173 to i32
  %175 = load ptr, ptr %4, align 8
  %176 = load i64, ptr %175, align 8
  %177 = call i64 @bit(i32 noundef %174, i64 noundef %176)
  %178 = icmp ne i64 %177, 0
  br i1 %178, label %179, label %183

179:                                              ; preds = %170
  %180 = load ptr, ptr %6, align 8
  %181 = getelementptr inbounds %struct.ptree, ptr %180, i32 0, i32 4
  %182 = load ptr, ptr %181, align 8
  br label %187

183:                                              ; preds = %170
  %184 = load ptr, ptr %6, align 8
  %185 = getelementptr inbounds %struct.ptree, ptr %184, i32 0, i32 5
  %186 = load ptr, ptr %185, align 8
  br label %187

187:                                              ; preds = %183, %179
  %188 = phi ptr [ %182, %179 ], [ %186, %183 ]
  %189 = load ptr, ptr %7, align 8
  %190 = getelementptr inbounds %struct.ptree, ptr %189, i32 0, i32 4
  store ptr %188, ptr %190, align 8
  br label %191

191:                                              ; preds = %187, %166
  %192 = load ptr, ptr %10, align 8
  %193 = getelementptr inbounds %struct.ptree, ptr %192, i32 0, i32 1
  %194 = load ptr, ptr %193, align 8
  %195 = getelementptr inbounds %struct.ptree_mask, ptr %194, i32 0, i32 1
  %196 = load ptr, ptr %195, align 8
  %197 = icmp ne ptr %196, null
  br i1 %197, label %198, label %204

198:                                              ; preds = %191
  %199 = load ptr, ptr %10, align 8
  %200 = getelementptr inbounds %struct.ptree, ptr %199, i32 0, i32 1
  %201 = load ptr, ptr %200, align 8
  %202 = getelementptr inbounds %struct.ptree_mask, ptr %201, i32 0, i32 1
  %203 = load ptr, ptr %202, align 8
  call void @free(ptr noundef %203) #7
  br label %204

204:                                              ; preds = %198, %191
  %205 = load ptr, ptr %10, align 8
  %206 = getelementptr inbounds %struct.ptree, ptr %205, i32 0, i32 1
  %207 = load ptr, ptr %206, align 8
  call void @free(ptr noundef %207) #7
  %208 = load ptr, ptr %10, align 8
  %209 = load ptr, ptr %6, align 8
  %210 = icmp ne ptr %208, %209
  br i1 %210, label %211, label %225

211:                                              ; preds = %204
  %212 = load ptr, ptr %6, align 8
  %213 = load i64, ptr %212, align 8
  %214 = load ptr, ptr %10, align 8
  store i64 %213, ptr %214, align 8
  %215 = load ptr, ptr %6, align 8
  %216 = getelementptr inbounds %struct.ptree, ptr %215, i32 0, i32 1
  %217 = load ptr, ptr %216, align 8
  %218 = load ptr, ptr %10, align 8
  %219 = getelementptr inbounds %struct.ptree, ptr %218, i32 0, i32 1
  store ptr %217, ptr %219, align 8
  %220 = load ptr, ptr %6, align 8
  %221 = getelementptr inbounds %struct.ptree, ptr %220, i32 0, i32 2
  %222 = load i8, ptr %221, align 8
  %223 = load ptr, ptr %10, align 8
  %224 = getelementptr inbounds %struct.ptree, ptr %223, i32 0, i32 2
  store i8 %222, ptr %224, align 8
  br label %225

225:                                              ; preds = %211, %204
  %226 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %226) #7
  store i32 1, ptr %3, align 4
  br label %316

227:                                              ; preds = %66
  store i32 0, ptr %13, align 4
  br label %228

228:                                              ; preds = %250, %227
  %229 = load i32, ptr %13, align 4
  %230 = load ptr, ptr %10, align 8
  %231 = getelementptr inbounds %struct.ptree, ptr %230, i32 0, i32 2
  %232 = load i8, ptr %231, align 8
  %233 = zext i8 %232 to i32
  %234 = icmp slt i32 %229, %233
  br i1 %234, label %235, label %253

235:                                              ; preds = %228
  %236 = load ptr, ptr %4, align 8
  %237 = getelementptr inbounds %struct.ptree, ptr %236, i32 0, i32 1
  %238 = load ptr, ptr %237, align 8
  %239 = load i64, ptr %238, align 8
  %240 = load ptr, ptr %10, align 8
  %241 = getelementptr inbounds %struct.ptree, ptr %240, i32 0, i32 1
  %242 = load ptr, ptr %241, align 8
  %243 = load i32, ptr %13, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds %struct.ptree_mask, ptr %242, i64 %244
  %246 = load i64, ptr %245, align 8
  %247 = icmp eq i64 %239, %246
  br i1 %247, label %248, label %249

248:                                              ; preds = %235
  br label %253

249:                                              ; preds = %235
  br label %250

250:                                              ; preds = %249
  %251 = load i32, ptr %13, align 4
  %252 = add nsw i32 %251, 1
  store i32 %252, ptr %13, align 4
  br label %228

253:                                              ; preds = %248, %228
  %254 = load i32, ptr %13, align 4
  %255 = load ptr, ptr %10, align 8
  %256 = getelementptr inbounds %struct.ptree, ptr %255, i32 0, i32 2
  %257 = load i8, ptr %256, align 8
  %258 = zext i8 %257 to i32
  %259 = icmp sge i32 %254, %258
  br i1 %259, label %260, label %261

260:                                              ; preds = %253
  store i32 0, ptr %3, align 4
  br label %316

261:                                              ; preds = %253
  %262 = load ptr, ptr %10, align 8
  %263 = getelementptr inbounds %struct.ptree, ptr %262, i32 0, i32 2
  %264 = load i8, ptr %263, align 8
  %265 = zext i8 %264 to i32
  %266 = sub nsw i32 %265, 1
  %267 = sext i32 %266 to i64
  %268 = mul i64 16, %267
  %269 = call noalias ptr @malloc(i64 noundef %268) #8
  store ptr %269, ptr %11, align 8
  store i32 0, ptr %13, align 4
  %270 = load ptr, ptr %11, align 8
  store ptr %270, ptr %12, align 8
  br label %271

271:                                              ; preds = %302, %261
  %272 = load i32, ptr %13, align 4
  %273 = load ptr, ptr %10, align 8
  %274 = getelementptr inbounds %struct.ptree, ptr %273, i32 0, i32 2
  %275 = load i8, ptr %274, align 8
  %276 = zext i8 %275 to i32
  %277 = icmp slt i32 %272, %276
  br i1 %277, label %278, label %305

278:                                              ; preds = %271
  %279 = load ptr, ptr %4, align 8
  %280 = getelementptr inbounds %struct.ptree, ptr %279, i32 0, i32 1
  %281 = load ptr, ptr %280, align 8
  %282 = load i64, ptr %281, align 8
  %283 = load ptr, ptr %10, align 8
  %284 = getelementptr inbounds %struct.ptree, ptr %283, i32 0, i32 1
  %285 = load ptr, ptr %284, align 8
  %286 = load i32, ptr %13, align 4
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds %struct.ptree_mask, ptr %285, i64 %287
  %289 = load i64, ptr %288, align 8
  %290 = icmp ne i64 %282, %289
  br i1 %290, label %291, label %301

291:                                              ; preds = %278
  %292 = load ptr, ptr %10, align 8
  %293 = getelementptr inbounds %struct.ptree, ptr %292, i32 0, i32 1
  %294 = load ptr, ptr %293, align 8
  %295 = load i32, ptr %13, align 4
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds %struct.ptree_mask, ptr %294, i64 %296
  %298 = load ptr, ptr %12, align 8
  %299 = getelementptr inbounds %struct.ptree_mask, ptr %298, i32 1
  store ptr %299, ptr %12, align 8
  %300 = call i32 (ptr, ptr, i64, ...) @bcopy(ptr noundef %297, ptr noundef %298, i64 noundef 16)
  br label %301

301:                                              ; preds = %291, %278
  br label %302

302:                                              ; preds = %301
  %303 = load i32, ptr %13, align 4
  %304 = add nsw i32 %303, 1
  store i32 %304, ptr %13, align 4
  br label %271

305:                                              ; preds = %271
  %306 = load ptr, ptr %10, align 8
  %307 = getelementptr inbounds %struct.ptree, ptr %306, i32 0, i32 2
  %308 = load i8, ptr %307, align 8
  %309 = add i8 %308, -1
  store i8 %309, ptr %307, align 8
  %310 = load ptr, ptr %10, align 8
  %311 = getelementptr inbounds %struct.ptree, ptr %310, i32 0, i32 1
  %312 = load ptr, ptr %311, align 8
  call void @free(ptr noundef %312) #7
  %313 = load ptr, ptr %11, align 8
  %314 = load ptr, ptr %10, align 8
  %315 = getelementptr inbounds %struct.ptree, ptr %314, i32 0, i32 1
  store ptr %313, ptr %315, align 8
  store i32 1, ptr %3, align 4
  br label %316

316:                                              ; preds = %305, %260, %225, %89, %78, %65, %24
  %317 = load i32, ptr %3, align 4
  ret i32 %317
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @pat_search(i64 noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store i64 %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr null, ptr %6, align 8
  %9 = load ptr, ptr %5, align 8
  store ptr %9, ptr %7, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %12, label %11

11:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %68

12:                                               ; preds = %2
  br label %13

13:                                               ; preds = %46, %12
  %14 = load ptr, ptr %7, align 8
  %15 = load i64, ptr %14, align 8
  %16 = load i64, ptr %4, align 8
  %17 = getelementptr inbounds %struct.ptree, ptr %14, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = load i64, ptr %18, align 8
  %20 = and i64 %16, %19
  %21 = icmp eq i64 %15, %20
  br i1 %21, label %22, label %24

22:                                               ; preds = %13
  %23 = load ptr, ptr %7, align 8
  store ptr %23, ptr %6, align 8
  br label %24

24:                                               ; preds = %22, %13
  %25 = load ptr, ptr %7, align 8
  %26 = getelementptr inbounds %struct.ptree, ptr %25, i32 0, i32 3
  %27 = load i8, ptr %26, align 1
  %28 = sext i8 %27 to i32
  store i32 %28, ptr %8, align 4
  %29 = load ptr, ptr %7, align 8
  %30 = getelementptr inbounds %struct.ptree, ptr %29, i32 0, i32 3
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  %33 = load i64, ptr %4, align 8
  %34 = call i64 @bit(i32 noundef %32, i64 noundef %33)
  %35 = icmp ne i64 %34, 0
  br i1 %35, label %36, label %40

36:                                               ; preds = %24
  %37 = load ptr, ptr %7, align 8
  %38 = getelementptr inbounds %struct.ptree, ptr %37, i32 0, i32 5
  %39 = load ptr, ptr %38, align 8
  br label %44

40:                                               ; preds = %24
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds %struct.ptree, ptr %41, i32 0, i32 4
  %43 = load ptr, ptr %42, align 8
  br label %44

44:                                               ; preds = %40, %36
  %45 = phi ptr [ %39, %36 ], [ %43, %40 ]
  store ptr %45, ptr %7, align 8
  br label %46

46:                                               ; preds = %44
  %47 = load i32, ptr %8, align 4
  %48 = load ptr, ptr %7, align 8
  %49 = getelementptr inbounds %struct.ptree, ptr %48, i32 0, i32 3
  %50 = load i8, ptr %49, align 1
  %51 = sext i8 %50 to i32
  %52 = icmp slt i32 %47, %51
  br i1 %52, label %13, label %53

53:                                               ; preds = %46
  %54 = load ptr, ptr %7, align 8
  %55 = load i64, ptr %54, align 8
  %56 = load i64, ptr %4, align 8
  %57 = getelementptr inbounds %struct.ptree, ptr %54, i32 0, i32 1
  %58 = load ptr, ptr %57, align 8
  %59 = load i64, ptr %58, align 8
  %60 = and i64 %56, %59
  %61 = icmp eq i64 %55, %60
  br i1 %61, label %62, label %64

62:                                               ; preds = %53
  %63 = load ptr, ptr %7, align 8
  br label %66

64:                                               ; preds = %53
  %65 = load ptr, ptr %6, align 8
  br label %66

66:                                               ; preds = %64, %62
  %67 = phi ptr [ %63, %62 ], [ %65, %64 ]
  store ptr %67, ptr %3, align 8
  br label %68

68:                                               ; preds = %66, %11
  %69 = load ptr, ptr %3, align 8
  ret ptr %69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca [128 x i8], align 16
  %12 = alloca %struct.in_addr, align 4
  %13 = alloca i64, align 8
  %14 = alloca float, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i64 4294967295, ptr %13, align 8
  %15 = load i32, ptr %4, align 4
  %16 = icmp slt i32 %15, 2
  br i1 %16, label %17, label %21

17:                                               ; preds = %2
  %18 = load ptr, ptr %5, align 8
  %19 = load ptr, ptr %18, align 8
  %20 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %19)
  call void @exit(i32 noundef -1) #9
  unreachable

21:                                               ; preds = %2
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds ptr, ptr %22, i64 1
  %24 = load ptr, ptr %23, align 8
  %25 = call noalias ptr @fopen(ptr noundef %24, ptr noundef @.str.1)
  store ptr %25, ptr %10, align 8
  %26 = icmp eq ptr %25, null
  br i1 %26, label %27, label %32

27:                                               ; preds = %21
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds ptr, ptr %28, i64 1
  %30 = load ptr, ptr %29, align 8
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef %30)
  call void @exit(i32 noundef 1) #9
  unreachable

32:                                               ; preds = %21
  %33 = call noalias ptr @malloc(i64 noundef 40) #8
  store ptr %33, ptr %6, align 8
  %34 = icmp ne ptr %33, null
  br i1 %34, label %36, label %35

35:                                               ; preds = %32
  call void @perror(ptr noundef @.str.3) #10
  call void @exit(i32 noundef 1) #9
  unreachable

36:                                               ; preds = %32
  %37 = load ptr, ptr %6, align 8
  call void @bzero(ptr noundef %37, i64 noundef 40) #7
  %38 = call noalias ptr @malloc(i64 noundef 16) #8
  %39 = load ptr, ptr %6, align 8
  %40 = getelementptr inbounds %struct.ptree, ptr %39, i32 0, i32 1
  store ptr %38, ptr %40, align 8
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds %struct.ptree, ptr %41, i32 0, i32 1
  %43 = load ptr, ptr %42, align 8
  %44 = icmp ne ptr %43, null
  br i1 %44, label %46, label %45

45:                                               ; preds = %36
  call void @perror(ptr noundef @.str.4) #10
  call void @exit(i32 noundef 1) #9
  unreachable

46:                                               ; preds = %36
  %47 = load ptr, ptr %6, align 8
  %48 = getelementptr inbounds %struct.ptree, ptr %47, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  call void @bzero(ptr noundef %49, i64 noundef 16) #7
  %50 = load ptr, ptr %6, align 8
  %51 = getelementptr inbounds %struct.ptree, ptr %50, i32 0, i32 1
  %52 = load ptr, ptr %51, align 8
  store ptr %52, ptr %9, align 8
  %53 = call noalias ptr @malloc(i64 noundef 16) #8
  %54 = load ptr, ptr %9, align 8
  %55 = getelementptr inbounds %struct.ptree_mask, ptr %54, i32 0, i32 1
  store ptr %53, ptr %55, align 8
  %56 = load ptr, ptr %9, align 8
  %57 = getelementptr inbounds %struct.ptree_mask, ptr %56, i32 0, i32 1
  %58 = load ptr, ptr %57, align 8
  %59 = icmp ne ptr %58, null
  br i1 %59, label %61, label %60

60:                                               ; preds = %46
  call void @perror(ptr noundef @.str.5) #10
  call void @exit(i32 noundef 1) #9
  unreachable

61:                                               ; preds = %46
  %62 = load ptr, ptr %9, align 8
  %63 = getelementptr inbounds %struct.ptree_mask, ptr %62, i32 0, i32 1
  %64 = load ptr, ptr %63, align 8
  call void @bzero(ptr noundef %64, i64 noundef 1) #7
  %65 = load ptr, ptr %6, align 8
  %66 = getelementptr inbounds %struct.ptree, ptr %65, i32 0, i32 2
  store i8 1, ptr %66, align 8
  %67 = load ptr, ptr %6, align 8
  %68 = getelementptr inbounds %struct.ptree, ptr %67, i32 0, i32 5
  store ptr %67, ptr %68, align 8
  %69 = load ptr, ptr %6, align 8
  %70 = getelementptr inbounds %struct.ptree, ptr %69, i32 0, i32 4
  store ptr %67, ptr %70, align 8
  br label %71

71:                                               ; preds = %143, %61
  %72 = load ptr, ptr %10, align 8
  %73 = call ptr @fgets(ptr noundef %11, i32 noundef 128, ptr noundef %72)
  %74 = icmp ne ptr %73, null
  br i1 %74, label %75, label %144

75:                                               ; preds = %71
  %76 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef %11, ptr noundef @.str.6, ptr noundef %14, ptr noundef %12) #7
  %77 = call noalias ptr @malloc(i64 noundef 40) #8
  store ptr %77, ptr %7, align 8
  %78 = icmp ne ptr %77, null
  br i1 %78, label %80, label %79

79:                                               ; preds = %75
  call void @perror(ptr noundef @.str.3) #10
  call void @exit(i32 noundef 1) #9
  unreachable

80:                                               ; preds = %75
  %81 = load ptr, ptr %7, align 8
  call void @bzero(ptr noundef %81, i64 noundef 40) #7
  %82 = call noalias ptr @malloc(i64 noundef 16) #8
  %83 = load ptr, ptr %7, align 8
  %84 = getelementptr inbounds %struct.ptree, ptr %83, i32 0, i32 1
  store ptr %82, ptr %84, align 8
  %85 = load ptr, ptr %7, align 8
  %86 = getelementptr inbounds %struct.ptree, ptr %85, i32 0, i32 1
  %87 = load ptr, ptr %86, align 8
  %88 = icmp ne ptr %87, null
  br i1 %88, label %90, label %89

89:                                               ; preds = %80
  call void @perror(ptr noundef @.str.4) #10
  call void @exit(i32 noundef 1) #9
  unreachable

90:                                               ; preds = %80
  %91 = load ptr, ptr %7, align 8
  %92 = getelementptr inbounds %struct.ptree, ptr %91, i32 0, i32 1
  %93 = load ptr, ptr %92, align 8
  call void @bzero(ptr noundef %93, i64 noundef 16) #7
  %94 = load ptr, ptr %7, align 8
  %95 = getelementptr inbounds %struct.ptree, ptr %94, i32 0, i32 1
  %96 = load ptr, ptr %95, align 8
  store ptr %96, ptr %9, align 8
  %97 = call noalias ptr @malloc(i64 noundef 16) #8
  %98 = load ptr, ptr %9, align 8
  %99 = getelementptr inbounds %struct.ptree_mask, ptr %98, i32 0, i32 1
  store ptr %97, ptr %99, align 8
  %100 = load ptr, ptr %9, align 8
  %101 = getelementptr inbounds %struct.ptree_mask, ptr %100, i32 0, i32 1
  %102 = load ptr, ptr %101, align 8
  %103 = icmp ne ptr %102, null
  br i1 %103, label %105, label %104

104:                                              ; preds = %90
  call void @perror(ptr noundef @.str.5) #10
  call void @exit(i32 noundef 1) #9
  unreachable

105:                                              ; preds = %90
  %106 = load ptr, ptr %9, align 8
  %107 = getelementptr inbounds %struct.ptree_mask, ptr %106, i32 0, i32 1
  %108 = load ptr, ptr %107, align 8
  call void @bzero(ptr noundef %108, i64 noundef 1) #7
  %109 = load i32, ptr %12, align 4
  %110 = zext i32 %109 to i64
  %111 = load ptr, ptr %7, align 8
  store i64 %110, ptr %111, align 8
  %112 = load i64, ptr %13, align 8
  %113 = trunc i64 %112 to i32
  %114 = call i32 @htonl(i32 noundef %113) #11
  %115 = zext i32 %114 to i64
  %116 = load ptr, ptr %7, align 8
  %117 = getelementptr inbounds %struct.ptree, ptr %116, i32 0, i32 1
  %118 = load ptr, ptr %117, align 8
  store i64 %115, ptr %118, align 8
  %119 = load i32, ptr %12, align 4
  %120 = zext i32 %119 to i64
  %121 = load ptr, ptr %6, align 8
  %122 = call ptr @pat_search(i64 noundef %120, ptr noundef %121)
  store ptr %122, ptr %8, align 8
  %123 = load i64, ptr %122, align 8
  %124 = load i32, ptr %12, align 4
  %125 = zext i32 %124 to i64
  %126 = icmp eq i64 %123, %125
  br i1 %126, label %127, label %133

127:                                              ; preds = %105
  %128 = load float, ptr %14, align 4
  %129 = fpext float %128 to double
  %130 = load i32, ptr %12, align 4
  %131 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, double noundef %129, i32 noundef %130)
  %132 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %137

133:                                              ; preds = %105
  %134 = load ptr, ptr %7, align 8
  %135 = load ptr, ptr %6, align 8
  %136 = call ptr @pat_insert(ptr noundef %134, ptr noundef %135)
  store ptr %136, ptr %7, align 8
  br label %137

137:                                              ; preds = %133, %127
  %138 = load ptr, ptr %7, align 8
  %139 = icmp ne ptr %138, null
  br i1 %139, label %143, label %140

140:                                              ; preds = %137
  %141 = load ptr, ptr @stderr, align 8
  %142 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %141, ptr noundef @.str.9)
  call void @exit(i32 noundef 1) #9
  unreachable

143:                                              ; preds = %137
  br label %71

144:                                              ; preds = %71
  call void @exit(i32 noundef 0) #9
  unreachable
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

declare noalias ptr @fopen(ptr noundef, ptr noundef) #3

; Function Attrs: cold
declare void @perror(ptr noundef) #5

; Function Attrs: nounwind
declare void @bzero(ptr noundef, i64 noundef) #1

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #3

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(none)
declare i32 @htonl(i32 noundef) #6

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind allocsize(0) }
attributes #9 = { noreturn nounwind }
attributes #10 = { cold }
attributes #11 = { nounwind willreturn memory(none) }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
