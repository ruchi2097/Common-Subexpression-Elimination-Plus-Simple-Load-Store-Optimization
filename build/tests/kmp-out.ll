; ModuleID = 'kmp-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.rndmill = type { i64, i64, i64 }

@next = dso_local global ptr null, align 8
@.str = private unnamed_addr constant [29 x i8] c"Usage:\0A\09%s <ref|train|test>\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"ref\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"KMP with reference input set\0A\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"train\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"KMP with test input set\0A\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"test\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"Invalid data set use ref or train or test\0A\00", align 1
@buffer = dso_local global ptr null, align 8
@stderr = external global ptr, align 8
@.str.7 = private unnamed_addr constant [19 x i8] c"Not enough memory\0A\00", align 1
@pat = dso_local global ptr null, align 8
@.str.8 = private unnamed_addr constant [20 x i8] c"Benchmark begin...\0A\00", align 1
@.str.9 = private unnamed_addr constant [13 x i8] c"%2d Pattern:\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.11 = private unnamed_addr constant [18 x i8] c": found %d times\0A\00", align 1
@.str.12 = private unnamed_addr constant [21 x i8] c"Benchmark finish...\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @preprocpat(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  %7 = load ptr, ptr %4, align 8
  store i32 -1, ptr %7, align 4
  store i32 -1, ptr %6, align 4
  br label %8

8:                                                ; preds = %62, %2
  %9 = load i32, ptr %6, align 4
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %24, label %11

11:                                               ; preds = %8
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8, ptr %12, i64 %14
  %16 = load i8, ptr %15, align 1
  %17 = sext i8 %16 to i32
  %18 = load i32, ptr %6, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, ptr %12, i64 %19
  %21 = load i8, ptr %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %17, %22
  br i1 %23, label %24, label %55

24:                                               ; preds = %11, %8
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %5, align 4
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %6, align 4
  %29 = load ptr, ptr %3, align 8
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, ptr %29, i64 %31
  %33 = load i8, ptr %32, align 1
  %34 = sext i8 %33 to i32
  %35 = load i32, ptr %5, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, ptr %29, i64 %36
  %38 = load i8, ptr %37, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp eq i32 %34, %39
  br i1 %40, label %41, label %47

41:                                               ; preds = %24
  %42 = load ptr, ptr %4, align 8
  %43 = load i32, ptr %6, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %42, i64 %44
  %46 = load i32, ptr %45, align 4
  br label %49

47:                                               ; preds = %24
  %48 = load i32, ptr %6, align 4
  br label %49

49:                                               ; preds = %47, %41
  %50 = phi i32 [ %46, %41 ], [ %48, %47 ]
  %51 = load ptr, ptr %4, align 8
  %52 = load i32, ptr %5, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, ptr %51, i64 %53
  store i32 %50, ptr %54, align 4
  br label %61

55:                                               ; preds = %11
  %56 = load ptr, ptr %4, align 8
  %57 = load i32, ptr %6, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i32, ptr %56, i64 %58
  %60 = load i32, ptr %59, align 4
  store i32 %60, ptr %6, align 4
  br label %61

61:                                               ; preds = %55, %49
  br label %62

62:                                               ; preds = %61
  %63 = load ptr, ptr %3, align 8
  %64 = load i32, ptr %5, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, ptr %63, i64 %65
  %67 = load i8, ptr %66, align 1
  %68 = sext i8 %67 to i32
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %8, label %70

