; ModuleID = 'bitcount-out.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.anon = type { i64 }
%struct.bfile = type { ptr, i8, i8, i8, i8 }

@bits = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@bits.1 = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@main.pBitCntFunc = internal global [7 x ptr] [ptr @bit_count, ptr @bitcount, ptr @ntbl_bitcnt, ptr @ntbl_bitcount, ptr @BW_btbl_bitcount, ptr @AR_btbl_bitcount, ptr @bit_shifter], align 16
@main.text = internal global [7 x ptr] [ptr @.str, ptr @.str.1, ptr @.str.2, ptr @.str.3, ptr @.str.4, ptr @.str.5, ptr @.str.6], align 16
@.str = private unnamed_addr constant [29 x i8] c"Optimized 1 bit/loop counter\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Ratko's mystery algorithm\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"Recursive bit count by nybbles\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"Non-recursive bit count by nybbles\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (BW)\00", align 1
@.str.5 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (AR)\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Shift and count bits\00", align 1
@stderr = external global ptr, align 8
@.str.7 = private unnamed_addr constant [29 x i8] c"Usage: bitcnts <iterations>\0A\00", align 1
@.str.8 = private unnamed_addr constant [33 x i8] c"Bit counter algorithm benchmark\0A\00", align 1
@.str.9 = private unnamed_addr constant [36 x i8] c"%-38s> Time: %7.3f sec.; Bits: %ld\0A\00", align 1
@.str.10 = private unnamed_addr constant [13 x i8] c"\0ABest  > %s\0A\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"Worst > %s\0A\00", align 1
@.str.12 = private unnamed_addr constant [3 x i8] c"01\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bit_count(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  %4 = load i64, ptr %2, align 8
  %5 = icmp ne i64 %4, 0
  br i1 %5, label %6, label %16

6:                                                ; preds = %1
  br label %7

7:                                                ; preds = %10, %6
  %8 = load i32, ptr %3, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, ptr %3, align 4
  br label %10

10:                                               ; preds = %7
  %11 = load i64, ptr %2, align 8
  %12 = sub nsw i64 %11, 1
  %13 = and i64 %11, %12
  store i64 %13, ptr %2, align 8
  %14 = icmp ne i64 0, %13
  br i1 %14, label %7, label %15

15:                                               ; preds = %10
  br label %16

