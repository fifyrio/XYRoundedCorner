//
//  UIView+XYRadius.m
//  tableView
//
//  Created by wuw on 2018/3/7.
//  Copyright © 2018年 Kingnet. All rights reserved.
//

#import "UIView+XYRadius.h"
#import "UIImage+XYRadius.h"

@implementation UIView (XYRadius)

- (void)xy_setXYRadius:(XYRadius)radius size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor{
    return [self xy_setXYRadius:radius size:size borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor forState:UIControlStateNormal];
}

- (void)xy_setXYRadius:(XYRadius)radius size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    CGSize _size = size;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CGSize pixelSize = CGSizeMake(pixel(_size.width), pixel(_size.height));
        
        UIImage *radiusImage = [UIImage xy_drawByXYRadius:radius size:pixelSize borderColor:borderColor borderWidth:borderWidth backgroundColor:backgroundColor];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.frame = CGRectMake(pixel(self.frame.origin.x), pixel(self.frame.origin.y), pixelSize.width, pixelSize.height);
            
            if ([self isKindOfClass:[UIImageView class]]) {
                ((UIImageView *)self).image = radiusImage;
            } else if ([self isKindOfClass:[UIButton class]]) {
                [((UIButton *)self) setBackgroundImage:radiusImage forState:state];
            } else if ([self isKindOfClass:[UILabel class]]) {
                self.layer.backgroundColor = [UIColor colorWithPatternImage:radiusImage].CGColor;
            } else {
                self.layer.contents = (__bridge id _Nullable)(radiusImage.CGImage);
            }
        });
    });
}

static inline CGFloat pixel(CGFloat num) {
    CGFloat unit = 1.0 / [UIScreen mainScreen].scale;
    CGFloat remain = fmod(num, unit);
    return num - remain + (remain >= unit / 2.0? unit: 0);
}

@end
