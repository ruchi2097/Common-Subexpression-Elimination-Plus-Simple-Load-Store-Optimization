; ModuleID = 'adpcm-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.adpcm_state = type { i16, i8 }

@stepsizeTable = internal global [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 16
@indexTable = internal global [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 16
@abuf = dso_local global [500 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [11 x i8] c"input file\00", align 1
@sbuf = dso_local global [1000 x i16] zeroinitializer, align 16
@state = dso_local global %struct.adpcm_state zeroinitializer, align 2
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [28 x i8] c"Final valprev=%d, index=%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @adpcm_coder(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr %3, ptr %8, align 8
  %21 = load ptr, ptr %6, align 8
  store ptr %21, ptr %10, align 8
  %22 = load ptr, ptr %5, align 8
  store ptr %22, ptr %9, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = load i16, ptr %23, align 2
  %25 = sext i16 %24 to i32
  store i32 %25, ptr %16, align 4
  %26 = load ptr, ptr %8, align 8
  %27 = getelementptr inbounds %struct.adpcm_state, ptr %26, i32 0, i32 1
  %28 = load i8, ptr %27, align 2
  %29 = sext i8 %28 to i32
  store i32 %29, ptr %18, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %30
  %32 = load i32, ptr %31, align 4
  store i32 %32, ptr %15, align 4
  store i32 1, ptr %20, align 4
  br label %33

33:                                               ; preds = %147, %4
  %34 = load i32, ptr %7, align 4
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %150

36:                                               ; preds = %33
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr inbounds i16, ptr %37, i32 1
  store ptr %38, ptr %9, align 8
  %39 = load i16, ptr %37, align 2
  %40 = sext i16 %39 to i32
  store i32 %40, ptr %11, align 4
  %41 = load i32, ptr %16, align 4
  %42 = sub nsw i32 %40, %41
  store i32 %42, ptr %14, align 4
  %43 = icmp slt i32 %42, 0
  %44 = select i1 %43, i32 8, i32 0
  store i32 %44, ptr %12, align 4
  br i1 %43, label %45, label %48

45:                                               ; preds = %36
  %46 = load i32, ptr %14, align 4
  %47 = sub nsw i32 0, %46
  store i32 %47, ptr %14, align 4
  br label %48

48:                                               ; preds = %45, %36
  store i32 0, ptr %13, align 4
  %49 = load i32, ptr %15, align 4
  %50 = ashr i32 %49, 3
  store i32 %50, ptr %17, align 4
  %51 = load i32, ptr %14, align 4
  %52 = load i32, ptr %15, align 4
  %53 = icmp sge i32 %51, %52
  br i1 %53, label %54, label %61

54:                                               ; preds = %48
  store i32 4, ptr %13, align 4
  %55 = load i32, ptr %15, align 4
  %56 = load i32, ptr %14, align 4
  %57 = sub nsw i32 %56, %55
  store i32 %57, ptr %14, align 4
  %58 = load i32, ptr %15, align 4
  %59 = load i32, ptr %17, align 4
  %60 = add nsw i32 %59, %58
  store i32 %60, ptr %17, align 4
  br label %61

61:                                               ; preds = %54, %48
  %62 = load i32, ptr %15, align 4
  %63 = ashr i32 %62, 1
  store i32 %63, ptr %15, align 4
  %64 = load i32, ptr %14, align 4
  %65 = load i32, ptr %15, align 4
  %66 = icmp sge i32 %64, %65
  br i1 %66, label %67, label %76

67:                                               ; preds = %61
  %68 = load i32, ptr %13, align 4
  %69 = or i32 %68, 2
  store i32 %69, ptr %13, align 4
  %70 = load i32, ptr %15, align 4
  %71 = load i32, ptr %14, align 4
  %72 = sub nsw i32 %71, %70
  store i32 %72, ptr %14, align 4
  %73 = load i32, ptr %15, align 4
  %74 = load i32, ptr %17, align 4
  %75 = add nsw i32 %74, %73
  store i32 %75, ptr %17, align 4
  br label %76

76:                                               ; preds = %67, %61
  %77 = load i32, ptr %15, align 4
  %78 = ashr i32 %77, 1
  store i32 %78, ptr %15, align 4
  %79 = load i32, ptr %14, align 4
  %80 = load i32, ptr %15, align 4
  %81 = icmp sge i32 %79, %80
  br i1 %81, label %82, label %88

82:                                               ; preds = %76
  %83 = load i32, ptr %13, align 4
  %84 = or i32 %83, 1
  store i32 %84, ptr %13, align 4
  %85 = load i32, ptr %15, align 4
  %86 = load i32, ptr %17, align 4
  %87 = add nsw i32 %86, %85
  store i32 %87, ptr %17, align 4
  br label %88

88:                                               ; preds = %82, %76
  %89 = load i32, ptr %12, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %95

91:                                               ; preds = %88
  %92 = load i32, ptr %17, align 4
  %93 = load i32, ptr %16, align 4
  %94 = sub nsw i32 %93, %92
  store i32 %94, ptr %16, align 4
  br label %99

95:                                               ; preds = %88
  %96 = load i32, ptr %17, align 4
  %97 = load i32, ptr %16, align 4
  %98 = add nsw i32 %97, %96
  store i32 %98, ptr %16, align 4
  br label %99

99:                                               ; preds = %95, %91
  %100 = load i32, ptr %16, align 4
  %101 = icmp sgt i32 %100, 32767
  br i1 %101, label %102, label %103

102:                                              ; preds = %99
  store i32 32767, ptr %16, align 4
  br label %108

103:                                              ; preds = %99
  %104 = load i32, ptr %16, align 4
  %105 = icmp slt i32 %104, -32768
  br i1 %105, label %106, label %107

106:                                              ; preds = %103
  store i32 -32768, ptr %16, align 4
  br label %107

107:                                              ; preds = %106, %103
  br label %108

108:                                              ; preds = %107, %102
  %109 = load i32, ptr %12, align 4
  %110 = load i32, ptr %13, align 4
  %111 = or i32 %110, %109
  store i32 %111, ptr %13, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [16 x i32], ptr @indexTable, i64 0, i64 %112
  %114 = load i32, ptr %113, align 4
  %115 = load i32, ptr %18, align 4
  %116 = add nsw i32 %115, %114
  store i32 %116, ptr %18, align 4
  %117 = icmp slt i32 %116, 0
  br i1 %117, label %118, label %119

118:                                              ; preds = %108
  store i32 0, ptr %18, align 4
  br label %119

119:                                              ; preds = %118, %108
  %120 = load i32, ptr %18, align 4
  %121 = icmp sgt i32 %120, 88
  br i1 %121, label %122, label %123

122:                                              ; preds = %119
  store i32 88, ptr %18, align 4
  br label %123

123:                                              ; preds = %122, %119
  %124 = load i32, ptr %18, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %125
  %127 = load i32, ptr %126, align 4
  store i32 %127, ptr %15, align 4
  %128 = load i32, ptr %20, align 4
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %130, label %134

130:                                              ; preds = %123
  %131 = load i32, ptr %13, align 4
  %132 = shl i32 %131, 4
  %133 = and i32 %132, 240
  store i32 %133, ptr %19, align 4
  br label %142

134:                                              ; preds = %123
  %135 = load i32, ptr %13, align 4
  %136 = and i32 %135, 15
  %137 = load i32, ptr %19, align 4
  %138 = or i32 %136, %137
  %139 = trunc i32 %138 to i8
  %140 = load ptr, ptr %10, align 8
  %141 = getelementptr inbounds i8, ptr %140, i32 1
  store ptr %141, ptr %10, align 8
  store i8 %139, ptr %140, align 1
  br label %142

142:                                              ; preds = %134, %130
  %143 = load i32, ptr %20, align 4
  %144 = icmp ne i32 %143, 0
  %145 = xor i1 %144, true
  %146 = zext i1 %145 to i32
  store i32 %146, ptr %20, align 4
  br label %147

147:                                              ; preds = %142
  %148 = load i32, ptr %7, align 4
  %149 = add nsw i32 %148, -1
  store i32 %149, ptr %7, align 4
  br label %33

150:                                              ; preds = %33
  %151 = load i32, ptr %20, align 4
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %158, label %153

153:                                              ; preds = %150
  %154 = load i32, ptr %19, align 4
  %155 = trunc i32 %154 to i8
  %156 = load ptr, ptr %10, align 8
  %157 = getelementptr inbounds i8, ptr %156, i32 1
  store ptr %157, ptr %10, align 8
  store i8 %155, ptr %156, align 1
  br label %158

158:                                              ; preds = %153, %150
  %159 = load i32, ptr %16, align 4
  %160 = trunc i32 %159 to i16
  %161 = load ptr, ptr %8, align 8
  store i16 %160, ptr %161, align 2
  %162 = load i32, ptr %18, align 4
  %163 = trunc i32 %162 to i8
  %164 = load ptr, ptr %8, align 8
  %165 = getelementptr inbounds %struct.adpcm_state, ptr %164, i32 0, i32 1
  store i8 %163, ptr %165, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @adpcm_decoder(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr %3, ptr %8, align 8
  %19 = load ptr, ptr %6, align 8
  store ptr %19, ptr %10, align 8
  %20 = load ptr, ptr %5, align 8
  store ptr %20, ptr %9, align 8
  %21 = load ptr, ptr %8, align 8
  %22 = load i16, ptr %21, align 2
  %23 = sext i16 %22 to i32
  store i32 %23, ptr %14, align 4
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr inbounds %struct.adpcm_state, ptr %24, i32 0, i32 1
  %26 = load i8, ptr %25, align 2
  %27 = sext i8 %26 to i32
  store i32 %27, ptr %16, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %28
  %30 = load i32, ptr %29, align 4
  store i32 %30, ptr %13, align 4
  store i32 0, ptr %18, align 4
  br label %31

31:                                               ; preds = %125, %4
  %32 = load i32, ptr %7, align 4
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %128

34:                                               ; preds = %31
  %35 = load i32, ptr %18, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %40

37:                                               ; preds = %34
  %38 = load i32, ptr %17, align 4
  %39 = and i32 %38, 15
  store i32 %39, ptr %12, align 4
  br label %47

40:                                               ; preds = %34
  %41 = load ptr, ptr %9, align 8
  %42 = getelementptr inbounds i8, ptr %41, i32 1
  store ptr %42, ptr %9, align 8
  %43 = load i8, ptr %41, align 1
  %44 = sext i8 %43 to i32
  store i32 %44, ptr %17, align 4
  %45 = ashr i32 %44, 4
  %46 = and i32 %45, 15
  store i32 %46, ptr %12, align 4
  br label %47

47:                                               ; preds = %40, %37
  %48 = load i32, ptr %18, align 4
  %49 = icmp ne i32 %48, 0
  %50 = xor i1 %49, true
  %51 = zext i1 %50 to i32
  store i32 %51, ptr %18, align 4
  %52 = load i32, ptr %12, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [16 x i32], ptr @indexTable, i64 0, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = load i32, ptr %16, align 4
  %57 = add nsw i32 %56, %55
  store i32 %57, ptr %16, align 4
  %58 = icmp slt i32 %57, 0
  br i1 %58, label %59, label %60

59:                                               ; preds = %47
  store i32 0, ptr %16, align 4
  br label %60

60:                                               ; preds = %59, %47
  %61 = load i32, ptr %16, align 4
  %62 = icmp sgt i32 %61, 88
  br i1 %62, label %63, label %64

63:                                               ; preds = %60
  store i32 88, ptr %16, align 4
  br label %64

64:                                               ; preds = %63, %60
  %65 = load i32, ptr %12, align 4
  %66 = and i32 %65, 8
  store i32 %66, ptr %11, align 4
  %67 = load i32, ptr %12, align 4
  %68 = and i32 %67, 7
  store i32 %68, ptr %12, align 4
  %69 = load i32, ptr %13, align 4
  %70 = ashr i32 %69, 3
  store i32 %70, ptr %15, align 4
  %71 = load i32, ptr %12, align 4
  %72 = and i32 %71, 4
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %78

74:                                               ; preds = %64
  %75 = load i32, ptr %13, align 4
  %76 = load i32, ptr %15, align 4
  %77 = add nsw i32 %76, %75
  store i32 %77, ptr %15, align 4
  br label %78

78:                                               ; preds = %74, %64
  %79 = load i32, ptr %12, align 4
  %80 = and i32 %79, 2
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %82, label %87

82:                                               ; preds = %78
  %83 = load i32, ptr %13, align 4
  %84 = ashr i32 %83, 1
  %85 = load i32, ptr %15, align 4
  %86 = add nsw i32 %85, %84
  store i32 %86, ptr %15, align 4
  br label %87

87:                                               ; preds = %82, %78
  %88 = load i32, ptr %12, align 4
  %89 = and i32 %88, 1
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %96

91:                                               ; preds = %87
  %92 = load i32, ptr %13, align 4
  %93 = ashr i32 %92, 2
  %94 = load i32, ptr %15, align 4
  %95 = add nsw i32 %94, %93
  store i32 %95, ptr %15, align 4
  br label %96

96:                                               ; preds = %91, %87
  %97 = load i32, ptr %11, align 4
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %99, label %103

99:                                               ; preds = %96
  %100 = load i32, ptr %15, align 4
  %101 = load i32, ptr %14, align 4
  %102 = sub nsw i32 %101, %100
  store i32 %102, ptr %14, align 4
  br label %107

103:                                              ; preds = %96
  %104 = load i32, ptr %15, align 4
  %105 = load i32, ptr %14, align 4
  %106 = add nsw i32 %105, %104
  store i32 %106, ptr %14, align 4
  br label %107

107:                                              ; preds = %103, %99
  %108 = load i32, ptr %14, align 4
  %109 = icmp sgt i32 %108, 32767
  br i1 %109, label %110, label %111

110:                                              ; preds = %107
  store i32 32767, ptr %14, align 4
  br label %116

111:                                              ; preds = %107
  %112 = load i32, ptr %14, align 4
  %113 = icmp slt i32 %112, -32768
  br i1 %113, label %114, label %115

114:                                              ; preds = %111
  store i32 -32768, ptr %14, align 4
  br label %115

115:                                              ; preds = %114, %111
  br label %116

116:                                              ; preds = %115, %110
  %117 = load i32, ptr %16, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [89 x i32], ptr @stepsizeTable, i64 0, i64 %118
  %120 = load i32, ptr %119, align 4
  store i32 %120, ptr %13, align 4
  %121 = load i32, ptr %14, align 4
  %122 = trunc i32 %121 to i16
  %123 = load ptr, ptr %10, align 8
  %124 = getelementptr inbounds i16, ptr %123, i32 1
  store ptr %124, ptr %10, align 8
  store i16 %122, ptr %123, align 2
  br label %125

125:                                              ; preds = %116
  %126 = load i32, ptr %7, align 4
  %127 = add nsw i32 %126, -1
  store i32 %127, ptr %7, align 4
  br label %31

128:                                              ; preds = %31
  %129 = load i32, ptr %14, align 4
  %130 = trunc i32 %129 to i16
  %131 = load ptr, ptr %8, align 8
  store i16 %130, ptr %131, align 2
  %132 = load i32, ptr %16, align 4
  %133 = trunc i32 %132 to i8
  %134 = load ptr, ptr %8, align 8
  %135 = getelementptr inbounds %struct.adpcm_state, ptr %134, i32 0, i32 1
  store i8 %133, ptr %135, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %3

3:                                                ; preds = %11, %0
  %4 = call i32 (i32, ptr, i32, ...) @read(i32 noundef 0, ptr noundef @abuf, i32 noundef 500)
  store i32 %4, ptr %2, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %3
  call void @perror(ptr noundef @.str) #4
  call void @exit(i32 noundef 1) #5
  unreachable

7:                                                ; preds = %3
  %8 = load i32, ptr %2, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  br label %17

11:                                               ; preds = %7
  %12 = load i32, ptr %2, align 4
  %13 = mul nsw i32 %12, 2
  call void @adpcm_decoder(ptr noundef @abuf, ptr noundef @sbuf, i32 noundef %13, ptr noundef @state)
  %14 = load i32, ptr %2, align 4
  %15 = mul nsw i32 %14, 4
  %16 = call i32 (i32, ptr, i32, ...) @write(i32 noundef 1, ptr noundef @sbuf, i32 noundef %15)
  br label %3

17:                                               ; preds = %10
  %18 = load ptr, ptr @stderr, align 8
  %19 = load i16, ptr @state, align 2
  %20 = sext i16 %19 to i32
  %21 = load i8, ptr getelementptr inbounds (%struct.adpcm_state, ptr @state, i32 0, i32 1), align 2
  %22 = sext i8 %21 to i32
  %23 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %18, ptr noundef @.str.1, i32 noundef %20, i32 noundef %22)
  call void @exit(i32 noundef 0) #5
  unreachable
}

declare i32 @read(...) #1

; Function Attrs: cold
declare void @perror(ptr noundef) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #3

declare i32 @write(...) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { cold }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
