//
//  TTSettingController.m
//  TTDesktopNote
//
//  Created by admin on 17/2/17.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTSettingController.h"
#import "TTSettingTitleCell.h"

static NSString *SettingTitleCellId = @"SettingTitleCellId";
@interface TTSettingController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TTSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    self.view.backgroundColor = BackgroundColor;
    UITableView *tableView =[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.frame = CGRectMake(0, 0, TTScreenSize.width, TTScreenSize.height);
    [self.view addSubview:tableView];
    [tableView registerClass:[TTSettingTitleCell class] forCellReuseIdentifier:SettingTitleCellId];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TTSettingTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:SettingTitleCellId forIndexPath:indexPath];
    return cell;
}
@end
