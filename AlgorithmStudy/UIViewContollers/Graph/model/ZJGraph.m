//
//  ZJGraph.m
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/10/6.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import "ZJGraph.h"

@interface ZJGraph ()

@property(nonatomic, strong) NSMutableDictionary<ZJVertex*, NSMutableArray<ZJVertex*>*> *adjacencyList;

@end

@implementation ZJGraph{
    
}

-(instancetype)initWithVertex:(ZJVertex*)vertex
{
    if (self = [super init])
    {
        self.adjacencyList = [NSMutableDictionary new];
        [self addVertexFrom:vertex toVertex:nil];
    }

    return self;
}

-(void)addVertexFrom:(ZJVertex*)fromVertex toVertex:(ZJVertex*)toVertex
{
    ZJVertex *fromV = [self isVertexPresent:fromVertex];

    if (fromV)
    {
        NSMutableArray *adjacentVertices = _adjacencyList[fromV];
        [adjacentVertices addObject:toVertex];
    }
    else
    {
        //setObjec:forKey:的key必须遵守NSCopying协议,KVC的key必须为字符串

        [_adjacencyList setObject:toVertex ? [NSMutableArray arrayWithObject:toVertex] : [NSMutableArray new] forKey:fromVertex];
    }

}

-(ZJVertex*)isVertexPresent:(ZJVertex*)vertex
{
    for (ZJVertex *v in _adjacencyList.allKeys)
    {
        if ([v isEqual:vertex])
        {
            return v;
        }
    }

    return nil;
}

-(void)printAdjacencyList


{
    NSMutableString *graphDesciption = [[NSMutableString alloc] init];

    for (ZJVertex *v in _adjacencyList.allKeys)
    {
        [graphDesciption appendString:[NSString stringWithFormat:@"\n%@ -> ", v.data]];

        for (ZJVertex *adjV in _adjacencyList[v])
        {
            [graphDesciption appendString:[NSString stringWithFormat:@"%@, ", adjV.data]];
        }

        [graphDesciption appendString:@"\n"];
    }

    NSLog(@"%@", graphDesciption);
}

-(void)bfs:(ZJVertex*)root
{
    NSMutableArray *queue = [NSMutableArray new];
    [queue addObject:root];

    while (queue.count)
    {
        ZJVertex *curr = [queue objectAtIndex:0];
        [queue removeObjectAtIndex:0];

        if (curr.state != ZJVertexStateVisited)
        {
            curr.state = ZJVertexStateVisited;
            NSLog(@"\n%ld", (long)curr.data.integerValue);
            NSArray *temp = _adjacencyList[curr];
            for (ZJVertex *v in temp)
            {
                [queue addObject:v];
            }
        }
    }
}

-(void)dfs:(ZJVertex*)root
{
    if (root == nil) return;

    NSLog(@"\n%ld", (long)root.data.integerValue);
    root.state = ZJVertexStateVisited;

    for (ZJVertex *v in _adjacencyList[root])
    {
        if (v.state != ZJVertexStateVisited)
        {
            [self dfs:v];
        }
    }

}

@end
