//
//  NSBundle+xyHook.m
//  QQRedBag
//
//  Created by 李向阳 on 2016/11/21.
//
//

#import "NSBundle+xyHook.h"

@implementation NSBundle (xyHook)

- (NSDictionary<NSString *,id> *)xy_infoDictionary
{
    NSDictionary *dic = [self xy_infoDictionary];
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionaryWithDictionary:dic];
    [dic2 setObject:@"com.tencent.mqq" forKey:@"CFBundleIdentifier"];
    return dic2;
}

- (NSString *)xy_bundleIdentifier
{
    return @"com.tencent.mqq";
}

@end
