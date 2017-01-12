//
//  XYGroupSetCell.m
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/5.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import "XYGroupSetCell.h"
#import "XYGROUPCONSTANT.h"
#import <UIImageView+WebCache.h>
@implementation XYGroupSetCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self xyInitCellStyle];
        [self xyInitSubViews];
        [self xyInitSubViewsFrame];
    }
    return self;
}

- (void)xyInitCellStyle{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = xyGrayColor;
}

- (void)xyInitSubViews{
    self.xy_cellImgView = [[UIImageView alloc]init];
    [self addSubview:self.xy_cellImgView];
    self.xy_cellImgView.userInteractionEnabled = YES;
    [self.xy_cellImgView setImage:[UIImage imageNamed:@"cellBg_normal"]];
    self.xy_titleLabel = [[UILabel alloc]init];
    [self.xy_cellImgView addSubview:self.xy_titleLabel];
    
    self.xy_contentLabel = [[UILabel alloc]init];
    [self.xy_cellImgView addSubview:self.xy_contentLabel];
    self.xy_contentLabel.textAlignment = NSTextAlignmentRight;
    self.xy_contentLabel.hidden = YES;
    self.xy_contentLabel.textColor = xySchoolNameTextColor;
    self.xy_portraitImgView = [[UIImageView alloc]init];
    [self.xy_cellImgView addSubview:self.xy_portraitImgView];
    self.xy_portraitImgView.hidden = YES;
    self.xy_portraitImgView.layer.cornerRadius = xyPadding;
    self.xy_portraitImgView.layer.masksToBounds = YES;
    self.xy_portraitImgView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.xy_switchBtn = [[UISwitch alloc]init];
    [self.xy_cellImgView addSubview:self.xy_switchBtn];
    self.xy_switchBtn.hidden = YES;
    
    [self.xy_switchBtn addTarget:self action:@selector(xySwitchBtnClick:) forControlEvents:UIControlEventValueChanged];
    
    self.xy_arrowImgView = [[UIImageView alloc]init];
    [self.xy_cellImgView addSubview:self.xy_arrowImgView];
    self.xy_arrowImgView.hidden = YES;
    [self.xy_arrowImgView setImage:[UIImage imageNamed:@"icon_next"]];
}

- (void)xyInitSubViewsFrame{
    self.xy_cellImgView.frame = CGRectMake(xyPadding, 0, xy_width - xyPadding *2, xyChatFriendListCellH);
    self.xy_titleLabel.frame = CGRectMake(xyPadding *2, 0, xy(80), CGRectGetHeight(self.xy_cellImgView.frame));
    
    CGFloat arrowW = xy(6.5);
    CGFloat arrowH = xy(11.5);
    self.xy_arrowImgView.frame = CGRectMake(CGRectGetWidth(self.xy_cellImgView.frame) - xyPadding - arrowW,(CGRectGetHeight(self.xy_cellImgView.frame) - arrowH)/2, arrowW, arrowH);
    
    CGFloat contentLabelX = CGRectGetMaxX(self.xy_titleLabel.frame) + xyPadding ;
    CGFloat contentLabelY = 0;
    CGFloat contentLabelW = self.xy_arrowImgView.frame.origin.x - contentLabelX - xyPadding;
    CGFloat contentLabelH = CGRectGetHeight(self.xy_cellImgView.frame);
    
    self.xy_contentLabel.frame = CGRectMake( contentLabelX,contentLabelY,contentLabelW, contentLabelH);
    
    CGFloat portraitImgW = xy(30);
    self.xy_portraitImgView.frame = CGRectMake(CGRectGetMaxX(self.xy_contentLabel.frame) -portraitImgW , (CGRectGetHeight(self.xy_cellImgView.frame) - portraitImgW)/2, portraitImgW, portraitImgW);
    
    self.xy_switchBtn.frame = CGRectMake(CGRectGetMaxX(self.xy_arrowImgView.frame) - xy(51), (CGRectGetHeight(self.xy_cellImgView.frame) - xy(31)), xy(51), xy(31));
}

- (void)setXy_GroupItem:(XYGroupItem *)xy_GroupItem{
    _xy_GroupItem = xy_GroupItem;
    self.xy_contentLabel.text = xy_GroupItem.itemGroupName;
    [self.xy_portraitImgView setImage:xy_GroupItem.itemGroupPortrait];
    
    [self.xy_switchBtn setOn:[xy_GroupItem.itemIsGroupMessageAlert boolValue]];
}

- (void)xySwitchBtnClick:(UISwitch *)sender{

    if(self.xy_delegate && [self.xy_delegate respondsToSelector:@selector(xyGroupCellDisturbSwitchWithSender:withCell:)]){
        [self.xy_delegate xyGroupCellDisturbSwitchWithSender:sender withCell:self];
    }
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
}


@end







