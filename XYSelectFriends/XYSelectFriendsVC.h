//
//  XYSelectFriendsVC.h
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/10.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYGROUPCONSTANT.h"
@interface XYSelectFriendsVC : UIViewController
@property (nonatomic,strong)NSString * xyTitle;
@property (nonatomic,assign)XYSelectContactType xyType;
@property (nonatomic,strong)NSString * xyGroupId;
@property (nonatomic,strong)NSMutableArray * xyGroupMembersMArr;
@end
