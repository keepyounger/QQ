//
//  NSBundle+xyHook.m
//  QQRedBag
//
//  Created by 李向阳 on 2016/11/21.
//
//

#import "NSBundle+xyHook.h"
#import "JRSwizzle.h"

@implementation NSBundle (xyHook)

//+ (void)load
//{
//    [[NSBundle class] jr_swizzleMethod:@selector(infoDictionary) withMethod:@selector(xy_infoDictionary) error:nil];
//    [[NSBundle class] jr_swizzleMethod:@selector(bundleIdentifier) withMethod:@selector(xy_bundleIdentifier) error:nil];
//}
//
//- (NSDictionary<NSString *,id> *)xy_infoDictionary
//{
//    NSDictionary *dic = [self xy_infoDictionary];
//    NSMutableDictionary *dic2 = [NSMutableDictionary dictionaryWithDictionary:dic];
//    [dic2 setObject:@"com.tencent.mqq" forKey:@"CFBundleIdentifier"];
//    return dic2;
//}
//
//- (NSString *)xy_bundleIdentifier
//{
//    return @"com.tencent.mqq";
//}

@end
