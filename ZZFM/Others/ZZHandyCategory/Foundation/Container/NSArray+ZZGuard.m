//
//  NSArray+ZZGuard.m
//  ZZHandyCategory
//
//  Created by donews on 2018/7/23.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "NSArray+ZZGuard.h"

@implementation NSArray (ZZGuard)

- (id)zz_objectOrNilAtIndex:(NSUInteger)index {
#ifdef DEBUG
    return self[index];
#else
    return index < self.count ? self[index] : nil;
#endif
}

@end


@implementation NSMutableArray (ZZGuard)

- (void)zz_addObject:(id)anObject {
    
#ifdef DEBUG
    [self addObject:anObject];
#else
    if (!anObject) { return;}
    [self addObject:anObject];
#endif
}

- (void)zz_addObjects:(NSArray *)objects {
#ifdef DEBUG
    [self addObjectsFromArray:objects];
#else
    if (!objects) { return;}
    [self addObjectsFromArray:objects];
#endif
}

- (void)zz_removeFirstObject {
#ifdef DEBUG
    [self removeObjectAtIndex:0];
#else
    if (self.count) {
        [self removeObjectAtIndex:0];
    }
#endif
}

- (void)zz_removeLastObject {
#ifdef DEBUG
    [self removeObjectAtIndex:self.count - 1];
#else
    if (self.count) {
        [self removeObjectAtIndex:self.count - 1];
    }
#endif
}

- (id)zz_popFirstObject {
    id obj = nil;
    if (self.count) {
        obj = self.firstObject;
        [self zz_removeFirstObject];
    }
    return obj;
}

- (id)zz_popLastObject {
    id obj = nil;
    if (self.count) {
        obj = self.lastObject;
        [self zz_removeLastObject];
    }
    return obj;
}

- (void)zz_prependObject:(id)anObject {
#ifdef DEBUG
    [self insertObject:anObject atIndex:0];
#else
    if (anObject) {
        [self insertObject:anObject atIndex:0];
    }
#endif
}

- (void)zz_prependObjects:(NSArray *)objects {
    if (!objects) return;
    NSUInteger i = 0;
    for (id obj in objects) {
        [self insertObject:obj atIndex:i++];
    }
}

- (void)zz_insertObject:(id)anObject atIndex:(NSUInteger)index {
#ifdef DEBUG
   [self insertObject:anObject atIndex:index];
#else
    if (anObject) {
        [self insertObject:anObject atIndex:index];
    }
#endif
}

- (void)zz_insertObjects:(NSArray *)objects atIndex:(NSUInteger)index {
    NSUInteger i = index;
    for (id obj in objects) {
        [self zz_insertObject:obj atIndex:i++];
    }
}

- (void)zz_reverse {
    NSUInteger count = self.count;
    int mid = floor(count / 2.0);
    for (NSUInteger i = 0; i < mid; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
    }
}

- (void)zz_shuffle {
    for (NSUInteger i = self.count; i > 1; i--) {
        [self exchangeObjectAtIndex:(i - 1)
                  withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
}

@end
