//
//  Validate.m
//  BusApp
//
//  Created by jiaojiao on 7/10/14.
//  Copyright (c) 2014 qianxingwuyou. All rights reserved.
//

#import "Validate.h"

@implementation Validate

// 邮箱
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

// 手机号码验证
+ (BOOL)validateMobile:(NSString *)str
{
    // NSString *regex = @"^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$";
    NSString *regex = @"^[0-9]{11}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:str];
}

// 用户名
+ (BOOL)validateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{2,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    return [userNamePredicate evaluateWithObject:name];
}

// 密码
+ (BOOL)validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}

// 昵称
+ (BOOL)validateNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^[a-zA-Z0-9\u4e00-\u9fa5]{2,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}

// 纯数字
+ (BOOL)validateNumber:(NSString *)numberString
{
    NSString *numberRegex = @"^[0-9]+$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",numberRegex];
    return [numberPre evaluateWithObject:numberString];
}

// 纯英文
+ (BOOL)validateEnglish:(NSString *)english
{
    NSString *englishRegex = @"^[A-Za-z]+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",englishRegex];
    return [userNamePredicate evaluateWithObject:english];
}

/// 座机号码
+ (BOOL)validatePhoneNumber:(NSString *)string
{
    NSString *number = @"^(\\d{3,4}-)\\d{7,8}$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [numberPre evaluateWithObject:string];
}

/// 整数或小数
+ (BOOL)validateIntOrDouble:(NSString *)string
{
    NSString *number = @"^[0-9]+([.]{0,1}[0-9]+){0,1}$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [numberPre evaluateWithObject:string];
}

// 验证是否填写
+ (BOOL)validateInfoWrite:(NSString *)string
{
    if ([[string stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0) {
        return NO;
    }
    return YES;
}


@end
