//
//  TTSettingController.m
//  TTDesktopNote
//
//  Created by admin on 17/2/17.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTSettingController.h"

@interface TTSettingController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TTSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)setupUI{
    UITableView *tableView =[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
@end
