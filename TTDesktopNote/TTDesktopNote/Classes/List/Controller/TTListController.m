//
//  TTListController.m
//  TTDesktopNote
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTListController.h"
#import "TTListCell.h"
#import "TTNoteModel.h"

static NSString *ListCellId = @"ListCellId";

@interface TTListController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) TTNoteModel *noteModel;

@end

@implementation TTListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    self.title = @"笔记";
    
    self.noteModel = [TTNoteModel new];
    self.noteModel.title = @"自定义标题";
    self.noteModel.time = @"3月份";
    self.noteModel.content = @"自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容";
    //导航栏 - 左侧菜单
    //导航栏 - 右侧搜索
    
    //笔记列表
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    //代理
    tableView.delegate = self;
    tableView.dataSource = self;
    //属性
    tableView.backgroundColor = BackgroundColor;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.frame = CGRectMake(0, 0, TTScreenSize.width, TTScreenSize.height);
    //注册
    [tableView registerClass:[TTListCell class] forCellReuseIdentifier:ListCellId];
    [self.view addSubview:tableView];
    tableView.rowHeight = 101;
    
    //添加新笔记按钮
    UIButton *btn = [UIButton new];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_background"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"btn_add"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(addNote) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    btn.frame = CGRectMake(300 * Screen_WScale, 530 * Screen_HScale, 60 * Screen_WScale, 60 * Screen_WScale);
    [self.view addSubview:btn];
}

- (void)addNote{
    NSLog(@"%s", __func__);
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TTListCell *cell = [tableView dequeueReusableCellWithIdentifier:ListCellId forIndexPath:indexPath];
    cell.noteModel = self.noteModel;
    //滑动右侧按钮设置
    __weak typeof(self) WeakSelf = self;
    //需要判断是否置顶?????????????????
    MGSwipeButton *movetopBtn = [MGSwipeButton buttonWithTitle:@""
                                                         icon:[UIImage imageNamed:@"cell_top"]
                                              backgroundColor:HexRGBAlpha(0x2e3235, 1)
                                                     callback:^BOOL(MGSwipeTableCell * _Nonnull cell) {
                                                         [WeakSelf moveNoteToTop:indexPath];
                                                         return YES;
                                                     }];
    movetopBtn.buttonWidth = 60 * Screen_WScale;
    
    MGSwipeButton *deleteBtn = [MGSwipeButton buttonWithTitle:@""
                                                          icon:[UIImage imageNamed:@"cell_delete"]
                                               backgroundColor:MainColor
                                                      callback:^BOOL(MGSwipeTableCell * _Nonnull cell) {
                                                          [WeakSelf deleteNote:indexPath];
                                                          return YES;
                                                      }];
    deleteBtn.buttonWidth = 60 * Screen_WScale;
    
    cell.rightButtons = @[deleteBtn,
                          movetopBtn];
    cell.rightSwipeSettings.transition = MGSwipeTransitionBorder;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

# pragma mark - 侧滑按钮功能
//置顶
- (void)moveNoteToTop:(NSIndexPath *)indexPath{

}
//取消置顶
- (void)cancelMoveNoteToTop:(NSIndexPath *)indexPath{
    
}
//移至废纸篓
- (void)deleteNote:(NSIndexPath *)indexPath{
    
}
@end
