//
//  UIImage+BlurEffective.h
//  Paopao
//
//  Created by tb on 16/12/19.
//  Copyright © 2016年 com.tb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BlurEffective)

///把图片转换成指定的大小
- (UIImage *)convertToSize:(CGSize)size;


//MARK: - 苹果公开文档
//https://developer.apple.com/library/content/samplecode/UIImageEffects/Listings/UIImageEffects_UIImageEffects_m.html#//apple_ref/doc/uid/DTS40013396-UIImageEffects_UIImageEffects_m-DontLinkElementID_9
- (UIImage *)imageByApplyingLightEffect;

- (UIImage *)imageByApplyingExtraLightEffect;

- (UIImage *)imageByApplyingDarkEffect;

- (UIImage *)imageByApplyingTintEffectWithColor:(UIColor *)tintColor;

- (UIImage*)imageByApplyingBlurToImage:(UIImage*)inputImage withRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

//MARK: - vImage
///使用vImage 来处理模糊的方法
- (UIImage *)boxblurWithBlurNumber:(CGFloat)blur;



//MARK: - ToolBar
///ToolBar
/**
 模糊的一种效果，iOS7 之后，navigationBar ToolBar自带模糊效果（效果不是很好）
 (只是提供一个思路，大家可以在要使用的页面直接添加)
 */
- (UIImage *)blurWithToolBarMaskView;


//MARK: - CoreImage
/**
 使用CoreImage 来处理模糊的一种方法。
 @param rec     生成图片的size
 @param radius  模糊滤镜半径
 */
- (UIImage *)blurEffectWithRect:(CGRect)rec inputRadius:(CGFloat)radius;


@end
