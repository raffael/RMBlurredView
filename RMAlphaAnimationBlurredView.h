//
//  RMAlphaAnimationBlurredView.h
//  163Music
//
//  Created by openfibers on 3/7/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import "RMBlurredView.h"

@interface RMAlphaAnimationBlurredView : RMBlurredView

- (void)setAlphaValue:(CGFloat)viewAlpha;

- (void)setAlphaValue:(CGFloat)viewAlpha
    animationDuration:(CGFloat)animationDuration
         timeFunction:(CAMediaTimingFunction *)timingFunction
    completionHandler:(void (^)(void))completionHandler;

@end
