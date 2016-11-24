//
//  UINavigationController+xyHook.m
//  autoGetRedEnv
//
//  Created by 李向阳 on 2016/11/8.
//
//

#import "UINavigationController+xyHook.h"
#import "JRSwizzle.h"
#import <objc/runtime.h>
#import "NSObject+QIMService.h"

@implementation UINavigationController (xyHook)

+ (void)load
{
    [UINavigationController jr_swizzleMethod:@selector(pushViewController:animated:) withMethod:@selector(xy_pushViewController:animated:) error:nil];
}

- (void)xy_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([NSObject tag]==1) {
        [NSObject setTag:0];
        return;
    }
    [self xy_pushViewController:viewController animated:animated];
}

@end

@implementation UIViewController (xyHook)

+ (void)load
{
    [UIViewController jr_swizzleMethod:@selector(viewDidAppear:) withMethod:@selector(xy_viewDidAppear:) error:nil];
    [UIViewController jr_swizzleMethod:@selector(presentViewController:animated:completion:) withMethod:@selector(xy_presentViewController:animated:completion:) error:nil];
}

- (void)xy_viewDidAppear:(BOOL)animated
{
    [self xy_viewDidAppear:animated];
}

- (void)xy_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    if ([NSObject tag]==1) {
        [NSObject setTag:0];
        __weak UIViewController *weakSelf = self;
        [self xy_presentViewController:viewControllerToPresent animated:NO completion:^{
            [weakSelf dismissViewControllerAnimated:NO completion:nil];
        }];
        return;
    }
    [self xy_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
