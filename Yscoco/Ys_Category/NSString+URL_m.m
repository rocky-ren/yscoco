//
//  NSString+URL_m.m
//  Alcohol
//
//  Created by 任皖鹏 on 15/10/29.
//  Copyright © 2015年 R. All rights reserved.
//

#import "NSString+URL_m.h"

@implementation NSString (URL_m)

- (NSString *)URLEncodedString
{
    NSString *newString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault,
                                                                                                (CFStringRef)self,
                                                                                                NULL,
                                                                                                CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"),
                                                                                                kCFStringEncodingUTF8));
    if (newString) {
        return newString;
    }
    return @"";
}

- (NSString *)URLDecodedString
{
    NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    return decodedString;
}

@end
