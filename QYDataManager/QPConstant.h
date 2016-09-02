//
//  QPConstant.h
//  QYDataManager
//
//  Created by 舒小明 on 16/8/22.
//  Copyright © 2016年 舒小明. All rights reserved.
//

#ifndef QPConstant_h
#define QPConstant_h

#define QP_SINGLETION(__clazz) \
+ (__clazz *)sharedInstance;

#define QP_DEF_SINGLETION(__clazz) \
+ (__clazz *)sharedInstance \
{\
static dispatch_once_t once; \
static __clazz * __singletion;\
dispatch_once(&once,^{__singletion = [[__clazz alloc] init];});\
return __singletion;\
}


#endif /* QPConstant_h */