70:                                               ; preds = %62
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @search(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i8, ptr %7, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %2
  %12 = load ptr, ptr %5, align 8
  store ptr %12, ptr %3, align 8
  br label %62

13:                                               ; preds = %2
  %14 = load ptr, ptr %4, align 8
  %15 = load ptr, ptr @next, align 8
  call void @preprocpat(ptr noundef %14, ptr noundef %15)
  store i32 0, ptr %6, align 4
  br label %16

16:                                               ; preds = %60, %13
  %17 = load ptr, ptr %5, align 8
  %18 = load i8, ptr %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %61

21:                                               ; preds = %16
  %22 = load i32, ptr %6, align 4
  %23 = icmp eq i32 %22, -1
  br i1 %23, label %35, label %24

24:                                               ; preds = %21
  %25 = load ptr, ptr %4, align 8
  %26 = load i32, ptr %6, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, ptr %25, i64 %27
  %29 = load i8, ptr %28, align 1
  %30 = sext i8 %29 to i32
  %31 = load ptr, ptr %5, align 8
  %32 = load i8, ptr %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp eq i32 %30, %33
  br i1 %34, label %35, label %54

35:                                               ; preds = %24, %21
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds i8, ptr %36, i32 1
  store ptr %37, ptr %5, align 8
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %6, align 4
  %40 = load ptr, ptr %4, align 8
  %41 = load i32, ptr %6, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, ptr %40, i64 %42
  %44 = load i8, ptr %43, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %53

47:                                               ; preds = %35
  %48 = load ptr, ptr %5, align 8
  %49 = load i32, ptr %6, align 4
  %50 = sext i32 %49 to i64
  %51 = sub i64 0, %50
  %52 = getelementptr inbounds i8, ptr %48, i64 %51
  store ptr %52, ptr %3, align 8
  br label %62

53:                                               ; preds = %35
  br label %60

54:                                               ; preds = %24
  %55 = load ptr, ptr @next, align 8
  %56 = load i32, ptr %6, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, ptr %55, i64 %57
  %59 = load i32, ptr %58, align 4
  store i32 %59, ptr %6, align 4
  br label %60

60:                                               ; preds = %54, %53
  br label %16

61:                                               ; preds = %16
  store ptr null, ptr %3, align 8
  br label %62

62:                                               ; preds = %61, %47, %11
  %63 = load ptr, ptr %3, align 8
  ret ptr %63
}

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
  %12 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %13, 2
  br i1 %14, label %15, label %19

15:                                               ; preds = %2
  %16 = load ptr, ptr %5, align 8
  %17 = load ptr, ptr %16, align 8
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %17)
  call void @exit(i32 noundef 0) #6
  unreachable

19:                                               ; preds = %2
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds ptr, ptr %20, i64 1
  %22 = load ptr, ptr %21, align 8
  %23 = call i32 @strcasecmp(ptr noundef %22, ptr noundef @.str.1) #7
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %19
  store i32 524305, ptr %9, align 4
  store i32 6, ptr %8, align 4
  %26 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %47

27:                                               ; preds = %19
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds ptr, ptr %28, i64 1
  %30 = load ptr, ptr %29, align 8
  %31 = call i32 @strcasecmp(ptr noundef %30, ptr noundef @.str.3) #7
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %35

33:                                               ; preds = %27
  store i32 98321, ptr %9, align 4
  store i32 5, ptr %8, align 4
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %46

35:                                               ; preds = %27
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds ptr, ptr %36, i64 1
  %38 = load ptr, ptr %37, align 8
  %39 = call i32 @strcasecmp(ptr noundef %38, ptr noundef @.str.5) #7
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %43

41:                                               ; preds = %35
  store i32 32785, ptr %9, align 4
  store i32 4, ptr %8, align 4
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %45

43:                                               ; preds = %35
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  call void @exit(i32 noundef -1) #6
  unreachable

45:                                               ; preds = %41
  br label %46

46:                                               ; preds = %45, %33
  br label %47

47:                                               ; preds = %46, %25
  %48 = load i32, ptr %9, align 4
  %49 = sext i32 %48 to i64
  %50 = call noalias ptr @malloc(i64 noundef %49) #8
  store ptr %50, ptr @buffer, align 8
  %51 = icmp ne ptr %50, null
  br i1 %51, label %55, label %52

52:                                               ; preds = %47
  %53 = load ptr, ptr @stderr, align 8
  %54 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %53, ptr noundef @.str.7)
  call void @exit(i32 noundef 0) #6
  unreachable

