//
//  UIImage+color.m
//  LilyForParent
//
//  Created by sunhw on 16/5/14.
//  Copyright © 2016年 Lily. All rights reserved.
//

#import "UIImage+color.h"

@implementation UIImage (color)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
