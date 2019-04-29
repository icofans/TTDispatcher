//
//  TTDispatcher.h
//  TTDispatcher
//
//  Created by 王家强 on 2019/4/3.
//  Copyright © 2019 王家强. All rights reserved.
//

// 使用@dispacher 去注册appdelegte，实现appdelegate生命周期方法

#ifndef TTDispatcher_h
#define TTDispatcher_h

#import "TTDispatcherManager.h"


#define dispatcher(...) \
compatibility_alias _TTDispatcherManager TTDispatcherManager;\
+ (void)load \
{ \
    dispatcher_register_modules(__VA_ARGS__); \
}

#define dispatcher_register_modules(...)\
dispatcher_metamacro_foreach(dispatcher_register_module, __VA_ARGS__)

#define dispatcher_metamacro_foreach(Marco, ...)\
dispatcher_metamacro_concat(dispatcher_metamacro_foreach, dispatcher_metamacro_argcount(__VA_ARGS__))(Marco,__VA_ARGS__)

#define dispatcher_metamacro_foreach20(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14, _15, _16, _17, _18, _19)\
dispatcher_metamacro_foreach19(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14, _15, _16, _17, _18)\
Marco(_19, 19)

#define dispatcher_metamacro_foreach19(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14, _15, _16, _17, _18)\
dispatcher_metamacro_foreach18(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14, _15, _16, _17)\
Marco(_18, 18)

#define dispatcher_metamacro_foreach18(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14, _15, _16, _17)\
dispatcher_metamacro_foreach17(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14, _15, _16)\
Marco(_17, 17)

#define dispatcher_metamacro_foreach17(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14, _15, _16)\
dispatcher_metamacro_foreach16(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14, _15)\
Marco(_16, 16)

#define dispatcher_metamacro_foreach16(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14, _15)\
dispatcher_metamacro_foreach15(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14)\
Marco(_15, 15)

#define dispatcher_metamacro_foreach15(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14)\
dispatcher_metamacro_foreach14(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13)\
Marco(_14, 14)

#define dispatcher_metamacro_foreach14(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13)\
dispatcher_metamacro_foreach13(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12)\
Marco(_13, 13)

#define dispatcher_metamacro_foreach13(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12)\
dispatcher_metamacro_foreach12(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11)\
Marco(_12, 12)

#define dispatcher_metamacro_foreach12(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11)\
dispatcher_metamacro_foreach11(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10)\
Marco(_11, 11)

#define dispatcher_metamacro_foreach11(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10)\
dispatcher_metamacro_foreach10(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9)\
Marco(_10, 10)

#define dispatcher_metamacro_foreach10(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8, _9)\
dispatcher_metamacro_foreach9(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8)\
Marco(_9, 9)

#define dispatcher_metamacro_foreach9(Marco, _0, _1, _2, _3, _4, _5, _6, _7, _8)\
dispatcher_metamacro_foreach8(Marco, _0, _1, _2, _3, _4, _5, _6, _7)\
Marco(_8, 8)

#define dispatcher_metamacro_foreach8(Marco, _0, _1, _2, _3, _4, _5, _6, _7)\
dispatcher_metamacro_foreach7(Marco, _0, _1, _2, _3, _4, _5, _6)\
Marco(_7, 7)

#define dispatcher_metamacro_foreach7(Marco, _0, _1, _2, _3, _4, _5, _6)\
dispatcher_metamacro_foreach6(Marco, _0, _1, _2, _3, _4, _5)\
Marco(_6, 6)

#define dispatcher_metamacro_foreach6(Marco, _0, _1, _2, _3, _4, _5)\
dispatcher_metamacro_foreach5(Marco, _0, _1, _2, _3, _4)\
Marco(_5, 5)

#define dispatcher_metamacro_foreach5(Marco, _0, _1, _2, _3, _4)\
dispatcher_metamacro_foreach4(Marco, _0, _1, _2, _3)\
Marco(_4, 4)

#define dispatcher_metamacro_foreach4(Marco, _0, _1, _2, _3)\
dispatcher_metamacro_foreach3(Marco, _0, _1, _2)\
Marco(_3, 3)

#define dispatcher_metamacro_foreach3(Marco, _0, _1, _2)\
dispatcher_metamacro_foreach2(Marco, _0, _1)\
Marco(_2, 2)

#define dispatcher_metamacro_foreach2(Marco, _0, _1)\
dispatcher_metamacro_foreach1(Marco, _0)\
Marco(_1, 1)

#define dispatcher_metamacro_foreach1(Marco, _0)\
Marco(_0, 0)

#define dispatcher_register_module(class, Index)\
[[TTDispatcherManager shareInstance] registerAppDelegateModule:NSClassFromString(class)];

#define dispatcher_metamacro_concat(A, B) \
dispatcher_metamacro_concat_(A, B)

#define dispatcher_metamacro_concat_(A, B) A ## B //表示连接A和B,结果是AB

//传入N个参数,获得参数的个数: N
#define dispatcher_metamacro_argcount(...) \
dispatcher_metamacro_at(20, __VA_ARGS__, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)

#define dispatcher_metamacro_at(N, ...) \
dispatcher_metamacro_concat_(dispatcher_metamacro_at, 20)(__VA_ARGS__, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)

#define dispatcher_metamacro_at20(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14, _15, _16, _17, _18, _19, ...) dispatcher_metamacro_head(__VA_ARGS__)

#define dispatcher_metamacro_head(...) \
dispatcher_metamacro_head_(__VA_ARGS__, 0)

//得到结果: 参数个数
#define dispatcher_metamacro_head_(FIRST, ...) FIRST

/**
 1. 使用宏
 @dispatcher(@"TTMainModule",@"TTTestModule")
 
 2. 使用方法
 + (void)load
 {
    [[TTDispatcherManager shareInstance] registerAppDelegateModules:@"TTMainModule",@"TTTestModule", nil];
 }
 */

#endif

