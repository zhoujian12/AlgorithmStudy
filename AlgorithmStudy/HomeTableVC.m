//
//  HomeTableVC.m
//  AlgorithmStudy
//
//  Created by jianz3 on 2020/8/30.
//  Copyright © 2020 jianz3.com. All rights reserved.
//

#import "HomeTableVC.h"
#import "CFTool.h"
#import "DetailViewController.h"

@interface HomeTableVC ()
@property(nonatomic, strong) NSArray *demoTypeList;

@end

@implementation HomeTableVC

-(NSArray*)demoTypeList
{
    if (_demoTypeList == nil)
    {
        _demoTypeList = @[@{@"type_title":@"堆算法",
                            @"type_vclist":@[@{@"title":NSLocalizedString(@"1.优先级队列", @""),
                                               @"class":[NSClassFromString(@"PriorityQueueVC")  class]
                            },
                                             @{@"title":NSLocalizedString(@"2利用堆求 Top K", @""),
                                               @"class":[NSClassFromString(@"TopKVc")  class]
                                             }
                            ]
        },@{@"type_title":@"iOS 常见问题",
            @"type_vclist":@[@{@"title":NSLocalizedString(@"1. NSNotification是同步还是异步，如何验证", @""),
                               @"class":[NSClassFromString(@"ZJNSNotificationVc")  class]
            },
                             @{@"title":NSLocalizedString(@"2. MRC下如何实现weak的功能", @""),
                               @"class":[NSClassFromString(@"TopKVc")  class]
                             }
            ]
        },@{@"type_title":@"iOS 技术需求",
            @"type_vclist":@[@{@"title":NSLocalizedString(@"1. iOS系统的各种设备识别码", @""),
                               @"class":[NSClassFromString(@"ZJIosIdentifierVC")  class]
            }
            ]
        }];
        
    }
    return _demoTypeList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = NSLocalizedString(@"Category",@"");
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[CFTool font:15],NSForegroundColorAttributeName:[CFTool color:4]};
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    tipLabel.text = @"如果您在模拟器中运行时看到的不是中文则请到系统设置里面将语言设置为中文(english ignore this text)";
    tipLabel.font = [CFTool font:16];
    tipLabel.numberOfLines = 0;
    tipLabel.adjustsFontSizeToFitWidth = YES;
    self.tableView.tableHeaderView = tipLabel;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.demoTypeList.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"test"];
    
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.font = [CFTool font:15];
    cell.textLabel.textColor = [CFTool color:4];
    cell.textLabel.text = self.demoTypeList[indexPath.row][@"type_title"];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    
    //    cell.imageView.image = [UIImage imageNamed:self.demoTypeList[indexPath.row][@"type_desc"]];
    return cell;
    
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *detailVC = [[DetailViewController alloc] initWithDemoVCList:self.demoTypeList[indexPath.row][@"type_vclist"]];
    detailVC.title = self.demoTypeList[indexPath.row][@"type_title"];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

@end
