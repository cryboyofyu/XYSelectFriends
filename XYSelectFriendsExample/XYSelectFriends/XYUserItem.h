//
//  XYUserItem.h
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/5.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYUserItem : NSObject
@property (nonatomic,strong)NSString * itemUserId;
@property (nonatomic,strong)NSString * itemUserHead;
@property (nonatomic,strong)NSString * itemUserName;
@property (nonatomic,strong)NSString * itemUserSex;
@property (nonatomic,strong)NSString * itemUserAge;
@property (nonatomic,strong)NSString * itemDistance;
@property (nonatomic,strong)NSString * itemUserPhone;
@property (nonatomic,strong)NSString * itemUserRealName;
@property (nonatomic,strong)NSString * itemUserGrade;
@property (nonatomic,strong)NSString * itemUserEducation;
@property (nonatomic,strong)NSString * itemUserTags;
@property (nonatomic,strong)NSString * itemUserHeaderBgImg;
@property (nonatomic,strong)NSString * itemUserHighSchoolName;
@property (nonatomic,strong)NSString * itemUserSchoolName;
@property (nonatomic,strong)NSString * itemUserSchoolId;
@property (nonatomic,strong)NSString * itemUserDescribe;
@property (nonatomic,strong)NSString * itemUserConstellation;
@property (nonatomic,strong)NSString * itemUserPositionSwitch;
@property (nonatomic,strong)NSString * itemUserIsOnLine;
@property (nonatomic,strong)NSString * itemCreateTime;
@property (nonatomic,strong)NSString * itemUpdateTime;
@property (nonatomic,strong)NSString * itemUserChatedBgImgStr;
@property (nonatomic,assign)double itemUserLat;
@property (nonatomic,assign)double itemUserLon;
@property (nonatomic,assign)BOOL   itemIsSelected;//是否被选中
@end



