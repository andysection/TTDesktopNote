//
//  TTListController.h
//  TTDesktopNote
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTListController : UIViewController

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, copy)  void (^showMenuBlock)();
@end
