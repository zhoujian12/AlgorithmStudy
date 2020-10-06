//
//  ZJVertex.h
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/10/6.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZJVertexState){
    ZJVertexStateUnKnow = 0,
    ZJVertexStateVisited,
    ZJVertexStateNoVisited,
};

@interface ZJVertex : NSObject<NSCopying>

@property (nonatomic,strong) NSNumber  *index;
@property (nonatomic,strong) NSNumber  *data;
@property (nonatomic,assign) ZJVertexState state;
- (instancetype)initWithIndex:(NSNumber *)index data:(NSNumber *)data;


@end

NS_ASSUME_NONNULL_END
