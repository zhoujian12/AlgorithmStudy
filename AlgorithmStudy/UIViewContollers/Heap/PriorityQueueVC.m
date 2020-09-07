//
//  PriorityQueueVC.m
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/8/30.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import "PriorityQueueVC.h"
#import "Heap.h"
#import "ZJTreeNodeUtil.h"
#import "ZJTreeOperation.h"

@interface PriorityQueueVC ()

@property (nonatomic) NSArray  *dataArr;


@end

@implementation PriorityQueueVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    //MARK: 1.合并两个有序数组
    NSMutableArray *arr1 = [NSMutableArray arrayWithArray:@[@1,@3,@9,@66,@100]];
    NSMutableArray *arr2 = [NSMutableArray arrayWithArray:@[@2,@8,@77,@88,@99]];
    NSArray *arr = [self mergeOrderArrayWithFirstArray:arr1 secondArray:arr2];
    NSLog(@"arr : %@",arr);
    
    //MARK: 2.堆排序
    //1.建堆
    //2.排序
    NSMutableArray *a = [NSMutableArray arrayWithArray:@[@5,@7,@1,@3,@9,@66,@100]];
    Heap *heap = [[Heap alloc] initWithCapacity:a.count];
    [heap sortHeapWithArr:a];
    [heap LogHeap];
    
    //
    double x = log2(8);
    NSInteger w = (NSInteger)(x);
    //堆的层数 = w + 1
    NSInteger layersNumber = w + 1;
    //MARK:  打印
    NSMutableArray *b = [NSMutableArray arrayWithArray:@[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14]];
    ZJTreeNode *node = [ZJTreeNodeUtil initNodeWithArr:[b copy]];
    ZJTreeOperation *op = [[ZJTreeOperation alloc] init];
    [op showWithNode:node];
    
    
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
