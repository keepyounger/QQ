//
//  NSObject+QIMService.h
//  QQRedBag
//
//  Created by 李向阳 on 2016/11/21.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (QIMService)
@end

@interface QQBaseChatModel : NSObject
@property(retain, nonatomic) NSMutableArray *chatMessages; // @dynamic chatMessages;
@property(copy, nonatomic) NSString *uin; // @dynamic uin;
- (void)clearMessages;
@end

@interface QQChatViewTable : UITableView
@property(retain, nonatomic) QQBaseChatModel *chatModel; // @synthesize chatModel=_chatModel;
@property(nonatomic) __weak UIViewController *supViewController;

- (id)lastMessage;
- (id)lastIndexPath;
- (void)insertObject:(id)arg1 atIndex:(unsigned int)arg2;
- (void)addObject:(id)arg1;
- (void)appendObject:(id)arg1;
- (void)insertObject:(id)arg1;
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;

@end

@interface QQMessageModel : NSObject

@property(retain, nonatomic) id content; //消息内容
@property(retain, nonatomic) NSString *syncUin; //自己的QQ 群组时 为空
@property(retain, nonatomic) NSString *groupCode; //群组
@property(retain, nonatomic) NSString *uin; //对方QQ
@property(retain, nonatomic) NSString *discussGroupUin;//讨论组

@end

@interface QQWalletTransferAIOMsgModel : NSObject
@property(retain, nonatomic) QQMessageModel *msgModel; // @dynamic msgModel;
@property(nonatomic) BOOL isSelf; // @dynamic isSelf;

@end

@interface QQWalletRedEnvelopeAIOMsgView : UIView
@property(nonatomic) unsigned int msgType; // @dynamic msgType; 6口令红包
@property(retain, nonatomic) UILabel *title; // @dynamic title;
@property(nonatomic) __weak QQChatViewTable *chatViewTable; // @dynamic chatViewTable;
@property(retain, nonatomic) UIImageView *backgroudView; // @dynamic backgroudView;
@property(nonatomic) BOOL hasOpenRedEnvelope; // @dynamic hasOpenRedEnvelope;
@property(retain, nonatomic) QQWalletTransferAIOMsgModel *model; // @synthesize model=_model;
@end

@interface QQWalletTransferAIOCellView : UIView
@property(retain, nonatomic) QQWalletRedEnvelopeAIOMsgView *redEnvelopeAIOMsgView;
- (BOOL)didTouchEnded:(id)arg1 withEvent:(id)arg2;
@end

@interface QQAIOMsgModel : NSObject
@property(retain, nonatomic) QQMessageModel *msgModel; // @dynamic msgModel;
@end

@interface QQAIOCommonCell : NSObject
@property(retain, nonatomic) QQAIOMsgModel *aioModel;
@end

@interface QQAIOTextCell : QQAIOCommonCell
@end

@interface QQWalletTransferAIOCell : QQAIOCommonCell
@end

@interface NSObject (tag)
+ (void)setTag:(NSInteger)tag;
+ (NSInteger)tag;
@end

@interface UIViewController (xxxx)
- (BOOL)sendTextMsg:(id)arg1 showText:(id)arg2;
@end