55:                                               ; preds = %47
  %56 = call ptr @init_mill(i64 noundef 63009, i64 noundef 12584, i64 noundef 33363)
  store ptr %56, ptr %10, align 8
  %57 = load i32, ptr %8, align 4
  %58 = add nsw i32 %57, 1
  %59 = sext i32 %58 to i64
  %60 = call noalias ptr @malloc(i64 noundef %59) #8
  store ptr %60, ptr @pat, align 8
  %61 = load i32, ptr %8, align 4
  %62 = sext i32 %61 to i64
  %63 = mul i64 4, %62
  %64 = call noalias ptr @malloc(i64 noundef %63) #8
  store ptr %64, ptr @next, align 8
  %65 = load ptr, ptr @pat, align 8
  %66 = icmp ne ptr %65, null
  br i1 %66, label %67, label %70

67:                                               ; preds = %55
  %68 = load ptr, ptr @next, align 8
  %69 = icmp ne ptr %68, null
  br i1 %69, label %73, label %70

70:                                               ; preds = %67, %55
  %71 = load ptr, ptr @stderr, align 8
  %72 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %71, ptr noundef @.str.7)
  call void @exit(i32 noundef 0) #6
  unreachable

73:                                               ; preds = %67
  %74 = load ptr, ptr @stderr, align 8
  %75 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %74, ptr noundef @.str.8)
  store i32 0, ptr %6, align 4
  br label %76

76:                                               ; preds = %90, %73
  %77 = load i32, ptr %6, align 4
  %78 = load i32, ptr %9, align 4
  %79 = icmp slt i32 %77, %78
  br i1 %79, label %80, label %93

80:                                               ; preds = %76
  %81 = load ptr, ptr %10, align 8
  %82 = call i64 @rndnum(ptr noundef %81)
  %83 = urem i64 %82, 7
  %84 = add i64 %83, 97
  %85 = trunc i64 %84 to i8
  %86 = load ptr, ptr @buffer, align 8
  %87 = load i32, ptr %6, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i8, ptr %86, i64 %88
  store i8 %85, ptr %89, align 1
  br label %90

90:                                               ; preds = %80
  %91 = load i32, ptr %6, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %6, align 4
  br label %76

93:                                               ; preds = %76
  %94 = load ptr, ptr @buffer, align 8
  %95 = load i32, ptr %9, align 4
  %96 = sub nsw i32 %95, 1
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8, ptr %94, i64 %97
  store i8 0, ptr %98, align 1
  store i32 0, ptr %7, align 4
  br label %99

99:                                               ; preds = %180, %93
  %100 = load i32, ptr %7, align 4
  %101 = icmp slt i32 %100, 23
  br i1 %101, label %102, label %183

102:                                              ; preds = %99
  %103 = load i32, ptr %7, align 4
  %104 = add nsw i32 %103, 1
  %105 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %104)
  store i32 0, ptr %6, align 4
  br label %106

106:                                              ; preds = %127, %102
  %107 = load i32, ptr %6, align 4
  %108 = load i32, ptr %8, align 4
  %109 = icmp slt i32 %107, %108
  br i1 %109, label %110, label %130

110:                                              ; preds = %106
  %111 = load ptr, ptr %10, align 8
  %112 = call i64 @rndnum(ptr noundef %111)
  %113 = urem i64 %112, 7
  %114 = add i64 %113, 97
  %115 = trunc i64 %114 to i8
  %116 = load ptr, ptr @pat, align 8
  %117 = load i32, ptr %6, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i8, ptr %116, i64 %118
  store i8 %115, ptr %119, align 1
  %120 = load ptr, ptr @pat, align 8
  %121 = load i32, ptr %6, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i8, ptr %120, i64 %122
  %124 = load i8, ptr %123, align 1
  %125 = sext i8 %124 to i32
  %126 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %125)
  br label %127

127:                                              ; preds = %110
  %128 = load i32, ptr %6, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, ptr %6, align 4
  br label %106

