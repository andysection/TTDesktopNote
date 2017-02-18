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
    
    //导航栏 取消
    UIButton *cancelBtn = [UIButton new];
    [cancelBtn setImage:[UIImage imageNamed:@"setting_cancel"] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(navCancelClick) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn sizeToFit];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:cancelBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    //导航栏 保存
    UIButton *saveBtn = [UIButton new];
    [saveBtn setImage:[UIImage imageNamed:@"setting_save"] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(navSaveClick) forControlEvents:UIControlEventTouchUpInside];
    [saveBtn sizeToFit];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:saveBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)navSaveClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)navCancelClick{
    [self dismissViewControllerAnimated:YES completion:nil];
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
