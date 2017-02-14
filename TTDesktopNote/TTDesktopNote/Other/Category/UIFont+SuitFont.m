//
//  UIFont+SuitFont.m
//  LilyForParent
//
//  Created by sunhw on 16/8/11.
//  Copyright © 2016年 Lily. All rights reserved.
//

#import "UIFont+SuitFont.h"

@implementation UIFont (SuitFont)

+ (UIFont *)suitFont:(CGFloat)fontSize {
//    fontSize = Screen_Scale * fontSize;
    return [UIFont systemFontOfSize:fontSize];
//    return [UIFont fontWithName:@"Microsoft YaHei" size:fontSize];
}

+ (UIFont *)boldSuitFont:(CGFloat)fontSize {
//    fontSize = Screen_Scale * fontSize;
    return [UIFont boldSystemFontOfSize:fontSize];
//    return [UIFont fontWithName:@"Microsoft YaHei" size:fontSize];
}

@end
