//
//  XYGroupSetCell.h
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/5.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYGroupItem.h"

@protocol XYGoupSetCellDelegate <NSObject>

- (void)xyGroupCellDisturbSwitchWithSender:(id)sender withCell:(id)cell;

@end

@interface XYGroupSetCell : UITableViewCell
@property (nonatomic,strong)UIImageView * xy_cellImgView;
@property (nonatomic,strong)UILabel * xy_titleLabel;
@property (nonatomic,strong)UILabel * xy_contentLabel;
@property (nonatomic,strong)UISwitch * xy_switchBtn;
@property (nonatomic,strong)UIImageView * xy_arrowImgView;
@property (nonatomic,strong)UIImageView * xy_portraitImgView;
@property (nonatomic,strong)XYGroupItem * xy_GroupItem;
@property (nonatomic,weak)id<XYGoupSetCellDelegate> xy_delegate;
@end













