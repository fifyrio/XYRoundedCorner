//
//  UIImage+XYRadis.m
//  tableView
//
//  Created by wuw on 2018/3/7.
//  Copyright © 2018年 Kingnet. All rights reserved.
//

#import "UIImage+XYRadis.h"

@implementation UIImage (XYRadis)

+ (UIImage *)xy_setXYRadius:(XYRadius)radius size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor{
    if (!backgroundColor) {
        backgroundColor = [UIColor whiteColor];
    }
    
    UIImage *image = [UIImage imageWithColor:backgroundColor];
    
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -rect.size.height);
    CGFloat height = size.height;
    CGFloat width = size.width;
    radius = [UIImage transformationXYRadius:radius size:size borderWidth:borderWidth];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake(width - radius.topRightRadius, height - radius.topRightRadius) radius:radius.topRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES]; 
    [path addArcWithCenter:CGPointMake(radius.topLeftRadius, height - radius.topLeftRadius) radius:radius.topLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius.bottomLeftRadius, radius.bottomLeftRadius) radius:radius.bottomLeftRadius startAngle:M_PI endAngle:3.0 * M_PI_2 clockwise:YES];
    [path addArcWithCenter:CGPointMake(width - radius.bottomRightRadius, radius.bottomRightRadius) radius:radius.bottomRightRadius startAngle:3.0 * M_PI_2 endAngle:2.0 * M_PI clockwise:YES];
    [path closePath];
    
    [path addClip];//进行裁剪
    CGContextDrawImage(context, rect, image.CGImage);
    path.lineWidth = borderWidth;
    [borderColor setStroke];
    [path stroke];
    
    UIImage *currentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return currentImage;
}

+ (XYRadius)transformationXYRadius:(XYRadius)radius size:(CGSize)size borderWidth:(CGFloat)borderWidth {
    radius.topLeftRadius = minimum(size.width, size.height, radius.topLeftRadius);
    radius.topRightRadius = minimum(size.width - radius.topLeftRadius, size.height, radius.topRightRadius);
    radius.bottomLeftRadius = minimum(size.width, size.height - radius.topLeftRadius, radius.bottomLeftRadius);
    radius.bottomRightRadius = minimum(size.width - radius.bottomLeftRadius, size.height - radius.topRightRadius, radius.bottomRightRadius);
    return radius;
}

static inline CGFloat minimum(CGFloat a, CGFloat b, CGFloat c) {
    CGFloat minimum = MIN(MIN(a, b), c);
    return MAX(minimum, 0);
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
