//
//  ZJVertex.m
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/10/6.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import "ZJVertex.h"

@implementation ZJVertex

- (instancetype)initWithIndex:(NSNumber *)index data:(NSNumber *)data{
    if (self = [super init]) {
        self.index = index;
        self.data = data;
    }
    return  self;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
//    if (self = [[[self class] allocWithZone:zone] init]) {
//    }
    ZJVertex *tex = [[[self class] allocWithZone:zone] init];
    tex.index = self.index;
    tex.data = self.data;
    return  tex;
}

- (BOOL)isEqual:(id)other
{
    if (!other) {
        return NO;
    }else if (other == self) {
        return YES;
    } else if (![other isKindOfClass:[ZJVertex class]]) {
        return NO;
    } else {
        ZJVertex *t = (ZJVertex *)other;
        BOOL isEqual = ([self.index intValue] == [t.index intValue] && [self.index intValue] == [t.index intValue] && self.state == t.state);
        return isEqual;
    }
}

- (NSUInteger)hash
{
    return [self.index intValue] ^ [self.index intValue] ^ self.state;
}

@end
