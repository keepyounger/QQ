//
//  NSObject+QIMService.m
//  QQRedBag
//
//  Created by 李向阳 on 2016/11/21.
//
//

#import "NSObject+QIMService.h"

@implementation NSObject (QIMService)
- (void)xy_postRegisteNotification:(id)arg1 Object:(id)arg2 userInfo:(id)arg3
{
    [self xy_postRegisteNotification:arg1 Object:arg2 userInfo:arg3];
    
//    if ([arg2 isKindOfClass:[NSArray class]]) {
//        NSArray *array = arg2;
//        if ([array.firstObject isKindOfClass:NSClassFromString(@"QQMessageModel")]) {
//            QQMessageModel *model = array.firstObject;
//            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[model.content dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
//            if (dic && [model.content rangeOfString:@"[QQ红包]"].length>0) {
//                //QQ红包 暂时未解决 怎么 拆红包
//                
//                
//            }
//        }
//    }
    
}

@end
