//
//  PriorityQueueVC.m
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/8/30.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import "PriorityQueueVC.h"

@interface PriorityQueueVC ()

@property (nonatomic) NSArray  *dataArr;


@end

@implementation PriorityQueueVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    NSMutableArray *arr1 = [NSMutableArray arrayWithArray:@[@1,@3,@9,@66,@100]];
    NSMutableArray *arr2 = [NSMutableArray arrayWithArray:@[@2,@8,@77,@88,@99]];
    NSArray *arr = [self mergeOrderArrayWithFirstArray:arr1 secondArray:arr2];
    NSLog(@"arr : %@",arr);
}

- (NSArray *)mergeOrderArrayWithFirstArray: (NSMutableArray *)array1 secondArray: (NSMutableArray *)array2 {
    // 全为空不处理
    if (!array1.count && !array2.count) {
        return @[];
    }
    // 一个为空返回另外一个
    if (!array1.count) {
        return array2;
    }
    if (!array2.count) {
        return array1;
    }
    NSMutableArray *endArray = [NSMutableArray array];
    while (1) {
        if ([array1[0] integerValue] < [array2[0] integerValue]) {
            [endArray addObject:array1[0]];
            [array1 removeObjectAtIndex:0];
        }else {
            [endArray addObject:array2[0]];
            [array2 removeObjectAtIndex:0];
        }
        //遍历完了一个数组后直接拼接未遍历完的数组，减少循环
        if (!array1.count) {
            [endArray addObjectsFromArray:array2];
            break;
        }
        if (!array2.count) {
            [endArray addObjectsFromArray:array1];
            break;
        }
    }
    return endArray;
}

@end

@interface Heap : NSObject
@property (nonatomic,strong)NSMutableArray *a; // 数组，从下标1开始存储数据
@property (nonatomic, assign)NSInteger n; // 堆可以存储的最大数据个数
@property (nonatomic, assign)NSInteger count; // 堆中已经存储的数据个数

@end

@implementation Heap
- (instancetype)initWithCapacity:(NSInteger)capacity
{
    self = [super init];
    if (self) {
        _a = [[NSMutableArray alloc] init];
        _n = capacity;
        _count = 0;
    }
    return self;
}

- (void)insert:(NSInteger)data{
    if (_count > _n) {
        return; //堆满了
    }
    ++self.count;
    [self.a insertObject:[NSNumber numberWithInteger:data] atIndex:_count];
    NSInteger i = _count;
    while (i/2 > 0 && [_a[i] intValue] > [_a[i/2] intValue]) { //自顶往下堆化
        [self.a exchangeObjectAtIndex:i withObjectAtIndex:i/2];
        i = i/2;
    }
}

- (NSInteger)removeMax{
    if (_count == 0) {//堆中没有数据
        return -1;
    }
    
    self.a[1] = self.a[_count];
    --self.count;
    [self heapifyWithN:self.count i:1];
    
    return 0;
}

- (void)heapifyWithN:(NSInteger)n i:(NSInteger)i{
    while (true) {
        NSInteger maxPos = i;
        if (i*2 <= n && [_a[i] intValue] < [_a[2*i]intValue]) {
            maxPos = i*2;
        }
        if (i*2 + 1 <= n && [_a[i] intValue] < [_a[2*i + 1]intValue]) {
            maxPos = i*2 + 1;
        }
        if (maxPos == 1) {
            break;
        }
        [self.a exchangeObjectAtIndex:maxPos withObjectAtIndex:i];
        i = maxPos;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"self.count:%ld \n self.n:%ld \n self.a:%@", self.count,self.n,self.a];
}

- (void)LogHeap{
    
}

@end
