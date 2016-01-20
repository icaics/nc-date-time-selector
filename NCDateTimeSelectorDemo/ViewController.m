//
//  ViewController.m
//  NCDateTimeSelectorDemo
//
//  Created by 菜酱 on 16/1/20.
//  Copyright © 2016年 菜酱. All rights reserved.
//

#import "ViewController.h"
#import "NCDateTimeSelectView.h"

@interface ViewController () <SelectDateTimeDelegate>

@property (nonatomic, strong) UIButton * btnSelectDateTime;
@property (nonatomic, strong) UILabel * labDateTime;
@property (nonatomic, strong) NCDateTimeSelectView * dateTimeSelectView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 选择界面
    CGRect viewRect = CGRectMake(0, self.view.bounds.size.height - 310, self.view.frame.size.width, 310);
    _dateTimeSelectView = [[NCDateTimeSelectView alloc] initWithFrame:viewRect];
    _dateTimeSelectView.delegateGetDate = self;
    [self.view addSubview:_dateTimeSelectView];
    _dateTimeSelectView.hidden = YES;
    // 操作按钮
    _btnSelectDateTime = [[UIButton alloc] init];
    _btnSelectDateTime.frame = CGRectMake(self.view.frame.size.width / 2 - 100, 100, 200, 40);
    _btnSelectDateTime.backgroundColor = [UIColor redColor];
    [_btnSelectDateTime setTitle:@"选择时间" forState:UIControlStateNormal];
    [_btnSelectDateTime addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnSelectDateTime];
    // 显示结果显示
    _labDateTime = [[UILabel alloc] init];
    _labDateTime.frame = CGRectMake(_btnSelectDateTime.frame.origin.x, 160, 200, 40);
    _labDateTime.textColor = [UIColor blackColor];
    _labDateTime.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_labDateTime];
}

#pragma mark 代理方法
- (void)getDate:(NSMutableDictionary *)dictDate {
    NSLog(@"获取的时间信息是：%@", dictDate);
    _labDateTime.text = [dictDate objectForKey:@"time"];
}

- (void)cancelDate {
    _dateTimeSelectView.hidden = YES;
}

#pragma mark -
- (void)clickBtn {
    _dateTimeSelectView.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
