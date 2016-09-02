//
//  Introduce.h
//
//  思路介绍
//
//  Created by 舒小明 on 16/8/19.
//  Copyright © 2016年 舒小明. All rights reserved.
//

#ifndef Introduce_h
#define Introduce_h

/*
 目的：获取任意 VC 的属性值
 
 说明：
 通过 QPDataManager 这个单例的方法 getValueWithKey：key
 
 注：重要！！！！！！！
 规则：这个key 定义在QPConfigurationtionSetting中， 以VC的类名开头接下划线后面再接属性名， 多层的以点.连接
 如： ViewController_bCreate、 ViewController_model.name 
 
 需要获取哪个vc的属性， 对应在QPConfigurationtionSetting 添加相应的常量字符串，要按着上面的规则来。
 
 好处：简化多个类间的值传递问题， 避免增多对外暴露属性带来的扩展问题，应该还有其他好处... ^_^  从此不再为取值烦恼，甚至对外暴露的属性也不用写了。 ps：单例中同时持有当前 vc 和 上一个vc 两个对象。 可以对一般页面结构， 但对复杂的，比如多个子 vc 叠一块 放在父vc上的情况不满足。
 
 */

#endif /* Introduce_h */
