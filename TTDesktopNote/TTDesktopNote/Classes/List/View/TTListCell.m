//
//  TTListCell.m
//  TTDesktopNote
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTListCell.h"
#import "TTNoteModel.h"

static CGFloat headerForTime = 15;
static CGFloat marginVertical = 15;
static CGFloat headerForContent = 52;
static CGFloat topForContent = 50;

@implementation TTListCell{
    UILabel *_timeLabel;
    UILabel *_titleLabel;
    UILabel *_contentLabel;
    UIView *_separatorLine;
    UIView *_selectedSign;
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
    [self setupUI];
}

- (void)setupUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //时间
    UILabel *timeLabel = [UILabel createLabelWithText:@"时间" FontSize:14 textColor:ContentColor];
    timeLabel.numberOfLines = 1;
    [self.contentView addSubview:timeLabel];
    
    //标题
    UILabel *titleLabel = [UILabel createLabelWithText:@"标题" FontSize:16 textColor:TitleColor];
    titleLabel.numberOfLines = 1;
    [self.contentView addSubview:titleLabel];
    
    //内容
    UILabel *contentLabel = [UILabel createLabelWithText:@"内容" FontSize:14 textColor:ContentColor];
    contentLabel.numberOfLines = 2;
    contentLabel.frame = CGRectMake(headerForContent * Screen_WScale,
                                    titleLabel.maxY + marginVertical * Screen_HScale,
                                    0,
                                    0);
    [contentLabel sizeToFit];
    [self.contentView addSubview:contentLabel];
    
    //分割线
    UIView *separatorLine = [UIView new];
    separatorLine.backgroundColor = SeparatorColor;
    [self.contentView addSubview:separatorLine];
    
    //选中状态下的处理
    UIView *selectedSign = [UIView new];
    selectedSign.backgroundColor = MainColor;
    [self.contentView addSubview:selectedSign];
    
    _timeLabel = timeLabel;
    _titleLabel = titleLabel;
    _contentLabel = contentLabel;
    _separatorLine = separatorLine;
    _selectedSign = selectedSign;
    
    _selectedSign.hidden = YES;
    
}

- (void)layoutSubviews{
    _timeLabel.frame = CGRectMake(headerForTime * Screen_WScale,
                                 marginVertical * Screen_HScale,
                                 40 * Screen_WScale,
                                 15 * Screen_HScale);
    _titleLabel.frame = CGRectMake(headerForContent * Screen_WScale,
                                  marginVertical * Screen_HScale,
                                  300 * Screen_WScale,
                                  18 * Screen_WScale);
    _contentLabel.frame = CGRectMake(headerForContent * Screen_WScale,
                                    topForContent * Screen_HScale,
                                    300 * Screen_WScale,
                                    40 * Screen_HScale);
    _separatorLine.frame = CGRectMake(headerForContent * Screen_WScale,
                                     _contentLabel.maxY + 10 * Screen_HScale,
                                     TTScreenSize.width - headerForContent * Screen_WScale,
                                     1);
    _selectedSign.frame = CGRectMake(0,
                                     0,
                                     7 * Screen_WScale,
                                     self.contentView.frame.size.height);
    [_timeLabel sizeToFit];
    [_timeLabel sizeToFit];
    [_contentLabel sizeToFit];

}
- (void)setNoteModel:(TTNoteModel *)noteModel{
    _noteModel = noteModel;
    
    _titleLabel.text = _noteModel.title;
    _timeLabel.text = _noteModel.time;
    _contentLabel.text = _noteModel.content;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

//    self.contentView.backgroundColor = selected? [UIColor whiteColor] : BackgroundColor;
//    _selectedSign.hidden = selected;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    
    self.contentView.backgroundColor = highlighted? [UIColor whiteColor] : BackgroundColor;
    _selectedSign.hidden = !highlighted;
}


@end
