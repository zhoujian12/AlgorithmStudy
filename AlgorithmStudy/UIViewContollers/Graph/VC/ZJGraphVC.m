//
//  ZJGraphVC.m
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/10/6.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import "ZJGraphVC.h"
#import "ZJGraph.h"
#import "ZJVertex.h"

@interface ZJGraphVC()

@end

@implementation ZJGraphVC {
    NSArray *_titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupDataSource];
    
    [self setupUI];
    
}

- (void)setupDataSource {
    _titleArray = @[
        @"1.1 dfs 深度优先",
        @"1.2 bfs 广度优先",
        @"1.3 todo",
        @"2. todo",
        @"3. todo",
        @"4. todo"
    ];
    
}

- (void)setupUI {
    CGFloat buttonWidth = (UIScreenWidth - 60);
    CGFloat buttonHeight = 44;
    CGFloat buttonSpace = 30;
    CGFloat buttonGap = 10;
    for (int i = 0; i < _titleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 1000+i;
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        button.titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        button.frame = CGRectMake(buttonSpace, 100+(buttonHeight+buttonGap)*i, buttonWidth, buttonHeight);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = 5;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.backgroundColor = [UIColor colorWithRed:214/255.0 green:235/255.0 blue:253/255.0 alpha:1];
        [self.view addSubview:button];
    }
}

- (void)buttonClick:(UIButton *)button {
    NSInteger buttonTag = button.tag;
    switch (buttonTag) {
        case 1000: {
            [self ZJDfs];
        }
            break;
        case 1001: {
            [self ZJBfs];
        }
            break;
        case 1002: {
            
        }
            break;
        case 1003: {
            
        }
            break;
        case 1004: {
            
        }
            break;
        case 1005: {
            
        }
        default:
            break;
    }
}

- (void)ZJDfs{
    ZJVertex *vertex0 = [[ZJVertex alloc] initWithIndex:@(0) data:@(0)];
    ZJVertex *vertex1 = [[ZJVertex alloc] initWithIndex:@(1) data:@(1)];
    ZJVertex *vertex2 = [[ZJVertex alloc] initWithIndex:@(2) data:@(2)];
    ZJVertex *vertex3 = [[ZJVertex alloc] initWithIndex:@(3) data:@(3)];
    ZJVertex *vertex4 = [[ZJVertex alloc] initWithIndex:@(4) data:@(4)];
    ZJVertex *vertex5 = [[ZJVertex alloc] initWithIndex:@(5) data:@(5)];
    
    ZJGraph *graph = [[ZJGraph alloc] initWithVertex:vertex0];
    
    [graph addVertexFrom:vertex0 toVertex:vertex1];
    [graph addVertexFrom:vertex0 toVertex:vertex4];
    [graph addVertexFrom:vertex0 toVertex:vertex5];
    
    [graph addVertexFrom:vertex1 toVertex:vertex3];
    [graph addVertexFrom:vertex1 toVertex:vertex4];
    
    [graph addVertexFrom:vertex2 toVertex:vertex1];
    
    [graph addVertexFrom:vertex3 toVertex:vertex2];
    [graph addVertexFrom:vertex3 toVertex:vertex4];
    
    [graph dfs:vertex0];
    [graph printAdjacencyList];
}

- (void)ZJBfs{
    ZJVertex *vertex0 = [[ZJVertex alloc] initWithIndex:@(0) data:@(0)];
    ZJVertex *vertex1 = [[ZJVertex alloc] initWithIndex:@(1) data:@(1)];
    ZJVertex *vertex2 = [[ZJVertex alloc] initWithIndex:@(2) data:@(2)];
    ZJVertex *vertex3 = [[ZJVertex alloc] initWithIndex:@(3) data:@(3)];
    ZJVertex *vertex4 = [[ZJVertex alloc] initWithIndex:@(4) data:@(4)];
    ZJVertex *vertex5 = [[ZJVertex alloc] initWithIndex:@(5) data:@(5)];
    
    ZJGraph *graph = [[ZJGraph alloc] initWithVertex:vertex0];
    
    [graph addVertexFrom:vertex0 toVertex:vertex1];
    [graph addVertexFrom:vertex0 toVertex:vertex4];
    [graph addVertexFrom:vertex0 toVertex:vertex5];
    
    [graph addVertexFrom:vertex1 toVertex:vertex3];
    [graph addVertexFrom:vertex1 toVertex:vertex4];
    
    [graph addVertexFrom:vertex2 toVertex:vertex1];
    
    [graph addVertexFrom:vertex3 toVertex:vertex2];
    [graph addVertexFrom:vertex3 toVertex:vertex4];
    
    [graph bfs:vertex0];
    [graph printAdjacencyList];
}

@end
