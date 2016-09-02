//
//  QPDataManager.h
//
//  全局数据存储单例
//
//  Created by 舒小明 on 16/8/19.
//  Copyright © 2016年 舒小明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "QPConstant.h"
#import "QPConfigurationtionSetting.h"

@class QPConfigurationShareInstance;

@interface QPDataManager : NSObject


QP_SINGLETION(QPDataManager);

@property (nonatomic, weak) UIViewController       *curViewCtrl;

- (id)getValueWithKey:(NSString *)key;

- (void)bindViewController:(UIViewController *)vc;

- (void)bindViewController:(UIViewController *)vc
                 disappear:(BOOL)bDisappear;

- (void)unbundlingViewController:(UIViewController *)vc;

@end
