//
//  XYSelectFriendsCell.h
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/10.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYUserItem.h"
@interface XYSelectFriendsCell : UITableViewCell
@property (nonatomic,strong)UIImageView * xyCellBgImgView;
@property (nonatomic,strong)UIImageView * xyCheckImgView;
@property (nonatomic,strong)UIImageView * xyPortraitImgView;
@property (nonatomic,strong)UILabel * xyNameLabel;
@property (nonatomic,strong)XYUserItem * xyCellItem;
@property (nonatomic,assign)BOOL      xyIsChecked;
@end
