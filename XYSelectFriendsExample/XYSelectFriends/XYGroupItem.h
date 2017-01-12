//
//  XYGroupItem.h
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/5.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XYGroupItem : NSObject
@property (nonatomic,strong)NSString * itemGroupId;//群ID
@property (nonatomic,strong)NSString * itemGroupNum;//群号
@property (nonatomic,strong)NSString * itemGroupName;
@property (nonatomic,strong)NSString * itemGroupOwnerId;
@property (nonatomic,strong)UIImage  * itemGroupPortrait;
@property (nonatomic,strong)NSString * itemGroupCreateTime;
@property (nonatomic,strong)NSString * itemGroupUpdateTime;
@property (nonatomic,strong)NSString * itemGroupStatus;
@property (nonatomic,strong)NSString * itemGroupMemberNum;
@property (nonatomic,assign)NSString * itemIsGroupMessageAlert;
@end





