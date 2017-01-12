//
//  XYGROUPCONSTANT.h
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/5.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//
#define xy_width [UIScreen mainScreen].bounds.size.width
#define xy_height [UIScreen mainScreen].bounds.size.height
#define xy(number) ([UIScreen mainScreen].bounds.size.width/320.00f *(number))
#define XYWeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;

#define xyChatFriendListCellH xy(45)
#define xyChatFriendListPortraitH xy(35)
#define xyChatFriendListHeaderH   xy(101)
#define xyGroupChatBgViewW        xy(120)
#define xyGroupChatBgViewH        xy(50)
#define xySelectFriendsCellCheckImgViewH xy(20)
#define xyGroupIcon_default       @"icon_group"
#define xyCollectionCellH         xy(70)
#define xyCollectionCellW         xy(45)
#define xyPadding xy(5)
#define xyChatFriendListCellH     xy(45)
#define xyCollectionCellW         xy(45)
#define xyDefaultBtnH xy(40)
#define xySelectFriendsCellCheckImgViewH xy(20)
#define xyChatFriendListPortraitH xy(35)

#define xyCollectionLabelTextColor [UIColor colorWithRed:0.27 green:0.27 blue:0.27 alpha:1.00]
#define xyFriendsApplyMessageTextColor [UIColor colorWithRed:0.67 green:0.67 blue:0.67 alpha:1.00]
#define xySchoolNameTextColor [UIColor colorWithRed:0.71 green:0.72 blue:0.72 alpha:1.00]
#define xyGrayColor [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00]
#define xyGreenColor [UIColor colorWithRed:0.53 green:0.82 blue:0.77 alpha:1.00]

#define xyCellPortraitPlaceholder   @""

typedef NS_ENUM(NSInteger,XYSelectContactType){
    
    XYSelectContactAdd, //拉人选择联系人
    XYSelectContactDelete, //删除群成员
    XYSelectContactCreate   //创建群组选择联系人
    
};







