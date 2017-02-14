//
//  TTNavigationController.m
//  TTDesktopNote
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTNavigationController.h"

@interface TTNavigationController ()

@end

@implementation TTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //title颜色
    NSDictionary * dict = @{NSFontAttributeName             :[UIFont suitFont:16],
                            NSForegroundColorAttributeName  :TitleColor};
    
    self.navigationBar.titleTextAttributes = dict;
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:BackgroundColor] forBarMetrics:UIBarMetricsDefault];
    //设置渲染颜色为白色
    [self.navigationBar setTintColor:ContentColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
