//
//  SecondViewController.m
//  QYDataManager
//
//  Created by 舒小明 on 16/8/21.
//  Copyright © 2016年 舒小明. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "QPDataManager.h"

@implementation SecondViewController

- (void)dealloc
{
    NSLog(@"SecondViewCtrl dealloc");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"SecondViewCtrl appear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"SecondViewCtrl didAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createUI];
    [self getData];
}

- (void)getData
{
    BOOL bCrreateValue = [[[QPDataManager sharedInstance] getValueWithKey:kViewControllerDatabCreate] boolValue];
    NSString *lastPageValue = [[QPDataManager sharedInstance] getValueWithKey:kViewControllerDataLastPage];
    NSArray *arrNormalDataValue = [[QPDataManager sharedInstance] getValueWithKey:kViewControllerDataArrNormal];
    NSArray *arrModelData = [[QPDataManager sharedInstance] getValueWithKey:kViewControllerDataArrModel];
    NSString *idNumber = [[QPDataManager sharedInstance] getValueWithKey:kViewControllerDataIdNumber];
}

- (void)createUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"Enter" forState:UIControlStateNormal];
    btn.frame = (CGRect){0, 100, 100, 30};
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn1 setTitle:@"Dismiss" forState:UIControlStateNormal];
    btn1.frame = (CGRect){0, 200, 100, 30};
    [btn1 addTarget:self action:@selector(btnClick1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

- (void)btnClick:(id)sender
{
    ThirdViewController *thirdVirewCtrl = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdVirewCtrl animated:YES];
}

- (void)btnClick1:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
