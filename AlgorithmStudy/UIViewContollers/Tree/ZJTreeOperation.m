//
//  ZJTreeOperation.m
//  AlgorithmStudy
//
//  Created by ZhouJian on 2020/9/7.
//  Copyright © 2020 jianz3.com. All rights reserved.
//
/*
   树的结构示例：
             1
           /   \
         2       3
        / \     / \
       4   5   6   7
*/


#import "ZJTreeOperation.h"

@interface ZJTreeOperation()

@property (nonatomic, strong) NSMutableArray <NSMutableArray *> * twoDimensionsalMutableArr;

@end

@implementation ZJTreeOperation
- (instancetype)init
{
    self = [super init];
    if (self) {
        _twoDimensionsalMutableArr = [[NSMutableArray alloc] init];
    }
    return self;
}


///  递归法获取树的层数
- (NSInteger)fetchTreeLayersNumber:(ZJTreeNode *)root{
    return root == nil ? 0 : (1 + MAX([self fetchTreeLayersNumber:root.left], [self fetchTreeLayersNumber:root.right]));
}


/// <#Description#>
/// @param curNode 当前节点
/// @param rowIndex 每行的下标索引
/// @param columnIndex 每列的下标索引
/// @param layersNumber 树的层数
- (void)wirteArray:(ZJTreeNode *)curNode rowIndex:(NSInteger)rowIndex columnIndex:(NSInteger)columnIndex layersNumber:(NSInteger)layersNumber{
    //保证输入的树不为空
    if (!curNode) {
        return;
    }
    //将当前节点保存到二维数组中
    NSLog(@"curNode.val: %d",(int)curNode.val);
    NSString *str = [NSString stringWithFormat:@"%ld",(long)curNode.val];
    self.twoDimensionsalMutableArr[rowIndex][columnIndex] = str;
    
    //计算当前位于树的第几层
    NSInteger currLevel = (rowIndex + 1) / 2;
    //如果到了最后一层则返回
    if (columnIndex == layersNumber) {
        return;
    }
    
    
    NSInteger gap = layersNumber - currLevel - 1;
    
    if (curNode.left != nil) {
        self.twoDimensionsalMutableArr[rowIndex + 1][columnIndex - gap] = @"/";
        [self wirteArray:curNode.left rowIndex:rowIndex + 2 columnIndex:columnIndex - gap * 2 layersNumber:layersNumber];
    }
    
    if (curNode.right != nil) {
        self.twoDimensionsalMutableArr[rowIndex + 1][columnIndex + gap] = @"\\";
        [self wirteArray:curNode.right rowIndex:rowIndex + 2 columnIndex:columnIndex + gap * 2 layersNumber:layersNumber];
    }
}


///  打印树结构
/// @param root 被打印的树
- (void)showWithNode:(ZJTreeNode *)root{
    if (root == nil) {
        NSLog(@"node is EMPTY!");
    }
    
    NSInteger layersNum = [self fetchTreeLayersNumber:root];
    
    //数据和"/","\"组成的层数
    NSInteger arrHeight = layersNum * 2 - 1;
    
    NSInteger arrWidth = (2 << (layersNum - 2)) * 3 + 1;
    
    
    for (NSInteger i = 0; i < arrHeight; i++) {
        NSMutableArray *arr1 = [[NSMutableArray alloc] init];
        for (NSInteger j = 0; j < arrWidth; j++) {
            [arr1 addObject:@" "];
//            self.twarr1oDimensionsalMutableArr[i][j] = @" ";
        }
        [self.twoDimensionsalMutableArr addObject:arr1];
    }
    
    [self wirteArray:root rowIndex:0 columnIndex:arrWidth/2 layersNumber:layersNum];
    
    for (NSMutableArray *arr in self.twoDimensionsalMutableArr) {
        NSMutableString *s = [[NSMutableString alloc] initWithString:@""];
        for (int i = 0; i < arr.count; i++) {
            [s appendString:arr[i]];
            if ([arr[i] length] > 1 && i <= [arr[i] length] - 1) {
                i += [arr[i] length] > 4 ? 2: [arr[i] length] - 1;
            }
        }
        NSLog(@"%@",s);
    }
    
}


@end
