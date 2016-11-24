//
//  NSObject+QIMService.m
//  QQRedBag
//
//  Created by 李向阳 on 2016/11/21.
//
//

#import "NSObject+QIMService.h"
#import <objc/runtime.h>
#import "RedManager.h"

@implementation NSObject (QIMService)
//- (void)xy_postRegisteNotification:(id)arg1 Object:(id)arg2 userInfo:(id)arg3
//{
//    [self xy_postRegisteNotification:arg1 Object:arg2 userInfo:arg3];

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

//}
@end

@implementation UITouch (xxxx)

- (CGPoint)xy_locationInView:(nullable UIView*)view
{
    CGPoint point = [self xy_locationInView:view];
    
    if ([view isKindOfClass:NSClassFromString(@"QQWalletTransferAIOCellView")]) {
        QQWalletRedEnvelopeAIOMsgView *v = ((QQWalletTransferAIOCellView*)view).redEnvelopeAIOMsgView;
        point = CGPointMake(v.backgroudView.frame.origin.x+10, v.backgroudView.frame.origin.y+10);
    }

    return point;
}

@end

@interface MyEvent : UIEvent

@end

@implementation MyEvent

- (NSSet<UITouch *> *)allTouches
{
    UITouch *touch = [[UITouch alloc] init];
    Class class = objc_getClass("QQWalletTransferAIOCellView");
    [touch setValue:[[class alloc] init] forKey:@"view"];
    return [NSSet setWithObject:touch];
}

@end

@implementation UIView (didDisplayCell)

- (void)xy_tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    [self xy_tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    RedManager *manager = [RedManager sharedManager];
    if (!manager.redState.boolValue) {
        return;
    }
    
    if ([cell isKindOfClass:NSClassFromString(@"QQWalletTransferAIOCell")]) {
        
        float time = manager.delayTime.floatValue;
        if (time >= 0.2 && manager.delayRandomState.boolValue) {
            NSInteger seconds = (int)(time*10)+1;
            time = (arc4random()%seconds)/10.0;
        }
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [NSThread sleepForTimeInterval:time];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                QQWalletTransferAIOCellView *view = cell.subviews[0].subviews[0];
                BOOL arg = view.redEnvelopeAIOMsgView.hasOpenRedEnvelope;
                BOOL isSelf = view.redEnvelopeAIOMsgView.model.isSelf;
                NSUInteger type = view.redEnvelopeAIOMsgView.msgType;
                
                QQMessageModel *mm = view.redEnvelopeAIOMsgView.model.msgModel;
                if (mm.groupCode.length==0 && mm.discussGroupUin.length==0) {//只抢群组 或 讨论组的
                    return;
                }
                
                //如果不抢自己的
                if (!manager.selfState.boolValue && isSelf) {
                    return;
                }
                
                //这种抢不了自己的
                if (type == 2 && isSelf) {
                    return;
                }
                
                if (!arg && [NSObject tag]==0) {
                    [NSObject setTag:1];
                    
                    //口令红包
                    if (type == 6) {
                        NSString *password = view.redEnvelopeAIOMsgView.title.text?:@"";
                        [view.redEnvelopeAIOMsgView.chatViewTable.supViewController sendTextMsg:password showText:password];
                    } else {//拼手机 type = 3
                        MyEvent *event = [[MyEvent alloc] init];
                        [view didTouchEnded:event.allTouches withEvent:event];
                    }
                    
                    //3秒超时
                    [self performSelector:@selector(resetFlag) withObject:nil afterDelay:2];

                }
                
            });
        });
        
    }
}

- (void)resetFlag
{
    [NSObject setTag:0];
}

- (UIViewController *)xy_viewController
{
    UIViewController *vc = nil;
    UIResponder *rp = self;
    while (rp!=nil) {
        if ([rp isKindOfClass:[UIViewController class]]) {
            vc = (UIViewController*)rp;
            return vc;
        }
        rp = [rp nextResponder];
    }
    return nil;
}

@end

static NSInteger _tag = 0;
@implementation NSObject (tag)

+ (void)setTag:(NSInteger)tag
{
    _tag = tag;
}

+ (NSInteger)tag
{
    return _tag;
}

@end
