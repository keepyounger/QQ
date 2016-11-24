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
        self.navigationBar.hidden = NO;
        [self setNavigationBarHidden:NO];
        return;
    }
    
    [self xy_pushViewController:viewController animated:animated];
}

@end

@implementation UIViewController (xyHook)

+ (void)load
{
    [UIViewController jr_swizzleMethod:@selector(viewDidAppear:) withMethod:@selector(xy_viewDidAppear:) error:nil];
}

- (void)xy_viewDidAppear:(BOOL)animated
{
    [self xy_viewDidAppear:animated];
}

@end

@implementation UINavigationBar (xyHook)

+ (void)load
{
    [UINavigationBar jr_swizzleMethod:@selector(isUserInteractionEnabled) withMethod:@selector(xy_isUserInteractionEnabled) error:nil];
    [UINavigationBar jr_swizzleMethod:@selector(setUserInteractionEnabled:) withMethod:@selector(xy_setUserInteractionEnabled:) error:nil];
}

- (void)xy_setUserInteractionEnabled:(BOOL)userInteractionEnabled
{
    [self xy_setUserInteractionEnabled:YES];
}

- (BOOL)xy_isUserInteractionEnabled
{
    return YES;
}

@end
