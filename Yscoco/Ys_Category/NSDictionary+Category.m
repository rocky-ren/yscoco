#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)

- (id)objectForKeyNotNull:(id)aKey {
    id object = [self objectForKey:aKey];
    if (object == [NSNull null]) {
        object = nil;
    }
    
    return object;
}

- (id)objectForKeyNotNil:(id)aKey
{
    if (self == nil) {
        return nil;
    }
    
    id object = [self objectForKey:aKey];
    
    if (object == [NSNull null]) {
        object = nil;
    }
    
    return object;
}

- (id)objectForKeyNotNill:(id)aKey
{
    if (self == nil) {
        return nil;
    }
    
    id object = [self objectForKey:aKey];
    
    if (object == [NSNull null]) {
        object = nil;
    }

    return object;
}

@end
