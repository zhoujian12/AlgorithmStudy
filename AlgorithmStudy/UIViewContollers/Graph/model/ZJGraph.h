//
//  ZJGraph.h
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/10/6.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJVertex.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZJGraph : NSObject

- (instancetype)initWithVertex:(ZJVertex *)vertex;
- (void)addVertexFrom:(ZJVertex *)fromVertex toVertex:(ZJVertex * _Nullable )toVertex;
- (void)printAdjacencyList;
- (void)bfs:(ZJVertex *)root;
- (void)dfs:(ZJVertex *)root;

@end


NS_ASSUME_NONNULL_END
