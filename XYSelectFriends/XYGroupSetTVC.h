//
//  XYGroupSetTVC.h
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/5.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYGroupItem.h"

@protocol XYGroupSetTVCDelegate <NSObject>

- (void)xyGroupSetCellSelected:(id)sender withIndexPath:(NSIndexPath *)indexPath;

- (void)xyGroupSetTVCDisturbSwitchSender:(id)sender withCell:(id)cell;

@end

@interface XYGroupSetTVC : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)XYGroupItem * xy_groupItem;
@property (nonatomic,weak)id<XYGroupSetTVCDelegate>xy_delegate;

@end







