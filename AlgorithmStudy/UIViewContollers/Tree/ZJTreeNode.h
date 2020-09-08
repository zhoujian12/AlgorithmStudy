//
//  ZJTreeNode.h
//  AlgorithmStudy
//
//  Created by ZhouJian on 2020/9/7.
//  Copyright © 2020 jianz3.com. All rights reserved.
//
// 构造一个二叉树结构

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJTreeNode : NSObject

@property (nonatomic, strong) ZJTreeNode* left;
@property (nonatomic, strong) ZJTreeNode* right;
//MARK: 此处实际中通常为NSObject对象类型，为了测试方便先写成NSInteger类型
@property (nonatomic, assign) NSInteger val;

- (instancetype)initWithVal:(NSInteger)var;

@end

NS_ASSUME_NONNULL_END
