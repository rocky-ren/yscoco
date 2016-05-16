


#import <Foundation/Foundation.h>

@interface NSDictionary (Category)

/** 如果是NULL的对象,返回nil */
- (id)objectForKeyNotNull:(id)aKey;

- (id)objectForKeyNotNil:(id)aKey;

- (id)objectForKeyNotNill:(id)aKey;

@end
