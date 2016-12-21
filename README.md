# iOSBlurEffect

本篇博文讲了如果使用不同的方法来实现iOS内的模糊效果。
1. 使用苹果官方提供的方法来渲染
https://developer.apple.com/library/content/samplecode/UIImageEffects/Listings/UIImageEffects_UIImageEffects_m.html#//apple_ref/doc/uid/DTS40013396-UIImageEffects_UIImageEffects_m-DontLinkElementID_9
本篇内使用了Image的类别，简单封装了一下
```
- (UIImage *)imageByApplyingLightEffect;

- (UIImage *)imageByApplyingExtraLightEffect;

- (UIImage *)imageByApplyingDarkEffect;

- (UIImage *)imageByApplyingTintEffectWithColor:(UIColor *)tintColor;

- (UIImage*)imageByApplyingBlurToImage:(UIImage*)inputImage withRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;
```
2. 使用vImage来渲染
```
///使用vImage 来处理模糊的方法
- (UIImage *)boxblurWithBlurNumber:(CGFloat)blur;
```
3. 使用CoreImage
```
/**
 使用CoreImage 来处理模糊的一种方法。
 @param rec     生成图片的size
 @param radius  模糊滤镜半径
 */
- (UIImage *)blurEffectWithRect:(CGRect)rec inputRadius:(CGFloat)radius;
```
4. iOS7之后使用navigationBar或者ToolBar来实现遮挡
```
/**
 模糊的一种效果，iOS7 之后，navigationBar ToolBar自带模糊效果（效果不是很好）
 (只是提供一个思路，大家可以在要使用的页面直接添加)
 */
- (UIImage *)blurWithToolBarMaskView {
	 UIToolbar *blurMaskView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.size.height)];
	[self addSubview:blurMaskView];
}
``
5. GPUImage,据说是一个非常强大的开源库，(暂未研究，回头研究之后补上)


