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

@end
