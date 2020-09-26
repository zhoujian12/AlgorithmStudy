//
//  ZJIosIdentifierVC.m
//  AlgorithmStudy
//
//  Created by ZhouJian on 2020/9/21.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import "ZJIosIdentifierVC.h"
//for idfa
#import <AdSupport/AdSupport.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@interface ZJIosIdentifierVC ()

@end

@implementation ZJIosIdentifierVC{
    NSArray *_titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"ZJIosIdentifierVC";
    
    [self setupDataSource];
    
    [self setupUI];
    
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    
    //已废弃，不能调用
    //    NSString *udid = [[UIDevice currentDevice] uniqueIdentifier];
    
    //uuid = idfv
    NSUUID *uuid = [[UIDevice currentDevice] identifierForVendor];
    NSString *uuidOrIDFVStr = uuid.UUIDString;
    
    NSLog(@"\n systemVersion : %@ \n uuidOrIDFVStr: %@  \n idfaString: %@ \n",systemVersion,uuidOrIDFVStr,[ZJIosIdentifierVC idfaString]);
}

- (void)setupDataSource {
    _titleArray = @[
        @"1.1 iOS14 获取IDFA",
        @"1.2 iOS14之前 获取IDFA",
        @"1.3 打开设置",
        @"2. 打开wifi",
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
            [self testIDFAinIos14];
        }
            break;
        case 1001: {
            [self testIDFABeforeIos14];
        }
            break;
        case 1002: {
            [self openSettings];
        }
            break;
        case 1003: {
            [self openAdsTracking];
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

- (void)testIDFAinIos14{
    /*
     AlgorithmStudy[2593:784797] [access] This app has crashed because it attempted to access privacy-sensitive data without a usage description.  The app's Info.plist must contain an NSUserTrackingUsageDescription key with a string value explaining to the user how the app uses this data.
     */
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            
            switch (status) {
                case ATTrackingManagerAuthorizationStatusDenied:
                    NSLog(@"用户拒绝");
                    break;
                case ATTrackingManagerAuthorizationStatusAuthorized:
                    NSLog(@"用户允许");
                    break;
                case ATTrackingManagerAuthorizationStatusNotDetermined:
                    NSLog(@"用户为做选择或未弹窗");
                    break;
                default:
                    break;
            }
            
            NSString *idfaString = [[ASIdentifierManager sharedManager] advertisingIdentifier].UUIDString;
            NSLog(@"testIDFAinIos14 --- : %@", idfaString);
        }];
    } else {
        // 使用原方式访问 IDFA
        [self testIDFABeforeIos14];
    }
    
}

- (void)testIDFABeforeIos14{
    if (@available(iOS 14, *)) {
        NSString *idfaString = [[ASIdentifierManager sharedManager] advertisingIdentifier].UUIDString;
        NSLog(@"testIDFABeforeIos14 --- : %@", idfaString);
    }else{
        
        if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
            NSString *idfaString = [[ASIdentifierManager sharedManager] advertisingIdentifier].UUIDString;
            NSLog(@"testIDFABeforeIos14 --- : %@", idfaString);
        }else{
            NSLog(@"用户打开了限制广告跟踪");
        }
    }
}

+ (NSString *)idfaString {
    
    NSString *newIdfaString = nil;
    NSString *originalIdfa = [ZJIosIdentifierVC originalIdfaString];
    BOOL isValid = [[originalIdfa stringByReplacingOccurrencesOfString:@"-" withString:@""] stringByReplacingOccurrencesOfString:@"0" withString:@""].length;
    if (isValid) {
        //不为空，将IDFA作为唯一标识
        newIdfaString = originalIdfa;
    } else {
        // 广告追踪被关闭，idfa为空，获取idfv作为唯一标识
        newIdfaString = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    
    return newIdfaString;
}

+ (NSString *)originalIdfaString {
    NSString *idfaString = nil;
    if ([ASIdentifierManager sharedManager].advertisingTrackingEnabled) {
        idfaString = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
    } else {
        idfaString = @"";
    }
    
    return idfaString;
}

+ (NSString *)idfvString {
    static NSString *newIdfvString = nil;
    if (newIdfvString == nil) {
        if ([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
            newIdfvString = [[UIDevice currentDevice].identifierForVendor UUIDString];
        } else {
            newIdfvString = @"";
        }
    }
    return newIdfvString;
}

//https://blog.csdn.net/ws1352864983/article/details/73480880
- (void)openSettings{
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];

    if([[UIApplication sharedApplication] canOpenURL:url]) {
    NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];           [[UIApplication sharedApplication] openURL:url];

    }
}

- (void)openAdsTracking{
//    NSURL * url = [NSURL URLWithString:@"wifi://"];
    NSURL * url = [NSURL URLWithString:@"telprompt://"];
    
    if([[UIApplication sharedApplication] canOpenURL:url]) {
    NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];           [[UIApplication sharedApplication] openURL:url];

    }
}

@end
