# RMBlurredView

This subclass of NSView can be used to get an iOS 7 like blurred background to mimic a frosted glass effect — on OS X! Check out the corresponding article on [Cocoanetics](http://www.cocoanetics.com/2013/10/blurring-views-on-mac/).

**NOTE:** The parent view of the RMBlurredView must be layer-backed to see the effect.

![RMBlurredView, a NSView with blurred background](http://www.cocoanetics.com/files/Chat-Heads-Preview.jpg "Custom NSView subclass with blurred background")

([Chat Heads](http://www.raffael.me/chatheads) with blurred title and bottom bar)

The view can be easily customized to your needs:

* **blurRadius (float)** A float indicating the strength of the blur effect. This will be directly passed as input parameter for the Gaussian blur CIFilter. Default: 20.0.

* **saturationFactor (float)** A float value indicating the strength of the increased saturation effect. The Control Center for example uses increased saturated colors to get more vibrant colors shining through the view. Default: 2.0.

* **tintColor (NSColor)** A NSColor used a the background color for the view. Default: 70% White.

**NOTE:** Can be used with [RMSecondaryScroller](https://github.com/raffael/RMSecondaryScroller) to get a customizable NSScroller for NSScrollViews.

## Usage

Usage should be clear once you see the annotated header file. Check out the [RMBlurredViewExample](https://github.com/raffael/RMBlurredViewExample) project.

## Contact

* Raffael Hannemann
* [@raffael_me](http://www.twitter.com/raffael_me/)
* http://www.raffael.me/

## License

Copyright (c) 2013 Raffael Hannemann
Under BSD License.

## Want more?

Follow [@raffael_me](http://www.twitter.com/raffael_me/) for similar releases.
