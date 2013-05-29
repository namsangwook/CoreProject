//
//  FGOrderedMutableDictionary.m
//  CoreProject
//
//  Created by Sangwook Nam on 13. 5. 28..
//  Copyright (c) 2013 Flowgrammer. All rights reserved
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.

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
