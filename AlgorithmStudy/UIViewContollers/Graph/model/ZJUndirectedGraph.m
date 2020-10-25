//
//  ZJUndirectedGraph.m
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/10/6.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import "ZJUndirectedGraph.h"

//无向图
@interface ZJUndirectedGraph ()

@property (nonatomic, assign) NSInteger vertexCount; // 顶点的个数
@property(nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber *> *> *adj;// 邻接表

@end

@implementation ZJUndirectedGraph
- (instancetype)initWithVertexCount:(NSInteger)vertexCount
{
    self = [super init];
    if (self) {
        self.vertexCount = vertexCount;
        self.adj = [[NSMutableArray alloc] initWithCapacity:vertexCount];
        for (int i = 0; i < vertexCount; ++i) {
            self.adj[i] = [[NSMutableArray alloc]init];
        }
    }
    return self;
}

- (void)addEdgeWithS:(NSInteger)s t:(NSInteger)t{// 无向图一条边存两次
    [self.adj[s] addObject: [NSNumber numberWithInteger:t]];
    [self.adj[t] addObject: [NSNumber numberWithInteger:s]];
}


/// 其中 s 表示起始顶点，t 表示终止顶点。我们搜索一条从 s 到 t 的路径。实际上，这样求得的路径就是从 s 到 t 的最短路径。
/// @param s 起始顶点
/// @param t 终止顶点
- (void)bfsWithS:(NSInteger)s t:(NSInteger)t{
    if (s == t) return;
    BOOL visitedArr = NO;
    
}

@end
