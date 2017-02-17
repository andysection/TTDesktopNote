//
//  TTSettingTitleCell.m
//  TTDesktopNote
//
//  Created by admin on 17/2/17.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTSettingTitleCell.h"

@implementation TTSettingTitleCell{
    UILabel *_titleLabel;
    UIImageView *_accessIcon;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setupUI{
    self.contentView.backgroundColor = HexRGBAlpha(0xffffff, 1);
    //标题
    UILabel *label = [UILabel createLabelWithText:@"标题" FontSize:15 textColor:SettingTitleColor];
    [self.contentView addSubview:label];
    _titleLabel = label;
    
    //右侧进入标志
    UIImageView *accessIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"setting_access"]];
    accessIcon.width = 15 * Screen_WScale;
    accessIcon.height = 15 * Screen_WScale;
    [self.contentView addSubview:accessIcon];
    _accessIcon = accessIcon;
}

- (void)layoutSubviews{
    _titleLabel.center = self.contentView.center;
    _titleLabel.x = 15 * Screen_WScale;
    
    _accessIcon.center = self.contentView.center;
    _accessIcon.x = TTScreenSize.width - _accessIcon.width - 18 * Screen_WScale;
}

@end
