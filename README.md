# RMBlurredView

This subclass of NSView can be used to get an iOS 7 like blurred background to mimic a frosted glass effect. Check out the corresponding article on (Cocoanetics)[].

**PLEASE NOTE:** The parent view of the RMBlurredView must be layer-backed to see the effect.

The view can be easily customized to your needs:

* **blurRadius (float)** A float indicating the strength of the blur effect. This will be directly passed as input parameter for the Gaussian blur CIFilter. Default: 20.0.

* **saturationFactor (float)** A float value indicating the strength of the increased saturation effect. The Control Center for example uses increased saturated colors to get more vibrant colors shining through the view. Default: 2.0.

* **tintColor (NSColor)** A NSColor used a the background color for the view. Default: 70% White.

**NOTE:** Can be used with (RMSecondaryScroller )[https://github.com/raffael/RMSecondaryScroller] to customize the height of NSScrollViews.

## Usage

Usage should be clear once you see the annotated header file.

## Contact

* Raffael Hannemann
* [@raffael_me](http://www.twitter.com/raffael_me/)
* http://www.raffael.me/

## License

Copyright (c) 2013 Raffael Hannemann
Under BSD License.

## Want more?

Follow [@raffael_me](http://www.twitter.com/raffael_me/) for similar releases.
