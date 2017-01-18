//
//  XYConversationManager.m
//  XYSelectFriendsExample
//
//  Created by XY Lv on 17/1/18.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import "XYConversationManager.h"

@implementation XYConversationManager

+ (XYConversationManager *)xy_shareManger{
    static  XYConversationManager * manager = nil;
    static  dispatch_once_t  predict;
    dispatch_once(&predict, ^{
        manager = [[self alloc]init];
    });
    
    return manager;
}

@end
