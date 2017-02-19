//
//  WASTableView.h
//  TTDesktopNote
//
//  Created by admin on 17/2/19.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WASTableView : UIView

@property (nonatomic, weak, nullable) id <UITableViewDataSource> dataSource;
@property (nonatomic, weak, nullable) id <UITableViewDelegate> delegate;

@end
