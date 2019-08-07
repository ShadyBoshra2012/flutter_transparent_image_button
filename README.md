# Transparent Image Button  
  
  
  
## Explain  
  
This package is used to click on **Transparent Image** as a Gesture, but it's `OnTap` function works only when it was clicked on the image or photo itself not on the transparent parts.  
  
## Example  
  
`TransparentImageButton.assets(  
	 "assets/images/egg.png", 
	 width: 200, 
	 onTapInside: () => print("You tapped the image."), 	
	 onTapOutside: () => print("You tapped outside the image."), ),`  

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
