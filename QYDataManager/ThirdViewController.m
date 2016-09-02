//
//  ThirdViewController.m
//  QYDataManager
//
//  Created by 舒小明 on 16/8/21.
//  Copyright © 2016年 舒小明. All rights reserved.
//

#import "ThirdViewController.h"
#import "QPDataManager.h"
#import "QPModel.h"

@interface ThirdViewController ()

@property (nonatomic, assign) BOOL                  bCreateThird;
@property (nonatomic, strong) NSString              *lastPageThird;
@property (nonatomic, strong) NSMutableArray        *arrNormalDataThird;
@property (nonatomic, strong) NSMutableArray        *arrModelDataThird;
@property (nonatomic, strong) QPModel               *modelThird;

@end

@implementation ThirdViewController

- (void)dealloc
{
    NSLog(@"third dealloc");
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
    [self loadData];
}

- (void)getData
{
    BOOL bCrreateValue = [[[QPDataManager sharedInstance] getValueWithKey:kViewControllerDatabCreate] boolValue];
    NSString *lastPageValue = [[QPDataManager sharedInstance] getValueWithKey:kViewControllerDataLastPage];

    BOOL bFather = [[[QPDataManager sharedInstance] getValueWithKey:kSeondViewControllerDatabFather] boolValue];
    NSString *idNumber = [[QPDataManager sharedInstance] getValueWithKey:kSeondViewControllerDataIdNumber];
    NSArray *arrModelData = [[QPDataManager sharedInstance] getValueWithKey:kViewControllerDataArrModel];
}

- (void)loadData
{
    _bCreateThird = YES;
    _lastPageThird = @"circle";
    _arrNormalDataThird = [NSMutableArray arrayWithObjects:@[@"1", @"2", @"3"], nil];
    
    _modelThird = [[QPModel alloc] init];
    _modelThird.age = 20;
    _modelThird.name = @"xiaoming";
    _modelThird.arrScore = @[@"10", @"20", @"30"];
    
    _arrModelDataThird = [NSMutableArray array];
}

- (void)createUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"Click" forState:UIControlStateNormal];
    btn.frame = (CGRect){0, 100, 100, 30};
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


@end
