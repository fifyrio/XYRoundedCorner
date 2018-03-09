//
//  UIImage+XYRadis.h
//  tableView
//
//  Created by wuw on 2018/3/7.
//  Copyright © 2018年 Kingnet. All rights reserved.
//

#import <UIKit/UIKit.h>

struct XYRadius {
    CGFloat topLeftRadius;
    CGFloat topRightRadius;
    CGFloat bottomLeftRadius;
    CGFloat bottomRightRadius;
};
typedef struct XYRadius XYRadius;

static inline XYRadius XYRadiusMake(CGFloat topLeftRadius, CGFloat topRightRadius, CGFloat bottomLeftRadius, CGFloat bottomRightRadius){
    XYRadius radius;
    radius.topLeftRadius = topLeftRadius;
    radius.topRightRadius = topRightRadius;
    radius.bottomLeftRadius = bottomLeftRadius;
    radius.bottomRightRadius = bottomRightRadius;
    return radius;
};

@interface UIImage (XYRadis)

+ (UIImage *)xy_setXYRadius:(XYRadius)radius size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor;

+ (UIImage *)xy_setRadius:(CGFloat)radius size:(CGSize)size color:(UIColor *)color;

@end
