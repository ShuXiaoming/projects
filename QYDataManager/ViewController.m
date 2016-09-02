//
//  ViewController.m
//  数据管理中心
//
//  Created by 舒小明 on 16/8/17.
//  Copyright © 2016年 舒小明. All rights reserved.
//

#import "ViewController.h"
#import "QPModel.h"
#import "QPDataManager.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    
}

@property (nonatomic, assign) BOOL                  bCreate;
@property (nonatomic, strong) NSString              *lastPage;
@property (nonatomic, strong) NSMutableArray        *arrNormalData;
@property (nonatomic, strong) NSMutableArray        *arrModelData;
@property (nonatomic, strong) QPModel               *model;

@end

@implementation ViewController

-(void)dealloc
{
    NSLog(@"ViewController dealloc");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self getData];
    [self getThirdData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self loadData];
    [self getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)createUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"Click" forState:UIControlStateNormal];
    btn.frame = (CGRect){0, 100, 100, 30};
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

// 运行时 根据 QPConfigurationShareInstance 存数据
// 取数据 根据 相应 Key 取

- (void)loadData
{
    _bCreate = YES;
    _lastPage = @"circle";
    _arrNormalData = [NSMutableArray arrayWithObjects:@[@"1", @"2", @"3"], nil];
    
    _model = [[QPModel alloc] init];
    _model.age = 20;
    _model.name = @"xiaoming";
    _model.arrScore = @[@"10", @"20", @"30"];
    
    _arrModelData = [NSMutableArray array];
    for (int i = 0; i < 3; i++)
    {
        QPModel *model = [[QPModel alloc] init];
        model.age = 20;
        model.name = @"xiaoming";
        model.arrScore = @[@"10", @"20", @"30"];
        [_arrModelData addObject:model];
    }
}

- (void)getThirdData
{
    BOOL bCrreateValue = [[[QPDataManager sharedInstance] getValueWithKey:kThirdViewControllerDatabCreate] boolValue];
    NSString *lastPageValue = [[QPDataManager sharedInstance] getValueWithKey:kThirdViewControllerDataLastPage];
    NSArray *arrNormalDataValue = [[QPDataManager sharedInstance] getValueWithKey:kThirdViewControllerDataArrNormal];
    NSString *idNumber = [[QPDataManager sharedInstance] getValueWithKey:kThirdViewControllerDataIdNumber];
    
}

- (void)getData
{
    BOOL bCrreateValue = [[[QPDataManager sharedInstance] getValueWithKey:kViewControllerDatabCreate] boolValue];
    NSString *lastPageValue = [[QPDataManager sharedInstance] getValueWithKey:kViewControllerDataLastPage];
    NSString *modelName = [[QPDataManager sharedInstance] getValueWithKey:kViewControllerDataModelName];

    NSArray *arrNormalDataValue = [[QPDataManager sharedInstance] getValueWithKey:kViewControllerDataArrNormal];
    NSArray *arrModelData = [[QPDataManager sharedInstance] getValueWithKey:kViewControllerDataArrModel];

    NSString *idNumber = [[QPDataManager sharedInstance] getValueWithKey:kViewControllerDataIdNumber];
}

- (void)btnClick:(id)sender
{
    SecondViewController *secondViewCtrl = [[SecondViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:secondViewCtrl];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
