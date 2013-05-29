//
//  TSMutableDictionary.m
//  PMG
//
//  Created by Sangwook Nam on 13. 5. 28..
//
//

#import "FGOrderedMutableDictionary.h"

@implementation FGOrderedMutableDictionary  {
    NSMutableDictionary *_dictionary;
    NSMutableArray *_array;
}


// test
// test
- (id)init
{
	return [self initWithCapacity:0];
}

- (id)initWithCapacity:(NSUInteger)numItems
{   
    self = [super init];
    if(self != nil) {
        _dictionary = [[NSMutableDictionary alloc] initWithCapacity:numItems];
        _array = [[NSMutableArray alloc] initWithCapacity:numItems];
    }
    return self;
}

- (id)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-value"
    [_array initWithArray:keys];
    [_dictionary initWithObjects:objects forKeys:keys];
#pragma clang diagnostic pop
    
    return self;
}

//- (void)dealloc
//{
//	[_dictionary release];
//    [_array release];
//	[super dealloc];
//}

- (id)copy
{
    return [self mutableCopy];
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if(anObject == nil) {
        anObject = [NSNull null];
    }
    if(![_dictionary objectForKey:aKey]) {
        [_array addObject:aKey];
    }
    [_dictionary setObject:anObject forKey:aKey];
}

- (NSUInteger)count
{
    return _dictionary.count;
}

- (id)objectForKey:(id)aKey
{
    return [_dictionary objectForKey:aKey];
}

- (NSEnumerator *)keyEnumerator
{
    return _array.objectEnumerator;
}

- (void)removeObjectForKey:(id)aKey
{
    [_array removeObject:aKey];
    [_dictionary removeObjectForKey:aKey];
}

@end
