//
//  UIButton+RZDelayAction.h
//  iOS-UIButton-Delay
//
//  Created by xk_mac_mini on 2019/9/19.
//  Copyright © 2019 rztime. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (RZDelayAction)

/** 延迟响应时间间隔， 默认0.5秒  */
@property (nonatomic, assign) NSTimeInterval delayAction;

@end

NS_ASSUME_NONNULL_END
