//
//  main.m
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/8/30.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
static  NSString *const w = @"abc";
int j;


int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    
    //MARK: app每次启动 main函数地址是否有发生变化
    /*
     1. w :abc w 的地址: 0x102b2c090
     2. w :abc w 的地址: 0x10c476090
     */
//    NSString *w = @"abc";
//    w = @"bcd";
    NSLog(@"w :%@ w 的地址: %p",w,&w);
    NSLog(@"j 的地址: %p",&j);
    
    
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        
        https://blog.csdn.net/durbin86/article/details/12951939
        //MARK: app每次启动 main函数地址是否有发生变化,  栈基址每次都不一样
        /*
         1. s : 0x7ffee2becc80
         2. s : 0x7ffeed9a9c80
         **/
        
        NSString *s = @"abc";
        NSLog(@"s : %p",&s);
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));

    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
