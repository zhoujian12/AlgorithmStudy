//
//  ZJArrayTestVc.m
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/10/25.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import "ZJArrayTestVc.h"

@interface ZJArrayTestVc ()

@property (nonatomic) UIScrollView *scrollView;

@end

@implementation ZJArrayTestVc{
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
        @"1.1 测试NSMutableArray的扩容机制",
        @"1.2 警惕数组的访问越界问题",
        @"1.3 打开设置",
        @"2. 打开wifi",
        @"3. todo",
        @"4. todo",
        @"1.2 iOS14之前 获取IDFA",
        @"1.3 打开设置",
        @"2. 打开wifi",
        @"3. todo",
        @"4. todo",
        @"1.2 iOS14之前 获取IDFA",
        @"1.3 打开设置",
        @"2. 打开wifi",
        @"3. todo",
        @"4. todo",
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
        [self.scrollView addSubview:button];
    }
    
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(UIScreenWidth, 100 + (buttonHeight+buttonGap)*_titleArray.count + buttonHeight + 100);
}

- (void)buttonClick:(UIButton *)button {
    NSInteger buttonTag = button.tag;
    switch (buttonTag) {
        case 1000: {
            [self testArrM];
        }
            break;
        case 1001: {
            [self testBeyondArrayCount];
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

#pragma mark - 1.1 测试NSMutableArray的扩容机制
- (void)testArrM{
    NSString *str = @"11";
    NSLog(@"字符串常量的地址  %p", str);
    NSArray *array = @[str, str, str, str, str,str];
    // 字符串常量的地址  0x10063c2b8
    
    NSMutableArray *muArray = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < 10; i ++) {
        [muArray addObject:@"11"];
    }
    
    
    //https://blog.csdn.net/u012886093/article/details/90767481?utm_medium=distribute.pc_relevant.none-task-blog-title-7&spm=1001.2101.3001.4242
    // __NSArrayM 用了环形缓冲区 (circular buffer)
    
    //swift 讲解动态扩容 https://www.jianshu.com/p/cf9156afb33b
}

#pragma mark - 1.2 警惕数组的访问越界问题
- (void)testBeyondArrayCount{
    int i = 0;
    int arr[3] = {0};
    //i<=3 时数组越界；c语言数组越界不会报错
    for(; i<3; i++){
        arr[i] = 0;
        printf("hello world\n");
    }
}

#pragma mark - leetcode_15: https://leetcode-cn.com/problems/3sum/
//解题： https://leetcode-cn.com/problems/3sum/solution/leetcode15san-shu-zhi-he-wei-0-by-ma-xiao-yang-2/
- (void)testThreeSumWithNums{
    NSArray *nums = @[@-1,@0,@1,@2,@-1,@-4];
    
}

- (NSArray<NSArray<NSNumber *> *> *)threeSumWithNums:(NSArray<NSNumber *> *)nums{
    NSMutableArray *mutableArr = [@[@[]] mutableCopy];
    if (nums.count < 3) {
        return mutableArr;
    }
    
    
    return mutableArr;
}

#pragma mark - 快速排序 https://www.jianshu.com/p/65b5d66e5c72
- (void)quickSortArray:(NSMutableArray *)arr withLeft:(NSInteger)left andRight:(NSInteger)right{
    if (left >= right) { //数组长度为0或1时返回
        return;
    }
    
    NSInteger i = left;
    NSInteger j = right;
    NSInteger key = [arr[i] integerValue]; 
    
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor orangeColor];
        _scrollView.frame = CGRectMake(0, 80, UIScreenWidth, UIScreenHeigh - 80);
    }
    return _scrollView;
}
@end



/*
 error: module importing failed: Traceback (most recent call last):
   File "<string>", line 1, in <module>
   File "/usr/local/opt/chisel/libexec/fblldb.py", line 93
     print 'Whoops! You are missing the <' + arg.argName + '> argument.'
           ^
 SyntaxError: Missing parentheses in call to 'print'. Did you mean print('Whoops! You are missing the <' + arg.argName + '> argument.')?
 
 fix : https://www.jianshu.com/p/463f61eb3917
 
 */
