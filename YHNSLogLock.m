//
//  YHNSLogLock.m
//  UITableViewDemo
//
//  Created by ruaho on 2019/6/27.
//  Copyright © 2019 ruaho. All rights reserved.
//

#import "YHNSLogLock.h"

@implementation YHNSLogLock

void YHBaseTestLog(NSString *str,...){
    //参数列
    va_list list;
    va_start(list, str);
    //这个地方是一个锁，后面会介绍
    if (![YHNSLogLock sharedInstance]->_systemLock) {
        //进行打印
        NSLogv(str, list);
    }
    va_end(list);
}

/*
 * 单例方法
 */
+ (instancetype)sharedInstance {
    static YHNSLogLock *shared = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        shared = [[YHNSLogLock alloc] init];
    });
    return shared;
}

- (instancetype)init {
    if (self = [super init]) {
        _customLock = YES;
        _systemLock = NO;
    }
    return self;
}

/*
 * 自己打印上锁
 */
+ (void)customLock{
    [YHNSLogLock sharedInstance]->_customLock = YES;
}
/*
 * 自己打印解锁
 */
+ (void)customUnLock{
    [YHNSLogLock sharedInstance]->_customLock = NO;
}

/*
 * 系统打印上锁
 */
+ (void)systemLogLock {
    [YHNSLogLock sharedInstance]->_systemLock = YES;
}
/*
 * 系统打印解锁
 */
+ (void)systemLogUnLock {
    [YHNSLogLock sharedInstance]->_systemLock = NO;
}


@end
