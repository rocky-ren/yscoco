
//
//  Util.m
//  AdvertisingGod
//
//  Created by Ren on 15/6/11.
//  Copyright (c) 2015年 Rocky. All rights reserved.
//

#import "Util.h"

@implementation Util

#pragma mark - 时间转换

// 时间转换成毫秒
+ (NSTimeInterval)getTimeIntervalByDate:(NSDate *)date
{
    NSTimeInterval millisecond = [date timeIntervalSince1970];
    return millisecond*1000;
}

// 时间转字符串 format = @"yyyy-MM-dd HH:mm:ss"
+ (NSString *)getStrDateByDate:(NSDate *)date format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:format];
    NSString *currentTime = [formatter stringFromDate:date];
    
    return currentTime;
}

// 毫秒转时间
+ (NSDate *)getDateByTimeInterval:(NSTimeInterval)interval
{
    return [NSDate dateWithTimeIntervalSince1970:interval/1000];
}

// 毫秒转换成时间
+ (NSString *)getStrDateByTimeInterval:(NSTimeInterval)interval format:(NSString *)format;
{
    NSTimeInterval seconds = interval / 1000;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:format];
    NSString *currentTime = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:seconds]];
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

+ (NSString *)timeInfoWithDateString:(NSString *)dateString format:(NSString *)format
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSDate *date =[dateFormat dateFromString:dateString];
    
    NSTimeInterval time = -[date timeIntervalSinceDate:[NSDate date]];
    
    NSTimeInterval retTime = 1.0;
    
    // 小于一分钟
    if (time < 60) {
        return @"刚刚";
    } else {
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
            return [Util getStrDateByDate:date format:@"MM-dd HH:mm"];
        }
    }
}

+ (BOOL)responseObject:(NSDictionary *)responseObject
{
    return [[responseObject objectForKey:@"returnCode"] intValue] == 0;
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
