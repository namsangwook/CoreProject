//
//  CommonUtil.h
//  CoreProject
//
//  Created by Nam, SangWook on 13. 6. 21..
//  Copyright (c) 2013년 Sangwook Nam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUtil : NSObject

+ (BOOL)isPortrait;

+ (BOOL)scrollToFirstResponder:(UIView *)superView;

+ (BOOL)scrollToFirstResponder:(UIView *)superView withGap:(NSInteger)gap;

+ (BOOL)validateEmailAddress:(NSString *)aString;

@end
