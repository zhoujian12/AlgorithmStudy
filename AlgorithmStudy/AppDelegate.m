//
//  AppDelegate.m
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/8/30.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import "AppDelegate.h"
#import "MyDimeScale.h"
#import "HomeTableVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [MyDimeScale setUITemplateSize:CGSizeMake(375, 667)];
    
     self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
     self.window.backgroundColor = [UIColor whiteColor];
         
//     ViewController1 *vc = [[ViewController1 alloc] init];
    
    HomeTableVC *vc = [[HomeTableVC alloc] init];
    
     UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
     self.window.rootViewController = nav;
         
     [self.window makeKeyAndVisible];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [super touchesEnded:touches withEvent:event];
    
    //为了测试使用。主要用于方便通过present出来的VC返回用。
    CGPoint pt =  [touches.anyObject locationInView:self.window];
    
    if (pt.y < 20 && pt.x > 0 && pt.x < 100)
    {
        [self.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
    }
    
}

@end
