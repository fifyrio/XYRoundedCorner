//
//  XYRoundedCornerRadius.h
//  Demo
//
//  Created by Will on 2018/4/4.
//  Copyright © 2018年 fifyrio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

struct XYRadius {
    CGFloat topLeftRadius;
    CGFloat topRightRadius;
    CGFloat bottomLeftRadius;
    CGFloat bottomRightRadius;
};
typedef struct XYRadius XYRadius;

static inline XYRadius XYRadiusMake(CGFloat topLeftRadius, CGFloat topRightRadius, CGFloat bottomRightRadius, CGFloat bottomLeftRadius){
    XYRadius radius;
    radius.topLeftRadius = topLeftRadius;
    radius.topRightRadius = topRightRadius;
    radius.bottomLeftRadius = bottomLeftRadius;
    radius.bottomRightRadius = bottomRightRadius;
    return radius;
};

@interface XYRoundedCornerRadius : NSObject

@end
