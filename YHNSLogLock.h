//
//  YHNSLogLock.h
//  UITableViewDemo
//
//  Created by ruaho on 2019/6/27.
//  Copyright © 2019 ruaho. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 * 覆盖系统的 NSLog 函数
 */
#define NSLog(...) YHTestLog(__VA_ARGS__)

@interface YHNSLogLock : NSObject {
@public
    BOOL _customLock;// 默认上锁
    BOOL _systemLock;// 默认解锁
}

FOUNDATION_EXPORT void YHTestLog(NSString *format, ...);

/*
 * 单例方法
 */
+ (instancetype)sharedInstance;

/*
 * 自己打印上锁
 */
+ (void)customLock;
/*
 * 自己打印解锁
 */
+ (void)customUnLock;

/*
 * 系统打印上锁
 */
+ (void)systemLogLock;
/*
 * 系统打印解锁
 */
+ (void)systemLogUnLock;


@end

