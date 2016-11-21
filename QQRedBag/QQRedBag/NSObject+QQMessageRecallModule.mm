//
//  NSObject+QQMessageRecallModule.m
//  QQRedBag
//
//  Created by 李向阳 on 2016/11/21.
//
//

#import "NSObject+QQMessageRecallModule.h"
#import "RedManager.h"

@implementation NSObject (QQRecall)
- (void)xy_handleRecallNotify:(struct RecallModel *)arg1 isOnline:(BOOL)arg2;
{
    //保留引用 防止崩溃
    RecallModel *model = (RecallModel *)arg1;
    
    if ([RedManager sharedManager].revokeState.boolValue) {
        return;
    }
    
    [self xy_handleRecallNotify:model isOnline:arg2];
}
//
//- (id)xy_getLocalMessage:(struct RecallItem *)arg1
//{
//    //保留引用 防止崩溃
//    RecallItem *item = (RecallItem *)arg1;
//    if ([RedManager sharedManager].revokeState.boolValue) {
//        return nil;
//    }
//    return [self xy_getLocalMessage:item];
//}
//
//- (id)xy_getRecallMessageContent:(struct RecallModel *)arg1 item:(struct RecallItem *)arg2 msg:(id)arg3 isOnline:(BOOL)arg4
//{
//    //保留引用 防止崩溃
//    RecallModel *model = (RecallModel *)arg1;
//    RecallItem *item = (RecallItem *)arg2;
//    id obj = [self xy_getRecallMessageContent:model item:item msg:arg3 isOnline:arg4];
//    unsigned long long uin = item->_field2;
//
//    if ([RedManager sharedManager].revokeState.boolValue) {
//        obj = [@(uin).stringValue stringByAppendingString:@"尝试撤回一条消息，已被成功拦截"];
//    }
//    
//    return obj;
//    
//}
//
//- (id)xy_getRecallMessageContent:(struct RecallModel *)arg1
//{
//    //保留引用 防止崩溃
//    RecallModel *model = (RecallModel *)arg1;
//    id obj = [self xy_getRecallMessageContent:model];
//
//    if ([RedManager sharedManager].revokeState.boolValue) {
//        obj = @"对方尝试撤回一条消息，已被成功拦截";
//    }
//    return obj;
//}

@end
