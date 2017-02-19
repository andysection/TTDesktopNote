//
//  TTNoteInfoView.m
//  TTDesktopNote
//
//  Created by admin on 17/2/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTNoteInfoView.h"
#import "TTInfoCreatDataCell.h"
#import "TTInfoDetailCell.h"
#import "TTInfoEditDataCell.h"

@interface TTNoteInfoView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TTNoteInfoView
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
    
    UILabel *label = [UILabel createLabelWithText:@"信息" FontSize:16.5 textColor:TitleColor];
    label.x = 12 * Screen_WScale;
    label.y = 35 * Screen_WScale;
    [self addSubview:label];
    
    UIButton *hideBtn = [[UIButton alloc] init];
    [hideBtn setImage:[UIImage imageNamed:@"nav_forward"] forState:UIControlStateNormal];
    [self addSubview:hideBtn];
    hideBtn.frame = CGRectMake(self.width - 45 *Screen_WScale, 29.5, 25 *Screen_WScale, 25*Screen_HScale);
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.width, self.height - 64) style:UITableViewStyleGrouped];
    [self addSubview:tableView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

@end
