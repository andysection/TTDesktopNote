//
//  UILabel+LLFont.m
//  LilyForParent
//
//  Created by admin on 16/11/23.
//  Copyright © 2016年 Lily. All rights reserved.
//

#import "UILabel+LLFont.h"
#import <objc/runtime.h>

@implementation UILabel (LLFont)
//+ (void)load{
//    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
//    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
//    method_exchangeImplementations(imp, myImp);
//}
//
//- (id)myInitWithCoder:(NSCoder*)aDecode{
//    [self myInitWithCoder:aDecode];
//    if (self) {
//        //部分不像改变字体的 把tag值设置成333跳过
//        if(self.tag != 333){
//            CGFloat fontSize = self.font.pointSize;
//            self.font = [UIFont systemFontOfSize:fontSize*Screen_Scale];
//        }
//    }
//    return self;
//}

+ (instancetype)createLabelWithText:(NSString *)text FontSize:(CGFloat)fonSize textColor:(UIColor *)textColor{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont suitFont:fonSize];
    label.textColor = textColor;
    [label sizeToFit];
    return label;
}
@end
