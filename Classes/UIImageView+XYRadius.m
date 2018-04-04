//
//  UIImageView+XYRadius.m
//  XYProgressHUD
//
//  Created by Will on 2018/3/29.
//  Copyright © 2018年 wuw. All rights reserved.
//

#import "UIImageView+XYRadius.h"
#import "UIImage+XYRadius.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (XYRadius)

#pragma mark - Public

- (void)xy_radiusImageViewWithRadius:(CGFloat)radius size:(CGSize)size placeholderImage:(UIImage *)placeholderImage imageURL:(NSURL *)imageURL{
    if (placeholderImage) {
        UIImage *radiusImage = [placeholderImage xy_imageWithCornerRadius:radius size:size];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = radiusImage;
        });
    }
    
    if (imageURL) {
        if (![imageURL isKindOfClass:[NSURL class]]) {
            return;
        }
        [self sd_setImageWithURL:imageURL completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (!error) {
                [self _asyncImage:image withRadius:radius size:size];
            }
        }];
    }
}



- (void)xy_radiusImageViewWithRadius:(CGFloat)radius size:(CGSize)size imageURL:(NSURL *)imageURL{
    return [self xy_radiusImageViewWithRadius:radius size:size placeholderImage:nil imageURL:imageURL];
}

- (void)xy_radiusImageViewWithRadius:(CGFloat)radius size:(CGSize)size{
    return [self xy_radiusImageViewWithRadius:radius size:size placeholderImage:nil imageURL:nil];
}

#pragma mark - Private

- (void)_asyncImage:(UIImage *)image withRadius:(CGFloat)radius size:(CGSize)size{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *radiusImage = [image xy_imageWithCornerRadius:radius size:size];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = radiusImage;
        });
    });
}

/*
- (UIImage *)_imageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
 */

@end
