//
//  UIViewController+QQSettingsViewController.m
//  QQRedBag
//
//  Created by 李向阳 on 2016/11/21.
//
//

#import "UIViewController+QQSettingsViewController.h"
#import "RedSettingViewController.h"

@implementation UIViewController (QQSettingsViewController)

- (void)xy_viewDidLoad
{
    [self xy_viewDidLoad];
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithTitle:@"扩展设置" style:UIBarButtonItemStyleDone target:self action:@selector(xy_setting)];
    [bbi setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [bbi setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateHighlighted];

    self.navigationItem.rightBarButtonItem = bbi;
}

- (void)xy_setting
{
    RedSettingViewController *vc = [RedSettingViewController defaultController];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
