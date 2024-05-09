; ModuleID = 'sha-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.SHA_INFO = type { [5 x i32], i32, i32, [16 x i32] }

@stdin = external global ptr, align 8
@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"error opening %s for reading\0A\00", align 1
@.str.5 = private unnamed_addr constant [26 x i8] c"%08x %08x %08x %08x %08x\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.SHA_INFO, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %8, 2
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = load ptr, ptr @stdin, align 8
  store ptr %11, ptr %6, align 8
  call void @sha_stream(ptr noundef %7, ptr noundef %11)
  call void @sha_print(ptr noundef %7)
  br label %33

12:                                               ; preds = %2
  br label %13

13:                                               ; preds = %31, %12
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %14, -1
  store i32 %15, ptr %4, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %32

17:                                               ; preds = %13
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds ptr, ptr %18, i32 1
  store ptr %19, ptr %5, align 8
  %20 = load ptr, ptr %19, align 8
  %21 = call noalias ptr @fopen(ptr noundef %20, ptr noundef @.str)
  store ptr %21, ptr %6, align 8
  %22 = icmp eq ptr %21, null
  br i1 %22, label %23, label %27

23:                                               ; preds = %17
  %24 = load ptr, ptr %5, align 8
  %25 = load ptr, ptr %24, align 8
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %25)
  br label %31

27:                                               ; preds = %17
  %28 = load ptr, ptr %6, align 8
  call void @sha_stream(ptr noundef %7, ptr noundef %28)
  call void @sha_print(ptr noundef %7)
  %29 = load ptr, ptr %6, align 8
  %30 = call i32 @fclose(ptr noundef %29)
  br label %31

31:                                               ; preds = %27, %23
  br label %13

32:                                               ; preds = %13
  br label %33

