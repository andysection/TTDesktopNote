//
//  TTSlideMenuController.m
//  TTDesktopNote
//
//  Created by admin on 17/2/16.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTSlideMenuController.h"
#import "TTMenuCell.h"
#import "TTListController.h"
#import "TTListCell.h"
#import "TTNavigationController.h"

#define menuViewOffset (100*Screen_WScale)

static NSString *MenuCellId = @"MenuCellId";
@interface TTSlideMenuController ()<UITableViewDelegate, UITableViewDataSource>

/**
 *主控制器
 */
@property (nonatomic, weak) TTListController *MainListVC;
/**
 *主控制器视图
 */
@property (nonatomic, weak) UIView *containerView;
/**
 *单点手势
 */
@property (nonatomic, weak) UITapGestureRecognizer *tap;
@property (nonatomic, weak) UIView *menuView;

@end

@implementation TTSlideMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setupUI];
    
    [self addContainerView];
    
    [self setupGesture];
}

- (void)setupUI{
    self.view.backgroundColor = MenuBackgroundColor;
    UIView *menuView = [[UIView alloc] initWithFrame:CGRectMake(-menuViewOffset, 0, TTScreenSize.width, TTScreenSize.height)];
    [self.view addSubview:menuView];
    self.menuView = menuView;
    //标题
    UILabel *titleLabel = [UILabel createLabelWithText:@"SECTION" FontSize:14 textColor:HexRGBAlpha(0x505355, 1)];
    [self.menuView addSubview:titleLabel];
    
    //列表
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    //属性
    tableView.backgroundColor = MenuBackgroundColor;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.rowHeight = 46 * Screen_HScale;
    //注册
    [tableView registerClass:[TTMenuCell class] forCellReuseIdentifier:MenuCellId];
    tableView.frame = CGRectMake(0, 0, 240 * Screen_WScale, TTScreenSize.height);
    [self.menuView addSubview:tableView];
    
    //设置按钮
    UIButton *settingBtn = [[UIButton alloc] init];
    [settingBtn addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setBackgroundImage:[UIImage imageNamed:@"btn_setting_bg"] forState:UIControlStateNormal];
    [settingBtn setImage:[UIImage imageNamed:@"btn_setting"] forState:UIControlStateNormal];
    settingBtn.frame = CGRectMake(160 * Screen_WScale, 530 * Screen_HScale, 62 * Screen_WScale, 62 * Screen_WScale);
    [self.menuView addSubview:settingBtn];
}

- (void)settingBtnClick{
    NSLog(@"%s", __func__);
}
/**
 *设置容器视图
 */
- (void)addContainerView{
    //添加子控制器
    TTListController *vc = [[TTListController alloc] init];
    TTNavigationController *nav = [[TTNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    //添加视图
    UIView *v = nav.view;
    v.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:v];
    
    //绑定
    self.containerView = v;
    self.MainListVC = vc;
    
    //子控制器添加到父控制器
    [nav didMoveToParentViewController:self];
}

/**
 *添加手势
 */
- (void)setupGesture{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:pan];
}

- (void)addTapGesture{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    
    [self.containerView addGestureRecognizer:tap];
    self.tap = tap;
    self.MainListVC.tableView.userInteractionEnabled = NO;
}

- (void)removeTapGesture{
    [self.containerView removeGestureRecognizer:self.tap];
    self.MainListVC.tableView.userInteractionEnabled = YES;
    
}

- (void)tapGesture:(UITapGestureRecognizer *)recognizer{
    [UIView animateWithDuration:0.25 animations:^{
        self.containerView.transform = CGAffineTransformIdentity;
        self.menuView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self removeTapGesture];
    }];
}

- (void)panGesture:(UIPanGestureRecognizer *)recognizer{
    //获取增量
    CGPoint t = [recognizer translationInView:self.view];
    
    //手势复位
    [recognizer setTranslation:CGPointZero inView:self.view];
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
            //左滑忽略
            if (self.containerView.x + t.x < 0) {
                return;
            }
            
            //容器移动
            self.containerView.transform = CGAffineTransformTranslate(self.containerView.transform, t.x, 0);
            //底部移动
            CGFloat slideBarWidth = 240 * Screen_WScale;
            CGFloat menuViewMove = menuViewOffset / slideBarWidth * t.x;
            self.menuView.transform = CGAffineTransformTranslate(self.menuView.transform, menuViewMove, 0);
            break;
            
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            CGAffineTransform ContainerTransform = CGAffineTransformIdentity;
            CGAffineTransform MenuViewTransform = CGAffineTransformIdentity;
            CGFloat slideBarWidth = 240 * Screen_WScale;
            
            if (self.containerView.x > slideBarWidth * 0.5) {
                //超过滑动菜单一般大小的时候 显示 右侧添加单击手势
                ContainerTransform = CGAffineTransformMakeTranslation(slideBarWidth, 0);
                MenuViewTransform = CGAffineTransformMakeTranslation(menuViewOffset, 0);
                [self addTapGesture];
            } else {
                //删除点击事件
                [self removeTapGesture];
            }
            
            [UIView animateWithDuration:0.25 animations:^{
                self.containerView.transform = ContainerTransform;
                self.menuView.transform = MenuViewTransform;
            }];
        }
            break;
        default:
            break;
    }
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
