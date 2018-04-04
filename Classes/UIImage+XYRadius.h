//
//  UIImage+XYRadius.h
//  Demo
//
//  Created by Will on 2018/4/4.
//  Copyright © 2018年 fifyrio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYRoundedCornerRadius.h"


@interface UIImage (XYRadius)

+ (UIImage *)xy_drawByXYRadius:(XYRadius)radius size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor;

@end
