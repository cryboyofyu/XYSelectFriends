//
//  XYSelectFriendsTVC.h
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/10.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYSelectFriendsTVC : UITableViewController
@property (nonatomic,strong)NSMutableArray * xyDataMArr;
@property (nonatomic,strong)NSMutableArray * xySeletedMArr;
@property (nonatomic,copy)void (^xyReturnSelectedMArrBlock)(NSMutableArray *arr);
@end
