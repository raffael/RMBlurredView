//
//  RMAlphaAnimationBlurredView.m
//  163Music
//
//  Created by openfibers on 3/7/14.
//  Copyright (c) 2014 openthread. All rights reserved.
//

#import "RMAlphaAnimationBlurredView.h"

#pragma mark - Helper View

@class RMAlphaAnimationBlurredViewAnimationHelperView;
@protocol RMAlphaAnimationBlurredViewAnimationHelperViewDelegate <NSObject>

- (void)rmAlphaAnimationBlurredViewAnimationHelperView:(RMAlphaAnimationBlurredViewAnimationHelperView *)view
                                           sizeChanged:(CGSize)newSize;

@end

@interface RMAlphaAnimationBlurredViewAnimationHelperView : NSView
@property (nonatomic, weak) id<RMAlphaAnimationBlurredViewAnimationHelperViewDelegate> delegate;
@end

@implementation RMAlphaAnimationBlurredViewAnimationHelperView

- (void)setFrameSize:(NSSize)newSize
{
    [super setFrameSize:newSize];
    if (self.delegate)
    {
        [self.delegate rmAlphaAnimationBlurredViewAnimationHelperView:self sizeChanged:newSize];
    }
}

@end

#pragma mark - Blurred View

@interface RMAlphaAnimationBlurredView () <RMAlphaAnimationBlurredViewAnimationHelperViewDelegate>

@end

@implementation RMAlphaAnimationBlurredView
{
    RMAlphaAnimationBlurredViewAnimationHelperView *_animationHelperView;
    float _previousSaturationFactor;
    float _previousBlurRadius;
    
    BOOL _disableNextSetAlphaValue;
}

- (id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self)
    {
        _animationHelperView = [[RMAlphaAnimationBlurredViewAnimationHelperView alloc] initWithFrame:CGRectZero];
        _animationHelperView.delegate = self;
        _animationHelperView.frame = CGRectMake(0, 0, 256, 0);
        
        _previousBlurRadius = self.blurRadius;
        _previousSaturationFactor = self.saturationFactor;
    }
    return self;
}

- (void)rmAlphaAnimationBlurredViewAnimationHelperView:(RMAlphaAnimationBlurredViewAnimationHelperView *)view
                                           sizeChanged:(CGSize)newSize
{
    CGFloat alpha = newSize.width / 256.f;
    float newSaturation = (_previousSaturationFactor - 1) * alpha + 1;
    float newBlurRadius = _previousBlurRadius * alpha;
    [super setSaturationFactor:newSaturation];
    [super setBlurRadius:newBlurRadius];
}

- (float)saturationFactor
{
    return _previousSaturationFactor;
}

- (float)blurRadius
{
    return _previousBlurRadius;
}

- (void)setSaturationFactor:(float)saturationFactor
{
    [super setSaturationFactor:saturationFactor];
    _previousSaturationFactor = saturationFactor;
}

- (void)setBlurRadius:(float)blurRadius
{
    [super setBlurRadius:blurRadius];
    _previousBlurRadius = blurRadius;
}

- (void)setAlphaValue:(CGFloat)viewAlpha
{
    [super setAlphaValue:viewAlpha];
    if (_disableNextSetAlphaValue)
    {
        _disableNextSetAlphaValue = NO;
        return;
    }
    _animationHelperView.frame = CGRectMake(0, 0, round(256 * viewAlpha), 0);
    float newSaturation = (_previousSaturationFactor - 1) * viewAlpha + 1;
    float newBlurRadius = _previousBlurRadius * viewAlpha;
    [super setSaturationFactor:newSaturation];
    [super setBlurRadius:newBlurRadius];
}

- (void)setAlphaValue:(CGFloat)viewAlpha
    animationDuration:(CGFloat)animationDuration
         timeFunction:(CAMediaTimingFunction *)timingFunction
    completionHandler:(void (^)(void))completionHandler
{
    __weak id weakSelf = self;
    __weak id weakAnimationHelperView = _animationHelperView;
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        [[NSAnimationContext currentContext] setDuration:animationDuration];
        [[NSAnimationContext currentContext] setTimingFunction:timingFunction];
        _disableNextSetAlphaValue = YES;
        [[weakSelf animator] setAlphaValue:viewAlpha];
        [[weakAnimationHelperView animator] setFrameSize:CGSizeMake(round(viewAlpha * 256), 0)];
    } completionHandler:completionHandler];
}

@end
