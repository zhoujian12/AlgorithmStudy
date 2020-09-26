//
//  ZJNSNotificationVc.m
//  AlgorithmStudy
//
//  Created by ZhouJian on 2020/9/8.
//  Copyright © 2020 jianz3.com. All rights reserved.
//
// NSNotification是同步还是异步？   https://blog.csdn.net/xubinlxb/article/details/52073803

#import "ZJNSNotificationVc.h"

#define kZJNotificationName @"kZJNotificationName"

@interface ZJNSNotificationVc ()

@end

@implementation ZJNSNotificationVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化一个按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"触发通知" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // 注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(actionNotification:)
                                                 name:kZJNotificationName
                                               object:nil];
}

- (void) actionNotification: (NSNotification*)notification
{
    //默认为同步状态
    NSString* message = notification.object;
    NSLog(@"%@",message);
    
    sleep(3);
    
    NSLog(@"通知说话结束:%@",[NSThread currentThread]);
    
    //方法1: 改为异步执行
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSString* message = notification.object;
//        NSLog(@"%@",message);
//
//        sleep(3);
//
//        NSLog(@"通知说话结束:%@",[NSThread currentThread]);
//    });
    
    
}

- (void)buttonDown
{
    //方法: 同步执行
    //    [[NSNotificationCenter defaultCenter] postNotificationName:kZJNotificationName object:@"通知说话开始"];
    
    //如果通知在异步子线程里面发送，那么也会在同一个子线程里面接收消息
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:kZJNotificationName object:@"通知说话开始"];
    });
    
    //方法2: 改为异步执行
    //    NSNotification *notification = [NSNotification notificationWithName:kZJNotificationName
    //                                                                   object:@"通知说话开始"];
    //    [[NSNotificationQueue defaultQueue] enqueueNotification:notification
    //                                                 postingStyle:NSPostASAP];
    
    NSLog(@"按钮说话:%@",[NSThread currentThread]);
    //由于通知事件执行完后才会继续调用按钮其余的代码，故判断通知是同步的
}

@end
