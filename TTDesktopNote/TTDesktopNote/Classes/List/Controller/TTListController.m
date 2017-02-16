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
#import "TTNotFindView.h"

static NSString *ListCellId = @"ListCellId";

@interface TTListController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) TTNoteModel *noteModel;

@property (nonatomic, assign) BOOL isSearchMode;

@property (nonatomic, strong) UISearchBar *ListSearchBar;

@property (nonatomic, strong) UIView *maskView;

@property (nonatomic, strong) TTNotFindView *notFoundView;

@property (nonatomic, weak) UIButton *addNoteBtn;
@end

@implementation TTListController{
    UILabel *_titleLabel;
    UIButton *_leftNavBtn;
    UIButton *_rightNavBtn;
}

- (void)viewDidLoad {
    //初始化 非搜索模式
    self.isSearchMode = false;
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    [self setupNav];
    self.noteModel = [TTNoteModel new];
    self.noteModel.title = @"自定义标题";
    self.noteModel.time = @"3月份";
    self.noteModel.content = @"自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容自定义内容";
    
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
    self.addNoteBtn = btn;
}

-  (void)setupNav{
    //导航栏 - 标题
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 44)];
    bg.clipsToBounds = YES;
    UILabel *title = [[UILabel alloc] init];
    title.text = @"笔记";
    [title sizeToFit];
    title.center = bg.center;
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = TitleColor;
    [bg addSubview:title];
    _titleLabel = title;
    self.navigationItem.titleView = bg;
    
    //导航栏 - 左侧
    UIView *leftbg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    leftbg.clipsToBounds = YES;
    UIButton *leftBtn = [UIButton new];
    [leftBtn setImage:[UIImage imageNamed:@"nav_menu"] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0, 0, 40, 40);
    [leftbg addSubview:leftBtn];
    leftBtn.center = leftbg.center;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftbg];
    self.navigationItem.leftBarButtonItem = leftItem;
    _leftNavBtn = leftBtn;

    //导航栏 - 右侧
    UIView *rightbg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    rightbg.clipsToBounds = YES;
    UIButton *rightBtn = [UIButton new];
    [rightBtn setImage:[UIImage imageNamed:@"nav_search"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(navSearchAnimationStart) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.frame = CGRectMake(0, 0, 40, 40);
    [rightbg addSubview:rightBtn];
    rightBtn.center = rightbg.center;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightbg];
    self.navigationItem.rightBarButtonItem = rightItem;
    _rightNavBtn = rightBtn;
}

- (void)addNote{
    NSLog(@"%s", __func__);
}

- (void)navSearchAnimationStart{
    self.isSearchMode = !self.isSearchMode;
    //动画
    int k = self.isSearchMode ? 1 : -1;
    //非搜索模式 隐藏
    if (!_isSearchMode) {
        [self.ListSearchBar removeFromSuperview];
    } else{
        [[UIApplication sharedApplication].keyWindow addSubview:self.ListSearchBar];
        [self.ListSearchBar becomeFirstResponder];
    }
    [UIView animateWithDuration:.25 animations:^{
        _titleLabel.y += 45 * Screen_HScale * k;
        _leftNavBtn.x -= 45 * Screen_WScale * k;
        _rightNavBtn.x += 45 * Screen_WScale * k;
        self.ListSearchBar.alpha = self.isSearchMode? 1 : 0;
        self.maskView.alpha = self.isSearchMode? 1 : 0;
        self.addNoteBtn.y -= 100 * Screen_HScale * k;
    } completion:^(BOOL finished) {
        //如果为隐藏模式 那么现实
        if (self.isSearchMode) {
        }else{
            [self.maskView removeFromSuperview];
        }
    }];
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
# pragma mark - UISearchBarDelegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    self.ListSearchBar.text = @"";
    [self navSearchAnimationStart];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"%@", searchText);
    if (searchText.length == 0) {
        [self.view addSubview:self.maskView];
        [self.notFoundView removeFromSuperview];
    } else {
        //进行搜索
        [self.maskView removeFromSuperview];
        [self.view addSubview:self.notFoundView];
    }
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [self.view addSubview:self.maskView];
}


# pragma mark - cell侧滑按钮功能
//置顶
- (void)moveNoteToTop:(NSIndexPath *)indexPath{

}
//取消置顶
- (void)cancelMoveNoteToTop:(NSIndexPath *)indexPath{
    
}
//移至废纸篓
- (void)deleteNote:(NSIndexPath *)indexPath{
    
}

#pragma mark - 懒加载
//搜索框
- (UISearchBar *)ListSearchBar{
    if (!_ListSearchBar) {
        _ListSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, TTScreenSize.width, 44)];
        _ListSearchBar.delegate = self;
        _ListSearchBar.placeholder = @"搜索笔记";
        _ListSearchBar.showsCancelButton = YES;
        _ListSearchBar.backgroundImage = [UIImage imageWithColor:BackgroundColor];
        _ListSearchBar.tintColor = HexRGBAlpha(0x555555, 1);
        [_ListSearchBar setImage:[UIImage imageNamed:@"search_clear"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
        
        UITextField *searchField=[_ListSearchBar valueForKey:@"_searchField"];
        searchField.backgroundColor = HexRGBAlpha(0xececec, 1);
        searchField.textColor = TitleColor;
        
        _ListSearchBar.alpha = 0;
    }
    return _ListSearchBar;
}
//蒙版
- (UIView *)maskView{
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _maskView.backgroundColor = HexRGBAlpha(0x333333, 0.3);
        UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskViewClick)];
        singleTapGestureRecognizer.numberOfTapsRequired = 1;
        [_maskView addGestureRecognizer:singleTapGestureRecognizer];
        _maskView.alpha = 0;
    }
    return _maskView;
}

- (void)maskViewClick{
    [self navSearchAnimationStart];
}

- (TTNotFindView *)notFoundView{
    if (!_notFoundView) {
        _notFoundView = [[TTNotFindView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _notFoundView;
}
@end
