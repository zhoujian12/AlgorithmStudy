//
//  Heap.m
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/9/6.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import "Heap.h"

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


/// 往堆插入数据
/// @param data 插入的数据，此处为NSInteger，可扩展为NSObject
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

/// 删除堆顶元素，移除最大或最小值
- (NSInteger)removeMax{
    if (_count == 0) {//堆中没有数据
        return -1;
    }
    
    self.a[0] = self.a[_count]; //交换
    --self.count;
    [self heapifyWithArr:_a n:self.count i:0];
    
    return 0;
}


///  建堆
/// @param arr arr
- (void)buildHeapWithArr:(NSMutableArray *)arr{
    _a = arr;
    _count = arr.count;
    _n = arr.count;
    //从非叶子节点开始比较堆化，当堆顶下标index为0， 中左右的顺序分别为（i, 2i+1 ,2i+2）
    for (NSInteger i = (_n)/2 - 1; i >= 0; --i) {
        [self heapifyWithArr:_a n:_n - 1 i:i];
    }
}

- (void)sortHeapWithArr:(NSMutableArray *)arr{
    [self buildHeapWithArr:arr];
    //这里要注意第一个元素下标为0;所以下面要减一
    NSInteger k = _n - 1;
    while (k > 0) {
        //交换堆顶元素和最后一个元素
        [self.a exchangeObjectAtIndex:k withObjectAtIndex:0];
        //最后一个元素最大，故后续不需要再参与交换
        --k;
        //反复堆化，获取下一个堆顶元素直到只剩最后一个数据
        [self heapifyWithArr:self.a n:k i:0];
    }
}

//堆化
- (void)heapifyWithArr:(NSMutableArray *)arr  n:(NSInteger)n i:(NSInteger)i{
    while (true) {
        NSInteger maxPos = i; //默认当前最大值的索引为参与比较的非叶子节点
        if (i*2 + 1 <= n && [arr[i] intValue] < [arr[2*i + 1]intValue]) { //非叶子节点和左节点比较
            maxPos = i*2 + 1;
        }
        if (i*2 + 2 <= n && [arr[maxPos] intValue] < [arr[2*i + 2]intValue]) {
            //非叶子节点和左节点 中较大的节点和右节点比较
            maxPos = i*2 + 2;
        }
        if (maxPos == i) { //相等说明非叶子节点的值大于左右节点 或者 当前索引为非叶子节点
            break;
        }
        [arr exchangeObjectAtIndex:maxPos withObjectAtIndex:i];
        i = maxPos;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"self.count:%ld \n self.n:%ld \n self.a:%@", self.count,self.n,self.a];
}

- (void)LogHeap{
    NSLog(@"heap description : %@",self.description);
}


/// 图形化打印
- (void)LogHeapByGraph{
    NSLog(@"heap description : %@",self.description);
}

@end
