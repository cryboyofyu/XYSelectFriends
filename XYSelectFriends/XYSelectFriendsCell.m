//
//  XYSelectFriendsCell.m
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/10.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import "XYSelectFriendsCell.h"
#import "XYGROUPCONSTANT.h"
#import <UIImageView+WebCache.h>
@implementation XYSelectFriendsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setCellStyle];
        [self initCellSubViews];
    }
    return self;
}


- (void)setCellStyle{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = xyGrayColor;
    
}

- (void)initCellSubViews{
    self.xyCellBgImgView = [[UIImageView alloc]initWithFrame:CGRectMake(xyPadding, 0, xy_width - xyPadding*2,xyChatFriendListCellH)];
    [self addSubview:self.xyCellBgImgView];
    [self.xyCellBgImgView setImage:[UIImage imageNamed:@"TF_bgImage"]];
    self.xyCellBgImgView.userInteractionEnabled = YES;
    
    
    self.xyCheckImgView = [[UIImageView alloc]initWithFrame:CGRectMake(xyPadding, (CGRectGetHeight(self.xyCellBgImgView.frame) - xySelectFriendsCellCheckImgViewH)/2, xySelectFriendsCellCheckImgViewH, xySelectFriendsCellCheckImgViewH)];
    [self.xyCellBgImgView addSubview:self.xyCheckImgView];
    [self.xyCheckImgView setImage:[UIImage imageNamed:@"icon_right_deselected"]];
    
    self.xyPortraitImgView = [[UIImageView alloc]initWithFrame:CGRectMake(xyPadding + CGRectGetMaxX(self.xyCheckImgView.frame), (CGRectGetHeight(self.xyCellBgImgView.frame) - xyChatFriendListPortraitH)/2, xyChatFriendListPortraitH, xyChatFriendListPortraitH)];
    
    [self.xyCellBgImgView addSubview:self.xyPortraitImgView];
    self.xyPortraitImgView.contentMode = UIViewContentModeScaleAspectFill;
    self.xyPortraitImgView.layer.cornerRadius = xyChatFriendListPortraitH/2;
    self.xyPortraitImgView.layer.masksToBounds = YES;
    
    self.xyNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.xyPortraitImgView.frame) + xyPadding, self.xyPortraitImgView.frame.origin.y, xy(150), xyChatFriendListPortraitH)];
    [self.xyCellBgImgView addSubview:self.xyNameLabel];
}

- (void)setXyCellItem:(XYUserItem *)xyCellItem{
    _xyCellItem  = xyCellItem;
    [self.xyPortraitImgView sd_setImageWithURL:[NSURL URLWithString:xyCellItem.itemUserHead] placeholderImage:nil];
    self.xyNameLabel.text = xyCellItem.itemUserName;
    self.xyIsChecked = xyCellItem.itemIsSelected;
}

- (void)setXyIsChecked:(BOOL)xyIsChecked{
    _xyIsChecked = xyIsChecked;
    if(xyIsChecked){
        [self.xyCheckImgView setImage:[UIImage imageNamed:@"icon_right_selected"]];
    }else{
        [self.xyCheckImgView setImage:[UIImage imageNamed:@"icon_right_deselected"]];
        
    }
}


@end
