//
//  NSString+xyDeviceID.m
//  QQRedBag
//
//  Created by 李向阳 on 2017/1/5.
//
//

#import "NSString+xyDeviceID.h"
#import "JRSwizzle.h"
#import "RedManager.h"

@implementation NSString (xyDeviceID)
+ (void)load
{
    [NSString jr_swizzleClassMethod:@selector(stringWithCString:encoding:) withClassMethod:@selector(xy_stringWithCString:encoding:) error:nil];
}

+ (instancetype)xy_stringWithCString:(const char *)cString encoding:(NSStringEncoding)enc
{
    NSString *iphone = [self xy_stringWithCString:cString encoding:enc];
    
    if ([iphone rangeOfString:@"iPhone"].length>0) {
        if ([[RedManager sharedManager].otherDeviceState boolValue]) {
            NSString *devStr = [RedManager sharedManager].otherDeviceStr;
            return devStr.length>1?devStr:iphone;
        }
    }
    return iphone;
}

@end