33:                                               ; preds = %32, %10
  ret i32 0
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @sha_init(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 1732584193, ptr %0, align 4
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 1
  store i32 -271733879, ptr %4, align 4
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds [5 x i32], ptr %5, i64 0, i64 2
  store i32 -1732584194, ptr %6, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds [5 x i32], ptr %7, i64 0, i64 3
  store i32 271733878, ptr %8, align 4
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds [5 x i32], ptr %9, i64 0, i64 4
  store i32 -1009589776, ptr %10, align 4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.SHA_INFO, ptr %11, i32 0, i32 1
  store i32 0, ptr %12, align 4
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.SHA_INFO, ptr %13, i32 0, i32 2
  store i32 0, ptr %14, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @sha_update(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.SHA_INFO, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = load i32, ptr %6, align 4
  %11 = shl i32 %10, 3
  %12 = add i32 %9, %11
  %13 = icmp ult i32 %12, %9
  br i1 %13, label %14, label %19

14:                                               ; preds = %3
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.SHA_INFO, ptr %15, i32 0, i32 2
  %17 = load i32, ptr %16, align 4
  %18 = add i32 %17, 1
  store i32 %18, ptr %16, align 4
  br label %19

19:                                               ; preds = %14, %3
  %20 = load i32, ptr %6, align 4
  %21 = shl i32 %20, 3
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.SHA_INFO, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = add i32 %24, %21
  store i32 %25, ptr %23, align 4
  %26 = load i32, ptr %6, align 4
  %27 = lshr i32 %26, 29
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds %struct.SHA_INFO, ptr %28, i32 0, i32 2
  %30 = load i32, ptr %29, align 4
  %31 = add i32 %30, %27
  store i32 %31, ptr %29, align 4
  br label %32

32:                                               ; preds = %35, %19
  %33 = load i32, ptr %6, align 4
  %34 = icmp sge i32 %33, 64
  br i1 %34, label %35, label %46

35:                                               ; preds = %32
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds %struct.SHA_INFO, ptr %36, i32 0, i32 3
  %38 = load ptr, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %37, ptr align 1 %38, i64 64, i1 false)
  %39 = load ptr, ptr %4, align 8
  %40 = getelementptr inbounds %struct.SHA_INFO, ptr %39, i32 0, i32 3
  call void @byte_reverse(ptr noundef %40, i32 noundef 64)
  %41 = load ptr, ptr %4, align 8
  call void @sha_transform(ptr noundef %41)
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds i8, ptr %42, i64 64
  store ptr %43, ptr %5, align 8
  %44 = load i32, ptr %6, align 4
  %45 = sub nsw i32 %44, 64
  store i32 %45, ptr %6, align 4
  br label %32

46:                                               ; preds = %32
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds %struct.SHA_INFO, ptr %47, i32 0, i32 3
  %49 = load ptr, ptr %5, align 8
  %50 = load i32, ptr %6, align 4
  %51 = sext i32 %50 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %48, ptr align 1 %49, i64 %51, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define internal void @byte_reverse(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [4 x i8], align 1
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %8 = sext i32 %1 to i64
  %9 = udiv i64 %8, 4
  %10 = trunc i64 %9 to i32
  store i32 %10, ptr %4, align 4
  %11 = load ptr, ptr %3, align 8
  store ptr %11, ptr %7, align 8
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %43, %2
  %13 = load i32, ptr %5, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %46

16:                                               ; preds = %12
  %17 = load ptr, ptr %7, align 8
  %18 = load i8, ptr %17, align 1
  store i8 %18, ptr %6, align 1
  %19 = load ptr, ptr %7, align 8
  %20 = getelementptr inbounds i8, ptr %19, i64 1
  %21 = load i8, ptr %20, align 1
  %22 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 1
  store i8 %21, ptr %22, align 1
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds i8, ptr %23, i64 2
  %25 = load i8, ptr %24, align 1
  %26 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 2
  store i8 %25, ptr %26, align 1
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds i8, ptr %27, i64 3
  %29 = load i8, ptr %28, align 1
  %30 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 3
  store i8 %29, ptr %30, align 1
  %31 = load ptr, ptr %7, align 8
  store i8 %29, ptr %31, align 1
  %32 = load i8, ptr %26, align 1
  %33 = load ptr, ptr %7, align 8
  %34 = getelementptr inbounds i8, ptr %33, i64 1
  store i8 %32, ptr %34, align 1
  %35 = load i8, ptr %22, align 1
  %36 = load ptr, ptr %7, align 8
  %37 = getelementptr inbounds i8, ptr %36, i64 2
  store i8 %35, ptr %37, align 1
  %38 = load i8, ptr %6, align 1
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds i8, ptr %39, i64 3
  store i8 %38, ptr %40, align 1
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds i8, ptr %41, i64 4
  store ptr %42, ptr %7, align 8
  br label %43

43:                                               ; preds = %16
  %44 = load i32, ptr %5, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %5, align 4
  br label %12

46:                                               ; preds = %12
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @sha_transform(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [80 x i32], align 16
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %11

11:                                               ; preds = %22, %1
  %12 = load i32, ptr %3, align 4
  %13 = icmp slt i32 %12, 16
  br i1 %13, label %14, label %25

14:                                               ; preds = %11
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.SHA_INFO, ptr %15, i32 0, i32 3
  %17 = load i32, ptr %3, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [16 x i32], ptr %16, i64 0, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = getelementptr inbounds [80 x i32], ptr %10, i64 0, i64 %18
  store i32 %20, ptr %21, align 4
  br label %22

22:                                               ; preds = %14
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %3, align 4
  br label %11

25:                                               ; preds = %11
  store i32 16, ptr %3, align 4
  br label %26

26:                                               ; preds = %52, %25
  %27 = load i32, ptr %3, align 4
  %28 = icmp slt i32 %27, 80
  br i1 %28, label %29, label %55

29:                                               ; preds = %26
  %30 = load i32, ptr %3, align 4
  %31 = sub nsw i32 %30, 3
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [80 x i32], ptr %10, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = sub nsw i32 %30, 8
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [80 x i32], ptr %10, i64 0, i64 %36
  %38 = load i32, ptr %37, align 4
  %39 = xor i32 %34, %38
  %40 = sub nsw i32 %30, 14
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [80 x i32], ptr %10, i64 0, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = xor i32 %39, %43
  %45 = sub nsw i32 %30, 16
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [80 x i32], ptr %10, i64 0, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = xor i32 %44, %48
  %50 = sext i32 %30 to i64
  %51 = getelementptr inbounds [80 x i32], ptr %10, i64 0, i64 %50
  store i32 %49, ptr %51, align 4
  br label %52

52:                                               ; preds = %29
  %53 = load i32, ptr %3, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %3, align 4
  br label %26

55:                                               ; preds = %26
  %56 = load ptr, ptr %2, align 8
  %57 = load i32, ptr %56, align 4
  store i32 %57, ptr %5, align 4
  %58 = load ptr, ptr %2, align 8
  %59 = getelementptr inbounds [5 x i32], ptr %58, i64 0, i64 1
  %60 = load i32, ptr %59, align 4
  store i32 %60, ptr %6, align 4
  %61 = load ptr, ptr %2, align 8
  %62 = getelementptr inbounds [5 x i32], ptr %61, i64 0, i64 2
  %63 = load i32, ptr %62, align 4
  store i32 %63, ptr %7, align 4
  %64 = load ptr, ptr %2, align 8
  %65 = getelementptr inbounds [5 x i32], ptr %64, i64 0, i64 3
  %66 = load i32, ptr %65, align 4
  store i32 %66, ptr %8, align 4
  %67 = load ptr, ptr %2, align 8
  %68 = getelementptr inbounds [5 x i32], ptr %67, i64 0, i64 4
  %69 = load i32, ptr %68, align 4
  store i32 %69, ptr %9, align 4
  store i32 0, ptr %3, align 4
  br label %70

70:                                               ; preds = %104, %55
  %71 = load i32, ptr %3, align 4
  %72 = icmp slt i32 %71, 20
  br i1 %72, label %73, label %107

73:                                               ; preds = %70
  %74 = load i32, ptr %5, align 4
  %75 = shl i32 %74, 5
  %76 = lshr i32 %74, 27
  %77 = or i32 %75, %76
  %78 = load i32, ptr %6, align 4
  %79 = load i32, ptr %7, align 4
  %80 = and i32 %78, %79
  %81 = xor i32 %78, -1
  %82 = load i32, ptr %8, align 4
  %83 = and i32 %81, %82
  %84 = or i32 %80, %83
  %85 = add i32 %77, %84
  %86 = load i32, ptr %9, align 4
  %87 = add i32 %85, %86
  %88 = load i32, ptr %3, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [80 x i32], ptr %10, i64 0, i64 %89
  %91 = load i32, ptr %90, align 4
  %92 = add i32 %87, %91
  %93 = zext i32 %92 to i64
  %94 = add nsw i64 %93, 1518500249
  %95 = trunc i64 %94 to i32
  store i32 %95, ptr %4, align 4
  %96 = load i32, ptr %8, align 4
  store i32 %96, ptr %9, align 4
  %97 = load i32, ptr %7, align 4
  store i32 %97, ptr %8, align 4
  %98 = load i32, ptr %6, align 4
  %99 = shl i32 %98, 30
  %100 = lshr i32 %98, 2
  %101 = or i32 %99, %100
  store i32 %101, ptr %7, align 4
  %102 = load i32, ptr %5, align 4
  store i32 %102, ptr %6, align 4
  %103 = load i32, ptr %4, align 4
  store i32 %103, ptr %5, align 4
  br label %104

104:                                              ; preds = %73
  %105 = load i32, ptr %3, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %3, align 4
  br label %70

107:                                              ; preds = %70
  store i32 20, ptr %3, align 4
  br label %108

108:                                              ; preds = %140, %107
  %109 = load i32, ptr %3, align 4
  %110 = icmp slt i32 %109, 40
  br i1 %110, label %111, label %143

111:                                              ; preds = %108
  %112 = load i32, ptr %5, align 4
  %113 = shl i32 %112, 5
  %114 = lshr i32 %112, 27
  %115 = or i32 %113, %114
  %116 = load i32, ptr %6, align 4
  %117 = load i32, ptr %7, align 4
  %118 = xor i32 %116, %117
  %119 = load i32, ptr %8, align 4
  %120 = xor i32 %118, %119
  %121 = add i32 %115, %120
  %122 = load i32, ptr %9, align 4
  %123 = add i32 %121, %122
  %124 = load i32, ptr %3, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [80 x i32], ptr %10, i64 0, i64 %125
  %127 = load i32, ptr %126, align 4
  %128 = add i32 %123, %127
  %129 = zext i32 %128 to i64
  %130 = add nsw i64 %129, 1859775393
  %131 = trunc i64 %130 to i32
  store i32 %131, ptr %4, align 4
  %132 = load i32, ptr %8, align 4
  store i32 %132, ptr %9, align 4
  %133 = load i32, ptr %7, align 4
  store i32 %133, ptr %8, align 4
  %134 = load i32, ptr %6, align 4
  %135 = shl i32 %134, 30
  %136 = lshr i32 %134, 2
  %137 = or i32 %135, %136
  store i32 %137, ptr %7, align 4
  %138 = load i32, ptr %5, align 4
  store i32 %138, ptr %6, align 4
  %139 = load i32, ptr %4, align 4
  store i32 %139, ptr %5, align 4
  br label %140

140:                                              ; preds = %111
  %141 = load i32, ptr %3, align 4
  %142 = add nsw i32 %141, 1
  store i32 %142, ptr %3, align 4
  br label %108

143:                                              ; preds = %108
  store i32 40, ptr %3, align 4
  br label %144

144:                                              ; preds = %179, %143
  %145 = load i32, ptr %3, align 4
  %146 = icmp slt i32 %145, 60
  br i1 %146, label %147, label %182

147:                                              ; preds = %144
  %148 = load i32, ptr %5, align 4
  %149 = shl i32 %148, 5
  %150 = lshr i32 %148, 27
  %151 = or i32 %149, %150
  %152 = load i32, ptr %6, align 4
  %153 = load i32, ptr %7, align 4
  %154 = and i32 %152, %153
  %155 = load i32, ptr %8, align 4
  %156 = and i32 %152, %155
  %157 = or i32 %154, %156
  %158 = and i32 %153, %155
  %159 = or i32 %157, %158
  %160 = add i32 %151, %159
  %161 = load i32, ptr %9, align 4
  %162 = add i32 %160, %161
  %163 = load i32, ptr %3, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [80 x i32], ptr %10, i64 0, i64 %164
  %166 = load i32, ptr %165, align 4
  %167 = add i32 %162, %166
  %168 = zext i32 %167 to i64
  %169 = add nsw i64 %168, 2400959708
  %170 = trunc i64 %169 to i32
  store i32 %170, ptr %4, align 4
  %171 = load i32, ptr %8, align 4
  store i32 %171, ptr %9, align 4
  %172 = load i32, ptr %7, align 4
  store i32 %172, ptr %8, align 4
  %173 = load i32, ptr %6, align 4
  %174 = shl i32 %173, 30
  %175 = lshr i32 %173, 2
  %176 = or i32 %174, %175
  store i32 %176, ptr %7, align 4
  %177 = load i32, ptr %5, align 4
  store i32 %177, ptr %6, align 4
  %178 = load i32, ptr %4, align 4
  store i32 %178, ptr %5, align 4
  br label %179

179:                                              ; preds = %147
  %180 = load i32, ptr %3, align 4
  %181 = add nsw i32 %180, 1
  store i32 %181, ptr %3, align 4
  br label %144

182:                                              ; preds = %144
  store i32 60, ptr %3, align 4
  br label %183

183:                                              ; preds = %215, %182
  %184 = load i32, ptr %3, align 4
  %185 = icmp slt i32 %184, 80
  br i1 %185, label %186, label %218

186:                                              ; preds = %183
  %187 = load i32, ptr %5, align 4
  %188 = shl i32 %187, 5
  %189 = lshr i32 %187, 27
  %190 = or i32 %188, %189
  %191 = load i32, ptr %6, align 4
  %192 = load i32, ptr %7, align 4
  %193 = xor i32 %191, %192
  %194 = load i32, ptr %8, align 4
  %195 = xor i32 %193, %194
  %196 = add i32 %190, %195
  %197 = load i32, ptr %9, align 4
  %198 = add i32 %196, %197
  %199 = load i32, ptr %3, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [80 x i32], ptr %10, i64 0, i64 %200
  %202 = load i32, ptr %201, align 4
  %203 = add i32 %198, %202
  %204 = zext i32 %203 to i64
  %205 = add nsw i64 %204, 3395469782
  %206 = trunc i64 %205 to i32
  store i32 %206, ptr %4, align 4
  %207 = load i32, ptr %8, align 4
  store i32 %207, ptr %9, align 4
  %208 = load i32, ptr %7, align 4
  store i32 %208, ptr %8, align 4
  %209 = load i32, ptr %6, align 4
  %210 = shl i32 %209, 30
  %211 = lshr i32 %209, 2
  %212 = or i32 %210, %211
  store i32 %212, ptr %7, align 4
  %213 = load i32, ptr %5, align 4
  store i32 %213, ptr %6, align 4
  %214 = load i32, ptr %4, align 4
  store i32 %214, ptr %5, align 4
  br label %215

215:                                              ; preds = %186
  %216 = load i32, ptr %3, align 4
  %217 = add nsw i32 %216, 1
  store i32 %217, ptr %3, align 4
  br label %183

218:                                              ; preds = %183
  %219 = load i32, ptr %5, align 4
  %220 = load ptr, ptr %2, align 8
  %221 = load i32, ptr %220, align 4
  %222 = add i32 %221, %219
  store i32 %222, ptr %220, align 4
  %223 = load i32, ptr %6, align 4
  %224 = load ptr, ptr %2, align 8
  %225 = getelementptr inbounds [5 x i32], ptr %224, i64 0, i64 1
  %226 = load i32, ptr %225, align 4
  %227 = add i32 %226, %223
  store i32 %227, ptr %225, align 4
  %228 = load i32, ptr %7, align 4
  %229 = load ptr, ptr %2, align 8
  %230 = getelementptr inbounds [5 x i32], ptr %229, i64 0, i64 2
  %231 = load i32, ptr %230, align 4
  %232 = add i32 %231, %228
  store i32 %232, ptr %230, align 4
  %233 = load i32, ptr %8, align 4
  %234 = load ptr, ptr %2, align 8
  %235 = getelementptr inbounds [5 x i32], ptr %234, i64 0, i64 3
  %236 = load i32, ptr %235, align 4
  %237 = add i32 %236, %233
  store i32 %237, ptr %235, align 4
  %238 = load i32, ptr %9, align 4
  %239 = load ptr, ptr %2, align 8
  %240 = getelementptr inbounds [5 x i32], ptr %239, i64 0, i64 4
  %241 = load i32, ptr %240, align 4
  %242 = add i32 %241, %238
  store i32 %242, ptr %240, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @sha_final(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %6 = getelementptr inbounds %struct.SHA_INFO, ptr %0, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  store i32 %7, ptr %4, align 4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.SHA_INFO, ptr %8, i32 0, i32 2
  %10 = load i32, ptr %9, align 4
  store i32 %10, ptr %5, align 4
  %11 = load i32, ptr %4, align 4
  %12 = lshr i32 %11, 3
  %13 = and i32 %12, 63
  store i32 %13, ptr %3, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.SHA_INFO, ptr %14, i32 0, i32 3
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, ptr %3, align 4
  %18 = sext i32 %16 to i64
  %19 = getelementptr inbounds i8, ptr %15, i64 %18
  store i8 -128, ptr %19, align 1
  %20 = load i32, ptr %3, align 4
  %21 = icmp sgt i32 %20, 56
  br i1 %21, label %22, label %35

22:                                               ; preds = %1
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.SHA_INFO, ptr %23, i32 0, i32 3
  %25 = load i32, ptr %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, ptr %24, i64 %26
  %28 = sub nsw i32 64, %25
  %29 = sext i32 %28 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %27, i8 0, i64 %29, i1 false)
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds %struct.SHA_INFO, ptr %30, i32 0, i32 3
  call void @byte_reverse(ptr noundef %31, i32 noundef 64)
  %32 = load ptr, ptr %2, align 8
  call void @sha_transform(ptr noundef %32)
  %33 = load ptr, ptr %2, align 8
  %34 = getelementptr inbounds %struct.SHA_INFO, ptr %33, i32 0, i32 3
  call void @llvm.memset.p0.i64(ptr align 4 %34, i8 0, i64 56, i1 false)
  br label %43

35:                                               ; preds = %1
  %36 = load ptr, ptr %2, align 8
  %37 = getelementptr inbounds %struct.SHA_INFO, ptr %36, i32 0, i32 3
  %38 = load i32, ptr %3, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, ptr %37, i64 %39
  %41 = sub nsw i32 56, %38
  %42 = sext i32 %41 to i64
  call void @llvm.memset.p0.i64(ptr align 1 %40, i8 0, i64 %42, i1 false)
  br label %43

43:                                               ; preds = %35, %22
  %44 = load ptr, ptr %2, align 8
  %45 = getelementptr inbounds %struct.SHA_INFO, ptr %44, i32 0, i32 3
  call void @byte_reverse(ptr noundef %45, i32 noundef 64)
  %46 = load i32, ptr %5, align 4
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds %struct.SHA_INFO, ptr %47, i32 0, i32 3
  %49 = getelementptr inbounds [16 x i32], ptr %48, i64 0, i64 14
  store i32 %46, ptr %49, align 4
  %50 = load i32, ptr %4, align 4
  %51 = load ptr, ptr %2, align 8
  %52 = getelementptr inbounds %struct.SHA_INFO, ptr %51, i32 0, i32 3
  %53 = getelementptr inbounds [16 x i32], ptr %52, i64 0, i64 15
  store i32 %50, ptr %53, align 4
  %54 = load ptr, ptr %2, align 8
  call void @sha_transform(ptr noundef %54)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @sha_stream(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca [8192 x i8], align 16
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  call void @sha_init(ptr noundef %7)
  br label %8

8:                                                ; preds = %13, %2
  %9 = load ptr, ptr %4, align 8
  %10 = call i64 @fread(ptr noundef %6, i64 noundef 1, i64 noundef 8192, ptr noundef %9)
  %11 = trunc i64 %10 to i32
  store i32 %11, ptr %5, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %16

13:                                               ; preds = %8
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %5, align 4
  call void @sha_update(ptr noundef %14, ptr noundef %6, i32 noundef %15)
  br label %8

16:                                               ; preds = %8
  %17 = load ptr, ptr %3, align 8
  call void @sha_final(ptr noundef %17)
  ret void
}

declare i64 @fread(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @sha_print(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load i32, ptr %0, align 4
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 1
  %6 = load i32, ptr %5, align 4
  %7 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 2
  %8 = load i32, ptr %7, align 4
  %9 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 3
  %10 = load i32, ptr %9, align 4
  %11 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 4
  %12 = load i32, ptr %11, align 4
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %3, i32 noundef %6, i32 noundef %8, i32 noundef %10, i32 noundef %12)
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
