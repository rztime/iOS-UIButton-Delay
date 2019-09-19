//
//  UIButton+RZDelayAction.m
//  iOS-UIButton-Delay
//
//  Created by xk_mac_mini on 2019/9/19.
//  Copyright © 2019 rztime. All rights reserved.
//

#import "UIButton+RZDelayAction.h"
#import <objc/runtime.h>

@implementation UIButton (RZDelayAction)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL selA =@selector(sendAction:to:forEvent:);
        SEL selB =@selector(rzdelaySendAction:to:forEvent:);
        Method methodA = class_getInstanceMethod(self, selA);
        Method methodB = class_getInstanceMethod(self, selB);
        BOOL isAdd = class_addMethod(self, selA, method_getImplementation(methodB), method_getTypeEncoding(methodB));
        if (isAdd) {
            class_replaceMethod(self, selB,method_getImplementation(methodA),method_getTypeEncoding(methodA));
        } else {
            method_exchangeImplementations(methodA, methodB);
        }
    });
}

- (NSTimeInterval)delayAction {
    NSNumber *number = objc_getAssociatedObject(self, @"rzdelayAction");
    if (number == nil) {
        number = @(0.5); // 默认0.5秒
    }
    return (NSTimeInterval)number.doubleValue;
}

- (void)setDelayAction:(NSTimeInterval)delayAction {
    objc_setAssociatedObject(self, @"rzdelayAction", @(delayAction), OBJC_ASSOCIATION_ASSIGN);
}

- (void)rzdelaySendAction:(SEL)action to:(id)target forEvent:(UIEvent*)event {
    if ([self isKindOfClass:[UIButton class]]) {
        UITouchPhase phase = event.allTouches.anyObject.phase;
        if (phase == UITouchPhaseEnded || phase == UITouchPhaseCancelled) {
            self.userInteractionEnabled = NO; 
            [self performSelector:@selector(setUInteractionEnabled:) withObject:@(YES) afterDelay:self.delayAction];
        }
    }
    [self rzdelaySendAction:action to:target forEvent:event];
}

- (void)setUInteractionEnabled:(BOOL)enable {
    self.userInteractionEnabled = YES;
}
@end
