//
//  Heap.h
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/9/6.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Heap : NSObject

@property (nonatomic,strong)NSMutableArray *a; // 数组，从下标1开始存储数据
@property (nonatomic, assign)NSInteger n; // 堆可以存储的最大数据个数
@property (nonatomic, assign)NSInteger count; // 堆中已经存储的数据个数

- (instancetype)initWithCapacity:(NSInteger)capacity;
/// 往堆插入数据
/// @param data 插入的数据，此处为NSInteger，可扩展为NSObject
- (void)insert:(NSInteger)data;
/// 删除堆顶元素，移除最大或最小值
- (NSInteger)removeMax;
///  建堆
/// @param arr arr
- (void)buildHeapWithArr:(NSMutableArray *)arr;

/// 堆排序
/// @param arr <#arr description#>
- (void)sortHeapWithArr:(NSMutableArray *)arr;

- (void)LogHeap;

@end

NS_ASSUME_NONNULL_END