16:                                               ; preds = %15, %1
  %17 = load i32, ptr %3, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bitcount(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = and i64 %0, 2863311530
  %4 = ashr i64 %3, 1
  %5 = and i64 %0, 1431655765
  %6 = add nsw i64 %4, %5
  %7 = and i64 %6, 3435973836
  %8 = ashr i64 %7, 2
  %9 = and i64 %6, 858993459
  %10 = add nsw i64 %8, %9
  %11 = and i64 %10, 4042322160
  %12 = ashr i64 %11, 4
  %13 = and i64 %10, 252645135
  %14 = add nsw i64 %12, %13
  %15 = and i64 %14, 4278255360
  %16 = ashr i64 %15, 8
  %17 = and i64 %14, 16711935
  %18 = add nsw i64 %16, %17
  %19 = and i64 %18, 4294901760
  %20 = ashr i64 %19, 16
  %21 = and i64 %18, 65535
  %22 = add nsw i64 %20, %21
  store i64 %22, ptr %2, align 8
  %23 = trunc i64 %22 to i32
  ret i32 %23
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ntbl_bitcount(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
  %3 = and i64 %0, 15
  %4 = trunc i64 %3 to i32
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %5
  %7 = load i8, ptr %6, align 1
  %8 = sext i8 %7 to i32
  %9 = load i64, ptr %2, align 8
  %10 = and i64 %9, 240
  %11 = lshr i64 %10, 4
  %12 = trunc i64 %11 to i32
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = add nsw i32 %8, %16
  %18 = and i64 %9, 3840
  %19 = lshr i64 %18, 8
  %20 = trunc i64 %19 to i32
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %21
  %23 = load i8, ptr %22, align 1
  %24 = sext i8 %23 to i32
  %25 = add nsw i32 %17, %24
  %26 = and i64 %9, 61440
  %27 = lshr i64 %26, 12
  %28 = trunc i64 %27 to i32
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %29
  %31 = load i8, ptr %30, align 1
  %32 = sext i8 %31 to i32
  %33 = add nsw i32 %25, %32
  %34 = and i64 %9, 983040
  %35 = lshr i64 %34, 16
  %36 = trunc i64 %35 to i32
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %37
  %39 = load i8, ptr %38, align 1
  %40 = sext i8 %39 to i32
  %41 = add nsw i32 %33, %40
  %42 = and i64 %9, 15728640
  %43 = lshr i64 %42, 20
  %44 = trunc i64 %43 to i32
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %45
  %47 = load i8, ptr %46, align 1
  %48 = sext i8 %47 to i32
  %49 = add nsw i32 %41, %48
  %50 = and i64 %9, 251658240
  %51 = lshr i64 %50, 24
  %52 = trunc i64 %51 to i32
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %53
  %55 = load i8, ptr %54, align 1
  %56 = sext i8 %55 to i32
  %57 = add nsw i32 %49, %56
  %58 = and i64 %9, 4026531840
  %59 = lshr i64 %58, 28
  %60 = trunc i64 %59 to i32
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %61
  %63 = load i8, ptr %62, align 1
  %64 = sext i8 %63 to i32
  %65 = add nsw i32 %57, %64
  ret i32 %65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @BW_btbl_bitcount(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca %union.anon, align 8
  store i64 %0, ptr %2, align 8
  store i64 %0, ptr %3, align 8
  %4 = load i8, ptr %3, align 8
  %5 = zext i8 %4 to i64
  %6 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %5
  %7 = load i8, ptr %6, align 1
  %8 = sext i8 %7 to i32
  %9 = getelementptr inbounds [4 x i8], ptr %3, i64 0, i64 1
  %10 = load i8, ptr %9, align 1
  %11 = zext i8 %10 to i64
  %12 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %11
  %13 = load i8, ptr %12, align 1
  %14 = sext i8 %13 to i32
  %15 = add nsw i32 %8, %14
  %16 = getelementptr inbounds [4 x i8], ptr %3, i64 0, i64 3
  %17 = load i8, ptr %16, align 1
  %18 = zext i8 %17 to i64
  %19 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i32
  %22 = add nsw i32 %15, %21
  %23 = getelementptr inbounds [4 x i8], ptr %3, i64 0, i64 2
  %24 = load i8, ptr %23, align 2
  %25 = zext i8 %24 to i64
  %26 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %25
  %27 = load i8, ptr %26, align 1
  %28 = sext i8 %27 to i32
  %29 = add nsw i32 %22, %28
  ret i32 %29
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @AR_btbl_bitcount(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store i64 %0, ptr %2, align 8
  %5 = getelementptr inbounds i8, ptr %2, i32 1
  store ptr %5, ptr %3, align 8
  %6 = load i8, ptr %2, align 1
  %7 = zext i8 %6 to i64
  %8 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %7
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i32
  store i32 %10, ptr %4, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds i8, ptr %11, i32 1
  store ptr %12, ptr %3, align 8
  %13 = load i8, ptr %11, align 1
  %14 = zext i8 %13 to i64
  %15 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %14
  %16 = load i8, ptr %15, align 1
  %17 = sext i8 %16 to i32
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %4, align 4
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds i8, ptr %20, i32 1
  store ptr %21, ptr %3, align 8
  %22 = load i8, ptr %20, align 1
  %23 = zext i8 %22 to i64
  %24 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %23
  %25 = load i8, ptr %24, align 1
  %26 = sext i8 %25 to i32
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %4, align 4
  %29 = load ptr, ptr %3, align 8
  %30 = load i8, ptr %29, align 1
  %31 = zext i8 %30 to i64
  %32 = getelementptr inbounds [256 x i8], ptr @bits, i64 0, i64 %31
  %33 = load i8, ptr %32, align 1
  %34 = sext i8 %33 to i32
  %35 = load i32, ptr %4, align 4
  %36 = add nsw i32 %35, %34
  store i32 %36, ptr %4, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ntbl_bitcnt(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, ptr %2, align 8
  %4 = and i64 %0, 15
  %5 = trunc i64 %4 to i32
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %6
  %8 = load i8, ptr %7, align 1
  %9 = sext i8 %8 to i32
  store i32 %9, ptr %3, align 4
  %10 = load i64, ptr %2, align 8
  %11 = ashr i64 %10, 4
  store i64 %11, ptr %2, align 8
  %12 = icmp ne i64 0, %11
  br i1 %12, label %13, label %18

13:                                               ; preds = %1
  %14 = load i64, ptr %2, align 8
  %15 = call i32 @ntbl_bitcnt(i64 noundef %14)
  %16 = load i32, ptr %3, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, ptr %3, align 4
  br label %18

18:                                               ; preds = %13, %1
  %19 = load i32, ptr %3, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @btbl_bitcnt(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, ptr %2, align 8
  %4 = load i8, ptr %2, align 8
  %5 = sext i8 %4 to i32
  %6 = and i32 %5, 255
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [256 x i8], ptr @bits.1, i64 0, i64 %7
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i32
  store i32 %10, ptr %3, align 4
  %11 = load i64, ptr %2, align 8
  %12 = ashr i64 %11, 8
  store i64 %12, ptr %2, align 8
  %13 = icmp ne i64 0, %12
  br i1 %13, label %14, label %19

14:                                               ; preds = %1
  %15 = load i64, ptr %2, align 8
  %16 = call i32 @btbl_bitcnt(i64 noundef %15)
  %17 = load i32, ptr %3, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %3, align 4
  br label %19

19:                                               ; preds = %14, %1
  %20 = load i32, ptr %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store double 0x7FEFFFFFFFFFFFFF, ptr %9, align 8
  store double 0.000000e+00, ptr %10, align 8
  %18 = load i32, ptr %4, align 4
  %19 = icmp slt i32 %18, 2
  br i1 %19, label %20, label %23

20:                                               ; preds = %2
  %21 = load ptr, ptr @stderr, align 8
  %22 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str.7)
  call void @exit(i32 noundef -1) #6
  unreachable

23:                                               ; preds = %2
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds ptr, ptr %24, i64 1
  %26 = load ptr, ptr %25, align 8
  %27 = call i32 @atoi(ptr noundef %26) #7
  store i32 %27, ptr %17, align 4
  %28 = call i32 @puts(ptr noundef @.str.8)
  store i32 0, ptr %11, align 4
  br label %29

29:                                               ; preds = %82, %23
  %30 = load i32, ptr %11, align 4
  %31 = icmp slt i32 %30, 7
  br i1 %31, label %32, label %85

32:                                               ; preds = %29
  %33 = call i64 @clock() #8
  store i64 %33, ptr %6, align 8
  store i64 0, ptr %15, align 8
  store i64 0, ptr %14, align 8
  %34 = call i32 @rand() #8
  %35 = sext i32 %34 to i64
  store i64 %35, ptr %16, align 8
  br label %36

36:                                               ; preds = %51, %32
  %37 = load i64, ptr %14, align 8
  %38 = load i32, ptr %17, align 4
  %39 = sext i32 %38 to i64
  %40 = icmp slt i64 %37, %39
  br i1 %40, label %41, label %56

41:                                               ; preds = %36
  %42 = load i32, ptr %11, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [7 x ptr], ptr @main.pBitCntFunc, i64 0, i64 %43
  %45 = load ptr, ptr %44, align 8
  %46 = load i64, ptr %16, align 8
  %47 = call i32 %45(i64 noundef %46)
  %48 = sext i32 %47 to i64
  %49 = load i64, ptr %15, align 8
  %50 = add nsw i64 %49, %48
  store i64 %50, ptr %15, align 8
  br label %51

51:                                               ; preds = %41
  %52 = load i64, ptr %14, align 8
  %53 = add nsw i64 %52, 1
  store i64 %53, ptr %14, align 8
  %54 = load i64, ptr %16, align 8
  %55 = add nsw i64 %54, 13
  store i64 %55, ptr %16, align 8
  br label %36

56:                                               ; preds = %36
  %57 = call i64 @clock() #8
  store i64 %57, ptr %7, align 8
  %58 = load i64, ptr %6, align 8
  %59 = sub nsw i64 %57, %58
  %60 = sitofp i64 %59 to double
  %61 = fdiv double %60, 1.000000e+06
  store double %61, ptr %8, align 8
  %62 = load double, ptr %9, align 8
  %63 = fcmp olt double %61, %62
  br i1 %63, label %64, label %67

64:                                               ; preds = %56
  %65 = load double, ptr %8, align 8
  store double %65, ptr %9, align 8
  %66 = load i32, ptr %11, align 4
  store i32 %66, ptr %12, align 4
  br label %67

67:                                               ; preds = %64, %56
  %68 = load double, ptr %8, align 8
  %69 = load double, ptr %10, align 8
  %70 = fcmp ogt double %68, %69
  br i1 %70, label %71, label %74

71:                                               ; preds = %67
  %72 = load double, ptr %8, align 8
  store double %72, ptr %10, align 8
  %73 = load i32, ptr %11, align 4
  store i32 %73, ptr %13, align 4
  br label %74

74:                                               ; preds = %71, %67
  %75 = load i32, ptr %11, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [7 x ptr], ptr @main.text, i64 0, i64 %76
  %78 = load ptr, ptr %77, align 8
  %79 = load double, ptr %8, align 8
  %80 = load i64, ptr %15, align 8
  %81 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %78, double noundef %79, i64 noundef %80)
  br label %82

82:                                               ; preds = %74
  %83 = load i32, ptr %11, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, ptr %11, align 4
  br label %29

85:                                               ; preds = %29
  %86 = load i32, ptr %12, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [7 x ptr], ptr @main.text, i64 0, i64 %87
  %89 = load ptr, ptr %88, align 8
  %90 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, ptr noundef %89)
  %91 = load i32, ptr %13, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [7 x ptr], ptr @main.text, i64 0, i64 %92
  %94 = load ptr, ptr %93, align 8
  %95 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %94)
  ret i32 0
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #3

declare i32 @puts(ptr noundef) #1

; Function Attrs: nounwind
declare i64 @clock() #4

; Function Attrs: nounwind
declare i32 @rand() #4

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @bit_shifter(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i64 %0, ptr %2, align 8
  store i32 0, ptr %4, align 4
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %20, %1
  %6 = load i64, ptr %2, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %5
  %9 = load i32, ptr %3, align 4
  %10 = sext i32 %9 to i64
  %11 = icmp ult i64 %10, 64
  br label %12

12:                                               ; preds = %8, %5
  %13 = phi i1 [ false, %5 ], [ %11, %8 ]
  br i1 %13, label %14, label %25

14:                                               ; preds = %12
  %15 = load i64, ptr %2, align 8
  %16 = and i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = load i32, ptr %4, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, ptr %4, align 4
  br label %20

20:                                               ; preds = %14
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %3, align 4
  %23 = load i64, ptr %2, align 8
  %24 = ashr i64 %23, 1
  store i64 %24, ptr %2, align 8
  br label %5

25:                                               ; preds = %12
  %26 = load i32, ptr %4, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind uwtable
define dso_local ptr @bfopen(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = call noalias ptr @malloc(i64 noundef 16) #9
  store ptr %7, ptr %6, align 8
  %8 = icmp eq ptr null, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  store ptr null, ptr %3, align 8
  br label %26

10:                                               ; preds = %2
  %11 = load ptr, ptr %4, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = call noalias ptr @fopen(ptr noundef %11, ptr noundef %12)
  %14 = load ptr, ptr %6, align 8
  store ptr %13, ptr %14, align 8
  %15 = load ptr, ptr %6, align 8
  %16 = load ptr, ptr %15, align 8
  %17 = icmp eq ptr null, %16
  br i1 %17, label %18, label %20

18:                                               ; preds = %10
  %19 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %19) #8
  store ptr null, ptr %3, align 8
  br label %26

20:                                               ; preds = %10
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds %struct.bfile, ptr %21, i32 0, i32 2
  store i8 0, ptr %22, align 1
  %23 = load ptr, ptr %6, align 8
  %24 = getelementptr inbounds %struct.bfile, ptr %23, i32 0, i32 4
  store i8 0, ptr %24, align 1
  %25 = load ptr, ptr %6, align 8
  store ptr %25, ptr %3, align 8
  br label %26

26:                                               ; preds = %20, %18, %9
  %27 = load ptr, ptr %3, align 8
  ret ptr %27
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #5

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind
declare void @free(ptr noundef) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bfread(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = getelementptr inbounds %struct.bfile, ptr %0, i32 0, i32 2
  %4 = load i8, ptr %3, align 1
  %5 = sext i8 %4 to i32
  %6 = icmp eq i32 0, %5
  br i1 %6, label %7, label %16

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = call i32 @fgetc(ptr noundef %9)
  %11 = trunc i32 %10 to i8
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.bfile, ptr %12, i32 0, i32 1
  store i8 %11, ptr %13, align 8
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.bfile, ptr %14, i32 0, i32 2
  store i8 8, ptr %15, align 1
  br label %16

16:                                               ; preds = %7, %1
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.bfile, ptr %17, i32 0, i32 2
  %19 = load i8, ptr %18, align 1
  %20 = add i8 %19, -1
  store i8 %20, ptr %18, align 1
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds %struct.bfile, ptr %21, i32 0, i32 1
  %23 = load i8, ptr %22, align 8
  %24 = sext i8 %23 to i32
  %25 = getelementptr inbounds %struct.bfile, ptr %21, i32 0, i32 2
  %26 = load i8, ptr %25, align 1
  %27 = sext i8 %26 to i32
  %28 = shl i32 1, %27
  %29 = and i32 %24, %28
  %30 = icmp ne i32 %29, 0
  %31 = zext i1 %30 to i32
  ret i32 %31
}

declare i32 @fgetc(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bfwrite(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %5 = getelementptr inbounds %struct.bfile, ptr %1, i32 0, i32 4
  %6 = load i8, ptr %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp eq i32 8, %7
  br i1 %8, label %9, label %18

9:                                                ; preds = %2
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.bfile, ptr %10, i32 0, i32 3
  %12 = load i8, ptr %11, align 2
  %13 = sext i8 %12 to i32
  %14 = load ptr, ptr %10, align 8
  %15 = call i32 @fputc(i32 noundef %13, ptr noundef %14)
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.bfile, ptr %16, i32 0, i32 4
  store i8 0, ptr %17, align 1
  br label %18

18:                                               ; preds = %9, %2
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.bfile, ptr %19, i32 0, i32 4
  %21 = load i8, ptr %20, align 1
  %22 = add i8 %21, 1
  store i8 %22, ptr %20, align 1
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.bfile, ptr %23, i32 0, i32 3
  %25 = load i8, ptr %24, align 2
  %26 = sext i8 %25 to i32
  %27 = shl i32 %26, 1
  %28 = trunc i32 %27 to i8
  store i8 %28, ptr %24, align 2
  %29 = load i32, ptr %3, align 4
  %30 = and i32 %29, 1
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.bfile, ptr %31, i32 0, i32 3
  %33 = load i8, ptr %32, align 2
  %34 = sext i8 %33 to i32
  %35 = or i32 %34, %30
  %36 = trunc i32 %35 to i8
  store i8 %36, ptr %32, align 2
  ret void
}

declare i32 @fputc(i32 noundef, ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bfclose(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %0, align 8
  %4 = call i32 @fclose(ptr noundef %3)
  %5 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %5) #8
  ret void
}

declare i32 @fclose(ptr noundef) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bitstring(ptr noundef %0, i64 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %11 = load i32, ptr %7, align 4
  %12 = ashr i32 %11, 2
  %13 = add nsw i32 %11, %12
  %14 = srem i32 %11, 4
  %15 = icmp ne i32 %14, 0
  %16 = select i1 %15, i32 0, i32 1
  %17 = sub nsw i32 %13, %16
  %18 = sub nsw i32 %3, %17
  store i32 %18, ptr %10, align 4
  store i32 0, ptr %9, align 4
  br label %19

19:                                               ; preds = %26, %4
  %20 = load i32, ptr %9, align 4
  %21 = load i32, ptr %10, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %29

23:                                               ; preds = %19
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds i8, ptr %24, i32 1
  store ptr %25, ptr %5, align 8
  store i8 32, ptr %24, align 1
  br label %26

26:                                               ; preds = %23
  %27 = load i32, ptr %9, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %9, align 4
  br label %19

29:                                               ; preds = %19
  br label %30

30:                                               ; preds = %53, %29
  %31 = load i32, ptr %7, align 4
  %32 = add nsw i32 %31, -1
  store i32 %32, ptr %7, align 4
  %33 = icmp sge i32 %32, 0
  br i1 %33, label %34, label %54

34:                                               ; preds = %30
  %35 = load i64, ptr %6, align 8
  %36 = load i32, ptr %7, align 4
  %37 = zext i32 %36 to i64
  %38 = ashr i64 %35, %37
  %39 = and i64 %38, 1
  %40 = add nsw i64 %39, 48
  %41 = trunc i64 %40 to i8
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds i8, ptr %42, i32 1
  store ptr %43, ptr %5, align 8
  store i8 %41, ptr %42, align 1
  %44 = load i32, ptr %7, align 4
  %45 = srem i32 %44, 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %53, label %47

47:                                               ; preds = %34
  %48 = load i32, ptr %7, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %53

50:                                               ; preds = %47
  %51 = load ptr, ptr %5, align 8
  %52 = getelementptr inbounds i8, ptr %51, i32 1
  store ptr %52, ptr %5, align 8
  store i8 32, ptr %51, align 1
  br label %53

53:                                               ; preds = %50, %47, %34
  br label %30

54:                                               ; preds = %30
  %55 = load ptr, ptr %5, align 8
  store i8 0, ptr %55, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @bstr_i(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %21, %1
  %6 = load ptr, ptr %2, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = load ptr, ptr %2, align 8
  %10 = load i8, ptr %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %19

13:                                               ; preds = %8
  %14 = load ptr, ptr %2, align 8
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = call ptr @strchr(ptr noundef @.str.12, i32 noundef %16) #7
  %18 = icmp ne ptr %17, null
  br label %19

19:                                               ; preds = %13, %8, %5
  %20 = phi i1 [ false, %8 ], [ false, %5 ], [ %18, %13 ]
  br i1 %20, label %21, label %33

21:                                               ; preds = %19
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds i8, ptr %22, i32 1
  store ptr %23, ptr %2, align 8
  %24 = load i8, ptr %22, align 1
  %25 = sext i8 %24 to i32
  %26 = sub nsw i32 %25, 48
  store i32 %26, ptr %3, align 4
  %27 = load i32, ptr %4, align 4
  %28 = shl i32 %27, 1
  store i32 %28, ptr %4, align 4
  %29 = load i32, ptr %3, align 4
  %30 = and i32 %29, 1
  %31 = load i32, ptr %4, align 4
  %32 = or i32 %31, %30
  store i32 %32, ptr %4, align 4
  br label %5

33:                                               ; preds = %19
  %34 = load i32, ptr %4, align 4
  ret i32 %34
}

; Function Attrs: nounwind willreturn memory(read)
declare ptr @strchr(ptr noundef, i32 noundef) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind willreturn memory(read) }
attributes #8 = { nounwind }
attributes #9 = { nounwind allocsize(0) }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 17.0.2 (1~exp1ubuntu2.1)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
