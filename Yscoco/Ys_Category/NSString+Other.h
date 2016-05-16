//
//  NSObject+HXAddtions.h
//
//  Created by Ren on 15/1/21.
//  Copyright (c) 2015年 Rocky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Other)

+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary;

+ (NSString *)jsonStringWithArray:(NSArray *)array;

+ (NSString *)jsonStringWithString:(NSString *)string;

+ (NSString *)jsonStringWithObject:(id)object;

- (BOOL)containsString:(NSString *)string;

- (NSString *)URLEncodedString;

- (NSString *)URLDecodedString;

@end
