//
//  TTNotFindView.m
//  TTDesktopNote
//
//  Created by admin on 17/2/15.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTNotFindView.h"

@implementation TTNotFindView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    self.backgroundColor = BackgroundColor;
    
    UILabel *label = [UILabel createLabelWithText:@"Not Found" FontSize:35 textColor:HexRGBAlpha(0xa5a5a5, 1)];
    [self addSubview:label];
    label.center = self.center;
    label.y = 40 * Screen_HScale;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_notfound"]];
    [self addSubview:imageView];
    imageView.center = self.center;
    imageView.y = 100 * Screen_HScale;
}
@end
