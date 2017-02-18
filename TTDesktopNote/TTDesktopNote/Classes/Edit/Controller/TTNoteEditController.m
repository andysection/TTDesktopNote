//
//  TTNoteEditController.m
//  TTDesktopNote
//
//  Created by admin on 17/2/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTNoteEditController.h"

@interface TTNoteEditController ()

@property (nonatomic, strong) UIView *maskView;

@property (nonatomic, strong) UIView *infoView;

@end

@implementation TTNoteEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    self.view.backgroundColor = BackgroundColor;
    
    UIButton *infoBtn = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoBtn addTarget:self action:@selector(showInfoClick) forControlEvents:UIControlEventTouchUpInside];
    [infoBtn sizeToFit];
    UIBarButtonItem *infoItem = [[UIBarButtonItem alloc] initWithCustomView:infoBtn];
    self.navigationItem.rightBarButtonItem = infoItem;
    
    //导航栏 取消
    UIButton *cancelBtn = [UIButton new];
    [cancelBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(navBackClick) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn sizeToFit];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:cancelBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}
//笔记信息
- (void)showInfoClick{
    //
    [self showInfo:YES];
}

- (void)navBackClick{
    //
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)maskViewClick{
    NSLog(@"%s", __func__);
    [self showInfo:NO];
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

- (UIView *)infoView{
    if (!_infoView) {
        _infoView = [[UIView alloc] initWithFrame:CGRectMake(TTScreenSize.width + 5 *Screen_WScale, 0, 275 *Screen_WScale, TTScreenSize.height)];
        _infoView.backgroundColor = TitleColor;
    }
    return _infoView;
}

- (void)showInfo:(BOOL)isShow{
    CGAffineTransform infoViewTransform = CGAffineTransformIdentity;
    int alpha = isShow ? 1 : 0;
    if (isShow) {
        [[UIApplication sharedApplication].windows.lastObject addSubview:self.maskView];
        [[UIApplication sharedApplication].windows.lastObject addSubview:self.infoView];
        infoViewTransform = CGAffineTransformMakeTranslation(- 280 *Screen_WScale, 0);
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.maskView.alpha = alpha;
        self.infoView.transform = infoViewTransform;
    } completion:^(BOOL finished) {
        if (!isShow) {
            [self.maskView removeFromSuperview];
            [self.infoView removeFromSuperview];
        }
    }];
}

- (void)dealloc{
    NSLog(@"dealloc");
}
@end
