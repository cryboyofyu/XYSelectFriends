//
//  XYConversationManager.h
//  XYSelectFriendsExample
//
//  Created by XY Lv on 17/1/18.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYConversationManager : NSObject

+ (XYConversationManager *)xy_shareManger;
@property (nonatomic,strong)NSMutableArray * xyGroupMembersMArr;

@end
