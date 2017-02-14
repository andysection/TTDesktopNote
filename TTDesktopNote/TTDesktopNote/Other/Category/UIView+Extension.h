//
//  UIView+Extension.h
//  LilyForParent
//
//  Created by Apple on 16/5/6.
//  Copyright © 2016年 Lily. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic ,assign) CGFloat centerX;

@property (nonatomic, assign, readonly) CGFloat maxX;

@property (nonatomic, assign, readonly) CGFloat maxY;
@end
