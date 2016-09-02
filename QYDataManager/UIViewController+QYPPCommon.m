//
//  UIViewController+QYPPCommon.m
//
//  截取Vc 出现 消失事件 处理数据
//
//  Created by 舒小明 on 16/8/19.
//  Copyright © 2016年 舒小明. All rights reserved.
//

#import "UIViewController+QYPPCommon.h"
#import <objc/runtime.h>
#import "QPDataManager.h"

@implementation UIViewController (QYPPCommon)

+ (void)load
{
    [self swizzleMethod:[self class] originalSelector:@selector(viewWillDisappear:) swizzledSelector:@selector(swizzled_viewWillDisappear:)];
    [self swizzleMethod:[self class] originalSelector:@selector(viewDidAppear:) swizzledSelector:@selector(swizzled_viewDidAppear:)];

}

+ (void)swizzleMethod:(Class)class
     originalSelector:(SEL) originalSelector
     swizzledSelector:(SEL) swizzledSelector
{
    // the method might not exist in the class, but in its superclass
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);    // class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));    // the method doesn’t exist and we just added one
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

// 在VC 出现和消失时绑定数据管理单例

- (void)swizzled_viewWillDisappear:(BOOL)animated
{
    [self swizzled_viewWillDisappear:animated];
    [[QPDataManager sharedInstance] bindViewController:self disappear:YES];
}

- (void)swizzled_viewDidAppear:(BOOL)animated
{
    [self swizzled_viewDidAppear:animated];
    [[QPDataManager sharedInstance] bindViewController:self];
}

@end
