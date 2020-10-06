//
//  ZJFloydWarshallVC.m
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/10/5.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import "ZJFloydWarshallVC.h"

@interface ZJFloydWarshallVC ()

@end

@implementation ZJFloydWarshallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //可以将很多图的运算转成矩阵之间的运算;例如Floyd-Warshall 算法，就是利用矩阵循环相乘若干次得到结果。
    NSNumber *max = @10000;  //用来表示最大值∞，表示两个顶点之间无边
//    NSArray *arr = ;
    NSMutableArray<NSMutableArray <NSNumber *> *> *arr = [[NSMutableArray alloc] initWithObjects:[@[@0,@2,@6,@4] mutableCopy],
                                                                                    [@[max,@0,@3,max]mutableCopy],
                                                                                    [@[@7,max,@0,@1] mutableCopy],
                                                          [@[@5,max,@12,@0] mutableCopy], nil];
    
    
    NSMutableArray *fetchArr = [self zj_floydWithArr:arr];
    NSLog(@"ZJFloydWarshallVC fetchArr : %@",fetchArr);
}

- (NSMutableArray *)zj_floydWithArr:(NSMutableArray *)arr{
    for (int k = 0; k < arr.count; k++) {
        for (int i = 0; i < arr.count; i++) {
            for (int j = 0; j < arr.count; j++) {
                if ([arr[i][j] intValue] > ([arr[i][k] intValue] + [arr[k][j] intValue]) ) {
                    int temp = ([arr[i][k] intValue] + [arr[k][j] intValue]);
                    arr[i][j] = [NSNumber numberWithInt:temp];
                }
            }
        }
    }
    return arr;
}


@end
