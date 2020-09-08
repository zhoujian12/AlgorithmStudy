//
//  ZJTreeNodeUtil.m
//  AlgorithmStudy
//
//  Created by ZhouJian on 2020/9/7.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import "ZJTreeNodeUtil.h"

@implementation ZJTreeNodeUtil


- (instancetype)initWithArr:(NSArray *)arr
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (ZJTreeNode *)initNodeWithArr:(NSArray *)arr
{
    ZJTreeNode *root = [self initNodeWithArr:arr index:0];
    return root;
}

+ (ZJTreeNode *)initNodeWithArr:(NSArray *)arr index:(NSInteger)index{
    if (arr.count == 0 || index > arr.count - 1) {
        return nil;
    }
    
    NSInteger value = 0;
    if (arr[index]) {
       NSNumber *n = (NSNumber *)(arr[index]);
       value = [n integerValue];
    }
    

    ZJTreeNode *node = [[ZJTreeNode alloc] initWithVal:value];
    node.left = [self initNodeWithArr:arr index:index * 2 + 1];
    node.right = [self initNodeWithArr:arr index:index * 2 + 2];
    return node;
    //    for (id s in arr) {
    //        if (s && [s isKindOfClass:[NSNumber class]]) {
    //            NSNumber *p = (NSNumber *)s;
    //            NSInteger s = [p integerValue];
    //        }
    //    }
    
    //    for (NSInteger i = 0; i < arr.count; i++) {
    //        if (arr[i] && [arr[i] isKindOfClass:[NSNumber class]]) {
    //            NSNumber *p = (NSNumber *)arr[i];
    //            NSInteger s = [p integerValue];
    //            if (i == 0) {
    //                self.val = s;
    //            }else{
    //
    //            }
    //        }
    //    }
    
    
    
//    for (NSInteger i = 0; i < arr.count / 2 - 1; i++) {
//        if (arr[i] && [arr[i] isKindOfClass:[NSNumber class]]) {
//            NSNumber *p = (NSNumber *)arr[i];
//            NSInteger s = [p integerValue];
//
//            ZJTreeNode *node = [[ZJTreeNode alloc] initWithVal:v]
//        }
//    }
    
}

- (void)tranferArrayToNodeWithNode:(ZJTreeNode *)node{
    
}

@end
