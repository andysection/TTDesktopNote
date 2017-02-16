//
//  TTMenuCell.m
//  TTDesktopNote
//
//  Created by admin on 17/2/16.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTMenuCell.h"

@implementation TTMenuCell{
    UIImageView *_icon;
    UILabel *_titleLabel;
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
    self.contentView.backgroundColor = MenuCellColor_nor;
    //图标
    UIImageView *icon = [[UIImageView alloc] init];
    icon.frame = CGRectMake(24 * Screen_WScale, 26 * Screen_HScale, 20 *Screen_WScale, 20 *Screen_WScale);
    [self.contentView addSubview:icon];
    icon.image = [UIImage imageNamed:@"Menu_delete_nor"];
    _icon = icon;
    
    //标题
    UILabel *titleLabel = [UILabel createLabelWithText:@"废纸篓" FontSize:19 textColor:HexRGBAlpha(0xcfcfcf, 1)];
    [self.contentView addSubview:titleLabel];
    _titleLabel = titleLabel;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)layoutSubviews{
    _icon.center = self.contentView.center;
    _icon.x = 24 * Screen_WScale;
    
    _titleLabel.center = self.contentView.center;
    _titleLabel.x = 56 * Screen_WScale;
}

#pragma mark - 选中状态设置
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [self checkStatus:selected];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [self checkStatus:highlighted];
}

- (void)checkStatus:(BOOL)isSelected{
    if (isSelected) {
        _titleLabel.textColor = HexRGBAlpha(0xffffff, 1);
        self.contentView.backgroundColor = MenuCellColor_sel;
        _icon.image = [UIImage imageNamed:@"Menu_delete_sel"];
    } else {
        _titleLabel.textColor = HexRGBAlpha(0xcfcfcf, 1);
        self.contentView.backgroundColor = MenuCellColor_nor;
        _icon.image = [UIImage imageNamed:@"Menu_delete_nor"];
    }
}

@end
