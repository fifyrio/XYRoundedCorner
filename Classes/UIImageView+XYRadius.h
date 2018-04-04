//
//  UIImageView+XYRadius.h
//  XYProgressHUD
//
//  Created by Will on 2018/3/29.
//  Copyright © 2018年 wuw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (XYRadius)

- (void)xy_radiusImageViewWithRadius:(CGFloat)radius size:(CGSize)size placeholderImage:(UIImage *)placeholderImage imageURL:(NSURL *)imageURL;

- (void)xy_radiusImageViewWithRadius:(CGFloat)radius size:(CGSize)size imageURL:(NSURL *)imageURL;

- (void)xy_radiusImageViewWithRadius:(CGFloat)radius size:(CGSize)size;

@end
