//
//  NSObject+QQMessageRecallModule.m
//  QQRedBag
//
//  Created by 李向阳 on 2016/11/21.
//
//

#import "NSObject+QQMessageRecallModule.h"
#import "RedManager.h"

@implementation NSObject (QQMessageRecallModule)
- (void)xy_handleRecallNotify:(id)arg1 isOnline:(BOOL)arg2
{
    if ([RedManager sharedManager].revokeState.boolValue) {
        return;
    }
    [self xy_handleRecallNotify:arg1 isOnline:arg2];
}
@end