130:                                              ; preds = %106
  %131 = load ptr, ptr @pat, align 8
  %132 = load i32, ptr %8, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i8, ptr %131, i64 %133
  store i8 0, ptr %134, align 1
  %135 = load ptr, ptr @buffer, align 8
  %136 = load i32, ptr %9, align 4
  %137 = mul nsw i32 3, %136
  %138 = load i32, ptr %7, align 4
  %139 = srem i32 %138, 3
  %140 = add nsw i32 %139, 3
  %141 = sdiv i32 %137, %140
  %142 = sub nsw i32 %141, 1
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i8, ptr %135, i64 %143
  store i8 0, ptr %144, align 1
  store i32 0, ptr %12, align 4
  %145 = load ptr, ptr @buffer, align 8
  %146 = load i32, ptr %9, align 4
  %147 = mul nsw i32 3, %146
  %148 = load i32, ptr %7, align 4
  %149 = srem i32 %148, 3
  %150 = add nsw i32 %149, 3
  %151 = sdiv i32 %147, %150
  %152 = sub nsw i32 %151, 1
  %153 = sdiv i32 %152, 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds i8, ptr %145, i64 %154
  store ptr %155, ptr %11, align 8
  br label %156

156:                                              ; preds = %162, %130
  %157 = load ptr, ptr @pat, align 8
  %158 = load ptr, ptr %11, align 8
  %159 = call ptr @search(ptr noundef %157, ptr noundef %158)
  store ptr %159, ptr %11, align 8
  %160 = icmp eq ptr %159, null
  br i1 %160, label %161, label %162

161:                                              ; preds = %156
  br label %167

162:                                              ; preds = %156
  %163 = load ptr, ptr %11, align 8
  %164 = getelementptr inbounds i8, ptr %163, i32 1
  store ptr %164, ptr %11, align 8
  %165 = load i32, ptr %12, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, ptr %12, align 4
  br label %156

167:                                              ; preds = %161
  %168 = load i32, ptr %12, align 4
  %169 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %168)
  %170 = load ptr, ptr @buffer, align 8
  %171 = load i32, ptr %9, align 4
  %172 = mul nsw i32 3, %171
  %173 = load i32, ptr %7, align 4
  %174 = srem i32 %173, 3
  %175 = add nsw i32 %174, 3
  %176 = sdiv i32 %172, %175
  %177 = sub nsw i32 %176, 1
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i8, ptr %170, i64 %178
  store i8 97, ptr %179, align 1
  br label %180

180:                                              ; preds = %167
  %181 = load i32, ptr %7, align 4
  %182 = add nsw i32 %181, 1
  store i32 %182, ptr %7, align 4
  br label %99

