//
//  UIView+Extension.m
//  LilyForParent
//
//  Created by Apple on 16/5/6.
//  Copyright © 2016年 Lily. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

-(void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)x {
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat)y {
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)width {
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height= height;
    self.frame = frame;
}

-(CGFloat)height {
    return self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centerX {
    CGRect frame = self.frame;
    frame.origin.x = centerX - self.width/2;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.frame.origin.x + self.frame.size.width/2;
}

- (CGFloat)maxY {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)maxX {
    return self.frame.origin.x + self.frame.size.width;
}

@end
