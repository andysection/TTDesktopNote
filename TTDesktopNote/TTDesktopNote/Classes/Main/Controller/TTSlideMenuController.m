//
//  TTSlideMenuController.m
//  TTDesktopNote
//
//  Created by admin on 17/2/16.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTSlideMenuController.h"
#import "TTMenuCell.h"

static NSString *MenuCellId = @"MenuCellId";
@interface TTSlideMenuController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TTSlideMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setupUI];
}

- (void)setupUI{
    self.view.backgroundColor = MenuBackgroundColor;
    //标题
    UILabel *titleLabel = [UILabel createLabelWithText:@"SECTION" FontSize:14 textColor:HexRGBAlpha(0x505355, 1)];
    [self.view addSubview:titleLabel];
    //列表
    UITableView *tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    //属性
    tableView.backgroundColor = MenuBackgroundColor;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.rowHeight = 46 * Screen_HScale;
    //注册
    [tableView registerClass:[TTMenuCell class] forCellReuseIdentifier:MenuCellId];
    tableView.frame = CGRectMake(0, 0, 240 * Screen_WScale, TTScreenSize.height);
    [self.view addSubview:tableView];
    
    //设置按钮
    UIButton *settingBtn = [[UIButton alloc] init];
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"btn_setting_bg"] forState:UIControlStateNormal];
    [settingBtn setImage:[UIImage imageNamed:@"btn_setting"] forState:UIControlStateNormal];
    settingBtn.frame = CGRectMake(160 * Screen_WScale, 530 * Screen_HScale, 62 * Screen_WScale, 62 * Screen_WScale);
    [self.view addSubview:settingBtn];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TTMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:MenuCellId forIndexPath:indexPath];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 240 * Screen_WScale, 75 * Screen_HScale)];
    UILabel *label = [UILabel createLabelWithText:@"Section" FontSize:14 textColor:HexRGBAlpha(0x505355, 1)];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 75 * Screen_HScale;
}
@end
