//
//  TTListCell.h
//  TTDesktopNote
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTNoteModel;
@interface TTListCell : MGSwipeTableCell

@property (nonatomic, strong) TTNoteModel *noteModel;

//删除
@property (nonatomic, copy) void (^deleteBlock)();
//置顶
@property (nonatomic, copy) void (^movetopBlock)();
@end
