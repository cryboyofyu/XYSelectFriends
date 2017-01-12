//
//  XYGroupSetVC.h
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/5.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYGroupItem.h"
@interface XYGroupSetVC : UIViewController
@property (nonatomic,strong)XYGroupItem * xy_GroupItem;
@property (nonatomic,assign)BOOL          xy_IsGroupOwner;

@end
