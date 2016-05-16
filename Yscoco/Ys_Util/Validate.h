//
//  Validate.h
//  BusApp
//
//  Created by jiaojiao on 7/10/14.
//  Copyright (c) 2014 qianxingwuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validate : NSObject

// 邮箱
+ (BOOL)validateEmail:(NSString *)email;

// 手机号码验证
+ (BOOL)validateMobile:(NSString *)mobile;

// 用户名
+ (BOOL)validateUserName:(NSString *)name;

// 密码
+ (BOOL)validatePassword:(NSString *)passWord;

// 昵称
+ (BOOL)validateNickname:(NSString *)nickname;

// 纯数字
+ (BOOL)validateNumber:(NSString *)numberString;

// 纯英文
+ (BOOL)validateEnglish:(NSString *)english;

/// 座机号码
+ (BOOL)validatePhoneNumber:(NSString *)string;

/// 整数或小数
+ (BOOL)validateIntOrDouble:(NSString *)string;

// 验证是否填写
+ (BOOL)validateInfoWrite:(NSString *)string;

@end
