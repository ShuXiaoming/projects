//
//  QPModel.m
//  QYDataManager
//
//  Created by 舒小明 on 16/8/19.
//  Copyright © 2016年 舒小明. All rights reserved.
//

#import "QPModel.h"

@implementation QPModel

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _name = @"xiaoyi";
        _age = 12;
        _arrScore = @[@"1", @"2", @"3", @"4"];
    }
    return self;
}

@end
