//
//  QPDataManager.m
//
//  全局数据存储单例
//
//  Created by 舒小明 on 16/8/19.
//  Copyright © 2016年 舒小明. All rights reserved.
//

#import "QPDataManager.h"
#import <objc/runtime.h>

@interface QPDataManager ()

@property (nonatomic, strong) NSMapTable            *mapTableValue;

@end

@implementation QPDataManager

QP_DEF_SINGLETION(QPDataManager);

- (NSMapTable *)mapTableValue
{
    if (_mapTableValue == nil)
    {
        _mapTableValue = [[NSMapTable alloc] initWithKeyOptions:NSPointerFunctionsWeakMemory valueOptions:NSPointerFunctionsWeakMemory  capacity:0];
    }
    return _mapTableValue;
}

- (id)getValueWithKey:(NSString *)key
{
    id value = [self.mapTableValue objectForKey:key];;
    if (value == nil || value == [NSNull null])
    {
        NSRange range = [key rangeOfString:@"ViewController"];
        if (range.location != NSNotFound)
        {
            NSString *strViewCtrlName = [key substringToIndex:range.location + range.length];
            NSString *viewCtrlPropertyName = [key substringFromIndex:range.location + range.length + 1];
            UIViewController *vc = (UIViewController *)[_mapTableValue objectForKey:strViewCtrlName];
            if (vc)
            {
                value = [vc valueForKeyPath:viewCtrlPropertyName];
            }
            if (value)
            {
                [_mapTableValue setObject:value forKey:key];
            }
        }
    }

    return value;
}

- (void)bindViewController:(UIViewController *)vc
{
    [self bindViewController:vc disappear:NO];
}

- (void)bindViewController:(UIViewController *)vc
                 disappear:(BOOL)bDisappear
{
    if([vc isBeingDismissed] || [vc isMovingFromParentViewController])
    {
        [self unbundlingViewController:vc];
        return;
    }
    
    [self.mapTableValue setObject:vc forKey:NSStringFromClass([vc class])];
    
    if (bDisappear)
    {
        [self.mapTableValue setObject:vc forKey:kPreviousViewController];
    }
    else
    {
        [self.mapTableValue setObject:vc forKey:kCurrentViewController];
    }
}

- (void)unbundlingViewController:(UIViewController *)vc
{
    [self.mapTableValue removeObjectForKey:NSStringFromClass([vc class])];
}

@end
