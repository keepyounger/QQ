//
//  NSObject+QIMService.h
//  QQRedBag
//
//  Created by 李向阳 on 2016/11/21.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (QIMService)

@end

@interface QQMessageModel : NSObject

@property(retain, nonatomic) id content; // @synthesize content=_content; 消息内容
@property(retain, nonatomic) NSString *syncUin; // @synthesize syncUin=_syncUin; 自己的QQ 群组时 为空
@property(retain, nonatomic) NSString *groupCode; // @synthesize groupCode=_groupCode; //群组
@property(retain, nonatomic) NSString *uin; // @synthesize uin=_uin;//对方QQ

@end