183:                                              ; preds = %99
  %184 = call i32 (ptr, ...) @printf(ptr noundef @.str.12)
  %185 = load ptr, ptr %10, align 8
  call void @nuke_mill(ptr noundef %185)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcasecmp(ptr noundef, ptr noundef) #3

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #4

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @init_mill(i64 noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  store i64 %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %8 = call noalias ptr @malloc(i64 noundef 24) #8
  store ptr %8, ptr %7, align 8
  %9 = load i64, ptr %4, align 8
  %10 = load ptr, ptr %7, align 8
  store i64 %9, ptr %10, align 8
  %11 = load i64, ptr %5, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = getelementptr inbounds %struct.rndmill, ptr %12, i32 0, i32 1
  store i64 %11, ptr %13, align 8
  %14 = load i64, ptr %6, align 8
  %15 = load ptr, ptr %7, align 8
  %16 = getelementptr inbounds %struct.rndmill, ptr %15, i32 0, i32 2
  store i64 %14, ptr %16, align 8
  %17 = load ptr, ptr %7, align 8
  ret ptr %17
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @nuke_mill(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @free(ptr noundef %0) #9
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @rndnum(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i64 0, ptr %3, align 8
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %67, %1
  %7 = load i32, ptr %5, align 4
  %8 = icmp slt i32 %7, 32
  br i1 %8, label %9, label %70

9:                                                ; preds = %6
  %10 = load ptr, ptr %2, align 8
  %11 = load i64, ptr %10, align 8
  %12 = lshr i64 %11, 31
  %13 = load i64, ptr %10, align 8
  %14 = lshr i64 %13, 6
  %15 = xor i64 %12, %14
  %16 = load i64, ptr %10, align 8
  %17 = lshr i64 %16, 4
  %18 = xor i64 %15, %17
  %19 = load i64, ptr %10, align 8
  %20 = lshr i64 %19, 2
  %21 = xor i64 %18, %20
  %22 = load i64, ptr %10, align 8
  %23 = shl i64 %22, 1
  %24 = xor i64 %21, %23
  %25 = load i64, ptr %10, align 8
  %26 = xor i64 %24, %25
  %27 = and i64 %26, 1
  %28 = shl i64 %27, 31
  %29 = load i64, ptr %10, align 8
  %30 = lshr i64 %29, 1
  %31 = or i64 %28, %30
  store i64 %31, ptr %10, align 8
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds %struct.rndmill, ptr %32, i32 0, i32 1
  %34 = load i64, ptr %33, align 8
  %35 = lshr i64 %34, 30
  %36 = lshr i64 %34, 2
  %37 = xor i64 %35, %36
  %38 = and i64 %37, 1
  %39 = shl i64 %38, 30
  %40 = lshr i64 %34, 1
  %41 = or i64 %39, %40
  store i64 %41, ptr %33, align 8
  %42 = load ptr, ptr %2, align 8
  %43 = getelementptr inbounds %struct.rndmill, ptr %42, i32 0, i32 2
  %44 = load i64, ptr %43, align 8
  %45 = lshr i64 %44, 28
  %46 = lshr i64 %44, 1
  %47 = xor i64 %45, %46
  %48 = and i64 %47, 1
  %49 = shl i64 %48, 28
  %50 = or i64 %49, %46
  store i64 %50, ptr %43, align 8
  %51 = load ptr, ptr %2, align 8
  %52 = load i64, ptr %51, align 8
  %53 = getelementptr inbounds %struct.rndmill, ptr %51, i32 0, i32 1
  %54 = load i64, ptr %53, align 8
  %55 = and i64 %52, %54
  %56 = load i64, ptr %51, align 8
  %57 = xor i64 %56, -1
  %58 = getelementptr inbounds %struct.rndmill, ptr %51, i32 0, i32 2
  %59 = load i64, ptr %58, align 8
  %60 = and i64 %57, %59
  %61 = or i64 %55, %60
  %62 = and i64 %61, 1
  store i64 %62, ptr %4, align 8
  %63 = load i64, ptr %3, align 8
  %64 = shl i64 %63, 1
  %65 = load i64, ptr %4, align 8
  %66 = xor i64 %64, %65
  store i64 %66, ptr %3, align 8
  br label %67

67:                                               ; preds = %9
  %68 = load i32, ptr %5, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %5, align 4
  br label %6

70:                                               ; preds = %6
  %71 = load i64, ptr %3, align 8
  ret i64 %71
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @checkpoint_mill(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load i64, ptr %0, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.rndmill, ptr %4, i32 0, i32 1
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds %struct.rndmill, ptr %4, i32 0, i32 2
  %8 = load i64, ptr %7, align 8
  %9 = call ptr @init_mill(i64 noundef %3, i64 noundef %6, i64 noundef %8)
  ret ptr %9
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @reset_mill(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load i64, ptr %1, align 8
  %6 = load ptr, ptr %3, align 8
  store i64 %5, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.rndmill, ptr %7, i32 0, i32 1
  %9 = load i64, ptr %8, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.rndmill, ptr %10, i32 0, i32 1
  store i64 %9, ptr %11, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.rndmill, ptr %12, i32 0, i32 2
  %14 = load i64, ptr %13, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.rndmill, ptr %15, i32 0, i32 2
  store i64 %14, ptr %16, align 8
  ret void
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind willreturn memory(read) }
attributes #8 = { nounwind allocsize(0) }
attributes #9 = { nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
