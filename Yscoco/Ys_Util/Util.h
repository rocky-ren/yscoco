//
//  Util.h
//  AdvertisingGod
//
//  Created by Ren on 15/6/11.
//  Copyright (c) 2015年 Rocky. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface Util : NSObject

// 时间转换成毫秒
+ (NSTimeInterval)getTime;

// 获得document
+ (NSString *)documentsPath;

// 读取工程文件
+ (NSString *)ProductPath:(NSString*)filename;

// 获得document文件路径，名字方便记忆
+ (NSString *)DocumentPath:(NSString *)filename;

// 获得document文件路径
+ (NSString *)fullpathOfFilename:(NSString *)filename;

// 写入文件沙盒位置NSDictionary
+ (void)saveNSDictionaryForDocument:(NSDictionary *)list FileUrl:(NSString *)FileUrl;

// 写入文件存放到工程位置NSDictionary
+ (void)saveNSDictionaryForProduct:(NSDictionary *)list FileUrl:(NSString *)FileUrl;

// 写入文件 Array 工程
+ (void)saveOrderArrayListProduct:(NSMutableArray *)list FileUrl:(NSString *)FileUrl;

// 写入文件 Array 沙盒
+ (void)saveOrderArrayList:(NSMutableArray *)list FileUrl:(NSString *)FileUrl;

// 加载文件沙盒NSDictionary
+ (NSDictionary *)loadNSDictionaryForDocument:(NSString *)FileUrl;

// 加载文件工程位置NSDictionary
+ (NSDictionary *)loadNSDictionaryForProduct:(NSString *)FileUrl;

// 加载文件沙盒NSArray
+ (NSArray *)loadArrayList:(NSString *)FileUrl;

// 加载文件工程位置NSArray
+ (NSArray *)loadArrayListProduct:(NSString *)FileUrl;

// 拷贝文件到沙盒
+(int)CopyFileToDocument:(NSString *)FileName;

// 判断文件是否存在
+ (BOOL)FileIsExists:(NSString *)checkFile;

#pragma mark - 时间转换
// 秒转换成时间
+ (NSString *)getDateWithTimeInterval:(NSTimeInterval)interval;

+ (NSTimeInterval)getTimeWithData:(NSDate *)date;

+ (NSString *)getDateWithTimeInterval2:(NSTimeInterval)interval;

// 时间转字符串
+ (NSString *)getStrDateByDate:(NSDate *)date;

// 时间转字符串2
+ (NSString *)getStrByDate:(NSDate *)date;

// long时间转字符串
+ (NSString *)getStrDateByTimeInterval:(NSTimeInterval)interval;

// long时间转字符串
+ (NSString *)getStrDateByTimeInterval2:(NSTimeInterval)interval;

// 缩放图片/压缩图片
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

// 获得小时
+ (NSString *)getHoursByDate:(NSDate *)date;

+ (BOOL)responseObject:(NSDictionary *)responseObject;

+ (NSString *)timeInfoWithDateString:(NSString *)dateString;

+ (UIImage *)createImageWithColor:(UIColor *)color;

@end
