//
//  NSObject+QQMessageRecallModule.h
//  QQRedBag
//
//  Created by 李向阳 on 2016/11/21.
//
//

#import <Foundation/Foundation.h>
#include <vector>

@interface NSObject (QQRecall)

@end

typedef union {
    unsigned long long _field1;
    unsigned long long _field2;
    unsigned long long _field3;
} XXUnion_znrfyA;

typedef struct RecallItem {
    bool _field1;
    unsigned long long _field2;
    XXUnion_znrfyA _field3;
    unsigned _field4;
    unsigned _field5;
    unsigned _field6;
    unsigned _field7;
    unsigned _field8;
    unsigned _field9;
} RecallItem;

typedef struct RecallModel {
    /*function-pointer*/ void** _field1;
    int _field2;
    bool _field3;
    std::vector<RecallItem *> _field4;
} RecallModel;
