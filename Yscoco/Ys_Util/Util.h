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

#pragma mark - 时间转换

// 时间转换成毫秒
+ (NSTimeInterval)getTimeIntervalByDate:(NSDate *)date;

// 时间转字符串 format = @"yyyy-MM-dd HH:mm:ss"
+ (NSString *)getStrDateByDate:(NSDate *)date format:(NSString *)format;

// 毫秒转时间
+ (NSDate *)getDateByTimeInterval:(NSTimeInterval)interval;

// 毫秒转换成时间 format = @"yyyy-MM-dd HH:mm:ss"
+ (NSString *)getStrDateByTimeInterval:(NSTimeInterval)interval format:(NSString *)format;

// 缩放图片/压缩图片
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

// 时间转几分钟前、几小时前、几天前。。。 format = @"yyyy-MM-dd HH:mm:ss"
+ (NSString *)timeInfoWithDateString:(NSString *)dateString format:(NSString *)format;

+ (BOOL)responseObject:(NSDictionary *)responseObject;

// 创建图片
+ (UIImage *)createImageWithColor:(UIColor *)color;

// 缩放图片/压缩图片
- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

@end
