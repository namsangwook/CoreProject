//
//  CommonUtil.m
//  CoreProject
//
//  Created by Nam, SangWook on 13. 6. 21..
//  Copyright (c) 2013년 Sangwook Nam. All rights reserved.
//

#import "CommonUtil.h"

@implementation CommonUtil

+ (BOOL)isPortrait {
    return (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation));
}

+ (BOOL)scrollToFirstResponder:(UIView *)superView {
    return [self scrollToFirstResponder:superView withGap:10];
}

+ (BOOL)scrollToFirstResponder:(UIView *)superView withGap:(NSInteger)gap {
    for (UIView *view in superView.subviews) {
        if (!view.isFirstResponder) {
            [self scrollToFirstResponder:view withGap:gap];
            continue;
        }
        UIView *focusedChildView = view;
        
        for (UIView *childView = view, *parentView = view.superview; parentView != nil; childView = parentView, parentView = parentView.superview)
            if ([parentView isKindOfClass:[UIScrollView class]]) {
                
                //               CGRect convertedRect = [parentView convertRect:focusedChildView.bounds fromView:focusedChildView];
                CGRect convertedRect = [focusedChildView convertRect:focusedChildView.bounds toView:parentView];
                convertedRect.size.height += gap;
                [(UIScrollView *)parentView scrollRectToVisible:convertedRect animated:YES];
                return TRUE;
            }
    }
    return FALSE;
}

+ (BOOL)validateEmailAddress:(NSString *)aString {
	NSString *emailRegexp = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegexp];
	
    return [predicate evaluateWithObject:aString];
}

@end
