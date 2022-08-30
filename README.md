# Transparent Image Button  

[![pub.dev](https://img.shields.io/pub/v/transparent_image_button.svg)](https://pub.dev/packages/transparent_image_button)  [![Build Status](https://travis-ci.com/ShadyBoshra2012/flutter_transparent_image_button.svg?branch=master)](https://travis-ci.com/ShadyBoshra2012/flutter_transparent_image_button) [![Codemagic build status](https://api.codemagic.io/apps/5d4afeeb36524a00189ef782/5d4afeeb36524a00189ef781/status_badge.svg)](https://codemagic.io/apps/5d4afeeb36524a00189ef782/5d4afeeb36524a00189ef781/latest_build) [![Donate Paypal](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://paypal.me/ShadyBoshra2012) [![GitHub Follow](https://img.shields.io/github/followers/ShadyBoshra2012.svg?style=social&label=Follow)](https://github.com/ShadyBoshra2012)

## Explain  
  
This package is used to click on **Transparent Image** as a Gesture, but it's `OnTap` function works only when it was clicked on the image or photo itself not on the transparent parts.  
  
## How to use ?  
  
```
TransparentImageButton.assets(  
	 "assets/images/egg.png", 
	 width: 200, 
	 opacityThreshold: 0.8,
         onTapInside: () => print("You tapped the image."),
         onTapOutside: () => print("You tapped outside the image."),
         onHoverInside: () => print("You're hovering inside the image."),
         onHoverOutside: () => print("You're hovering outside the image."),
),
```

## Things ToDO

- [x]  Image from Assets.
- [ ]  Image from Network.

## The idea  
  The idea came to me from this [question](https://stackoverflow.com/questions/57374066/button-with-image-with-transparent-background) on Stackoverflow.  
  
## Sources that helped me  
  - [How to Calculate the Coordinates of touch in Flutter?](https://stackoverflow.com/questions/46560982/how-to-calculate-the-coordinates-of-touch-in-flutter)  
- [Get the pixel on which I clicked](https://stackoverflow.com/questions/56478321/get-the-pixel-on-which-i-clicked/56488053#56488053)  
- [roipeker](https://gist.github.com/roipeker) [gist file](https://gist.github.com/roipeker/9315aa25301f5c0362caaebd15876c2f)

## Issues or Contributions

This is a beta version of package, so I am very welcoming any issues or contribution you can help me with.

## License

MIT: [https://mit-license.org](https://mit-license.org). 

Copyright (c) 2019 Shady Boshra. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Find me on Stackoverflow

<a href="https://stackoverflow.com/users/2076880/shady-boshra"><img src="https://stackoverflow.com/users/flair/2076880.png" width="208" height="58" alt="profile for Shady Boshra at Stack Overflow, Q&amp;A for professional and enthusiast programmers" title="profile for Shady Boshra at Stack Overflow, Q&amp;A for professional and enthusiast programmers"></a>
