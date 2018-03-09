//
//  UIView+XYRadius.h
//  tableView
//
//  Created by wuw on 2018/3/7.
//  Copyright © 2018年 Kingnet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+XYRadis.h"

@interface UIView (XYRadius)

- (void)xy_setXYRadius:(XYRadius)radius size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor;

- (void)xy_setXYRadius:(XYRadius)radius size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end
