//
//  UIImage+XYRadius.m
//  Demo
//
//  Created by Will on 2018/4/4.
//  Copyright © 2018年 fifyrio. All rights reserved.
//

#import "UIImage+XYRadius.h"

@implementation UIImage (XYRadius)

#pragma mark - Public
+ (UIImage *)xy_drawByXYRadius:(XYRadius)radius size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor{
    if (!backgroundColor) {
        return nil;
    }
    
    UIImage *image = [UIImage _imageWithColor:backgroundColor size:CGSizeMake(1, 1)];
    
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -rect.size.height);
    CGFloat height = size.height;
    CGFloat width = size.width;
    radius = [UIImage _transformationXYRadius:radius size:size borderWidth:borderWidth];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(radius.bottomLeftRadius, radius.bottomLeftRadius) radius:radius.bottomLeftRadius startAngle:M_PI endAngle:- M_PI_2 clockwise:YES];
    [path addArcWithCenter:CGPointMake(width - radius.bottomRightRadius, radius.bottomRightRadius) radius:radius.bottomRightRadius startAngle:- M_PI_2 endAngle:0 clockwise:YES];
    [path addArcWithCenter:CGPointMake(width - radius.topRightRadius, height - radius.topRightRadius) radius:radius.topRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius.topLeftRadius, height - radius.topLeftRadius) radius:radius.topLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
 
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

/*
+ (UIImage *)xy_clipByXYRadius:(XYRadius)radius image:(UIImage *)image size:(CGSize)size{
    CGRect rect = (CGRect){0,0,size};
    
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(_radius.topLeftRadius + , _radius.topLeftRadius + ) radius:_radius.topLeftRadius startAngle:M_PI endAngle:- M_PI_2 clockwise:YES];
    [path addArcWithCenter:CGPointMake(_renderRect.size.width - _radius.topRightRadius + , _radius.topRightRadius + ) radius:_radius.topRightRadius startAngle:- M_PI_2 endAngle:0 clockwise:YES];
    [path addArcWithCenter:CGPointMake(_renderRect.size.width - _radius.bottomRightRadius + , _renderRect.size.height - _radius.bottomRightRadius + ) radius:_radius.bottomRightRadius startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addArcWithCenter:CGPointMake(_radius.bottomLeftRadius + , _renderRect.size.height - _radius.bottomLeftRadius + ) radius:_radius.bottomLeftRadius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    
    CGContextAddPath(context, path.CGPath);
    CGContextClip(context);
    
    [self drawInRect:rect];
    
    UIImage *currentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return currentImage;
}
*/
 
#pragma mark - Private
+ (XYRadius)_transformationXYRadius:(XYRadius)radius size:(CGSize)size borderWidth:(CGFloat)borderWidth {
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

+ (UIImage *)_imageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
