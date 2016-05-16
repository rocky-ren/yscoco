//
//  Constants.h
//  Yscoco
//
//  Created by Rocky on 16/5/16.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )


// 颜色
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define UIColorFromRGB(rgbValue, alp) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
                                                      green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
                                                       blue:((float)(rgbValue & 0xFF)) / 255.0 \
                                                      alpha:alp]

//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif

//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

// gcd线程
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
// 多线程
#define InMutiThred(__muti__)  NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];\
                               [operationQueue addOperationWithBlock:^{ __muti__ }];
#define InMainThred(__main__)  dispatch_sync(dispatch_get_main_queue(), ^{ __main__ });

//单例化一个类
#define SINGLETON_FOR_IMPLEMENTATION(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}

#define SINGLETON_FOR_INTERFACE(classname) \
\
+ (classname *)shared##classname; \

// 延迟执行
#define eventAfter \
- (void)eventAfterDelay:(double)delay andEvent:(void(^)(void))event\
{\
[self performSelector:@selector(afterEvent:) withObject:event afterDelay:delay];\
}\
- (void)afterEvent:(void(^)(void))event\
{\
event();\
}












#endif /* Constants_h */
