//
//  NSBlurredView.h
//
//  Created by Raffael Hannemann on 08.10.13.
//  Copyright (c) 2013 Raffael Hannemann. All rights reserved.
//

#import <Cocoa/Cocoa.h>


// Make sure to import QuartzCore and add it to your Linked Libraries of your target
#import <QuartzCore/QuartzCore.h>

@interface NSBlurredView : NSView {
	// Keep a reference to the filters for later modification
	CIFilter *_blurFilter, *_saturationFilter;
}

/** The layer will be tinted using the tint color. By default it is a 70% White Color */
@property (strong,nonatomic) NSColor *tintColor;

/** To get more vibrant colors, a filter to increase the saturation of the colors can be applied. The default value is 2.5. */
@property (assign,nonatomic) float saturationFactor;

/** The blur radius defines the strength of the Gaussian Blur filter. The default value is 20.0. */
@property (assign,nonatomic) float blurRadius;
@end
