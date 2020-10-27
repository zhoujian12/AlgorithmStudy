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

/*
 2020-10-25 20:06:18.418803+0800 AlgorithmStudy[77600:2780041] w :abc w 的地址: 0x103691178
 2020-10-25 20:06:18.419420+0800 AlgorithmStudy[77600:2780041] j 的地址: 0x103695d20
 2020-10-25 20:06:18.419579+0800 AlgorithmStudy[77600:2780041] s : 0x7ffeec580c60
 
 2020-10-25 20:07:23.080591+0800 AlgorithmStudy[77639:2781238] w :abc w 的地址: 0x10f422178
 2020-10-25 20:07:23.082343+0800 AlgorithmStudy[77639:2781238] j 的地址: 0x10f426d20
 2020-10-25 20:07:23.082544+0800 AlgorithmStudy[77639:2781238] s : 0x7ffee07efc60
 */

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    
    //MARK: app每次启动 main函数地址是否有发生变化
    /*
     1. w :abc w 的地址: 0x102b2c090
     2. w :abc w 的地址: 0x10c476090
     */
//    NSString *w = @"abc";
//    w = @"bcd";
    
//    NSLog(@"w :%@ w 的地址: %p",w,&w);
//    NSLog(@"j 的地址: %p",&j);
    
    
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        
        //https://blog.csdn.net/durbin86/article/details/12951939
        //MARK: app每次启动 main函数地址是否有发生变化,  栈基址每次都不一样
        /*
         1. s : 0x7ffee2becc80
         2. s : 0x7ffeed9a9c80
         **/
        
//        NSString *s = @"abc";
//        NSLog(@"s : %p",&s);
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));

    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
