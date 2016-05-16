
//
//  Util.m
//  AdvertisingGod
//
//  Created by Ren on 15/6/11.
//  Copyright (c) 2015年 Rocky. All rights reserved.
//

#import "Util.h"

@implementation Util

// 时间转换成毫秒
+ (NSTimeInterval)getTime
{
    NSTimeInterval millisecond = [[NSDate date] timeIntervalSince1970];
    return millisecond;
}

// 获得document
+ (NSString *)documentsPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

// 读取工程文件
+ (NSString *)ProductPath:(NSString*)filename {
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@""];
    return  path;
}

// 获得document文件路径，名字方便记忆
+ (NSString *)DocumentPath:(NSString *)filename {
    NSString *documentsPath = [self documentsPath];
    return [documentsPath stringByAppendingPathComponent:filename];
}

// 获得document文件路径
+ (NSString *)fullpathOfFilename:(NSString *)filename {
    NSString *documentsPath = [self documentsPath];
    return [documentsPath stringByAppendingPathComponent:filename];
}

// 写入文件沙盒位置NSDictionary
+ (void)saveNSDictionaryForDocument:(NSDictionary *)list FileUrl:(NSString *)FileUrl {
    NSString *f = [self fullpathOfFilename:FileUrl];
    [list writeToFile:f atomically:YES];
}

// 写入文件存放到工程位置NSDictionary
+ (void)saveNSDictionaryForProduct:(NSDictionary *)list FileUrl:(NSString *)FileUrl {
    NSString *ProductPath =[[NSBundle mainBundle]  resourcePath];
    NSString *f=[ProductPath stringByAppendingPathComponent:FileUrl];
    [list writeToFile:f atomically:YES];
}

// 写入文件 Array 工程
+ (void)saveOrderArrayListProduct:(NSMutableArray *)list FileUrl:(NSString *)FileUrl {
    NSString *ProductPath =[[NSBundle mainBundle]  resourcePath];
    NSString *f=[ProductPath stringByAppendingPathComponent:FileUrl];
    [list writeToFile:f atomically:YES];
}

// 写入文件 Array 沙盒
+ (void)saveOrderArrayList:(NSMutableArray *)list FileUrl:(NSString *)FileUrl {
    NSString *f = [self fullpathOfFilename:FileUrl];
    [list writeToFile:f atomically:YES];
}

// 加载文件沙盒NSDictionary
+ (NSDictionary *)loadNSDictionaryForDocument:(NSString *)FileUrl {
    NSString *f = [self fullpathOfFilename:FileUrl];
    NSDictionary *list = [ [NSDictionary alloc] initWithContentsOfFile:f];
    return list;
}

// 加载文件工程位置NSDictionary
+ (NSDictionary *)loadNSDictionaryForProduct:(NSString *)FileUrl {
    NSString *f = [self ProductPath:FileUrl];
    NSDictionary *list =[NSDictionary dictionaryWithContentsOfFile:f];
    return list;
}

// 加载文件沙盒NSArray
+ (NSArray *)loadArrayList:(NSString *)FileUrl {
    NSString *f = [self fullpathOfFilename:FileUrl];
    NSArray *list = [NSArray  arrayWithContentsOfFile:f];
    return list;
}

// 加载文件工程位置NSArray
+ (NSArray *)loadArrayListProduct:(NSString *)FileUrl {
    NSString *f = [self ProductPath:FileUrl];
    NSArray *list = [NSArray  arrayWithContentsOfFile:f];
    return list;
}

// 拷贝文件到沙盒
+(int)CopyFileToDocument:(NSString *)FileName {
    NSString *appFileName =[self fullpathOfFilename:FileName];
    NSFileManager *fm = [NSFileManager defaultManager];
    
    // 判断沙盒下是否存在
    BOOL isExist = [fm fileExistsAtPath:appFileName];
    if (!isExist)   // 不存在，把工程的文件复制document目录下
    {
        // 获取工程中文件
        NSString *backupDbPath = [[NSBundle mainBundle]
                                  pathForResource:FileName
                                  ofType:@""];
        // 这一步实现数据库的添加，
        // 通过NSFileManager 对象的复制属性，把工程中数据库的路径复制到应用程序的路径上
        BOOL cp = [fm copyItemAtPath:backupDbPath toPath:appFileName error:nil];
        return cp;
    } else {
        return  -1; //已经存在
    }
}

// 判断文件是否存在
+ (BOOL)FileIsExists:(NSString *)checkFile {
    if([[NSFileManager defaultManager]fileExistsAtPath:checkFile])
    {
        return true;
    }
    return  false;
}

#pragma mark - 时间转换
/** 毫秒转换成时间 */
+ (NSString *)getDateWithTimeInterval:(NSTimeInterval)interval
{
    NSTimeInterval seconds = interval / 1000;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    NSString *currentTime = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:seconds]];
    return currentTime;
}

+ (NSTimeInterval)getTimeWithData:(NSDate *)date
{
    NSTimeInterval time = [date timeIntervalSince1970];
    long long int timeInterval = (long long int)time;
    NSLog(@"时间转换成秒:%llu",timeInterval);
    return timeInterval;
}

+ (NSString *)getDateWithTimeInterval2:(NSTimeInterval)interval
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [formatter setDateFormat:@"MM-dd HH:mm"];
    NSString *currentTime = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:interval/1000]];
    return currentTime;
}

// 时间转字符串
+ (NSString *)getStrDateByDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *currentTime = [formatter stringFromDate:date];
    return currentTime;
}

// 时间转字符串2
+ (NSString *)getStrByDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentTime = [formatter stringFromDate:date];
    return currentTime;
}

// long时间转字符串
+ (NSString *)getStrDateByTimeInterval:(NSTimeInterval)interval
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *currentTime = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:interval/1000]];
    return currentTime;
}

// long时间转字符串
+ (NSString *)getStrDateByTimeInterval2:(NSTimeInterval)interval
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"MM-dd HH:mm"];
    NSString *currentTime = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:interval]];
    return currentTime;
}


// 缩放图片/压缩图片
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

// 获得小时
+ (NSString *)getHoursByDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"HH"];
    NSString *currentTime = [formatter stringFromDate:date];
    return currentTime;
}

+ (BOOL)responseObject:(NSDictionary *)responseObject
{
    return [[responseObject objectForKey:@"returnCode"] intValue] == 0;
}

// 时间转字符串3
+ (NSString *)getStrByDate3:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentTime = [formatter stringFromDate:date];
    return currentTime;
}

+ (NSString *)timeInfoWithDateString:(NSString *)dateString {
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSDate *date =[dateFormat dateFromString:dateString];
    
    NSTimeInterval time = -[date timeIntervalSinceDate:[NSDate date]];
    
    NSTimeInterval retTime = 1.0;
    
    // 小于一分钟
    if (time < 60) {
        return @"刚刚";
    } else
        // 小于一小时
        if (time < 3600) {
            retTime = time / 60;
            retTime = retTime <= 0.0 ? 1.0 : retTime;
            return [NSString stringWithFormat:@"%.0f分钟前", retTime];
        }
    // 小于一天，也就是今天
        else if (time < 3600 * 24) {
            retTime = time / 3600;
            retTime = retTime <= 0.0 ? 1.0 : retTime;
            return [NSString stringWithFormat:@"%.0f小时前", retTime];
        }
    // 昨天
        else if (time < 3600 * 24 * 2) {
            return @"昨天";
        } else {
            
            return [Util getStrByDate3:date];
        }
}

+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect=CGRectMake(0,0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
