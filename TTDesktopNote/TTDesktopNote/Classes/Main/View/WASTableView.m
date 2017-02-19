//
//  WASTableView.m
//  TTDesktopNote
//
//  Created by admin on 17/2/19.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "WASTableView.h"

@implementation WASTableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    //tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds];
    [self addSubview:tableView];
    tableView.delegate = self.delegate;
    tableView.dataSource = self.dataSource;
    
    //background for headerView
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 100)];
    [self addSubview:header];
    
    //title for headerView
    UILabel *label = [[UILabel alloc] init];
    [header addSubview:label];
}
@end
