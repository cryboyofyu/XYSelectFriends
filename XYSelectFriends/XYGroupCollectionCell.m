//
//  XYGroupCollectionCell.m
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/5.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import "XYGroupCollectionCell.h"
#import "XYGROUPCONSTANT.h"
#import <UIImageView+WebCache.h>
@implementation XYGroupCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self xyInitSubViews];
        [self xyInitSubViewsFrame];
    }
    return self;
}

- (void)xyInitSubViews{
    self.xy_portraitImgView = [[UIImageView alloc] init];
    self.xy_portraitImgView.clipsToBounds = YES;
    self.xy_portraitImgView.layer.cornerRadius = xy(3);
    [self.xy_portraitImgView setBackgroundColor:[UIColor clearColor]];
    self.xy_portraitImgView.contentMode = UIViewContentModeScaleAspectFill;
    self.xy_portraitImgView.userInteractionEnabled = YES;
    
    [self.contentView addSubview:self.xy_portraitImgView];
    
    self.xy_nameLabel = [UILabel new];
    [self.xy_nameLabel setTextColor:xyCollectionLabelTextColor];
    [self.xy_nameLabel setFont:[UIFont systemFontOfSize:12]];
    [self.xy_nameLabel setTextAlignment:NSTextAlignmentCenter];
    [self.contentView addSubview:self.xy_nameLabel];
    
}

- (void)xyInitSubViewsFrame{
    self.xy_portraitImgView.frame = CGRectMake(0, 0, xyCollectionCellW,xyCollectionCellW);
    self.xy_nameLabel.frame = CGRectMake(0, CGRectGetMaxY(self.xy_portraitImgView.frame), CGRectGetWidth(self.xy_portraitImgView.frame),xyCollectionCellH - xyCollectionCellW);
}

- (void)setXy_userItem:(XYUserItem *)xy_userItem{
    _xy_userItem = xy_userItem;
    xy_userItem.itemIsSelected = NO;
    [self.xy_portraitImgView sd_setImageWithURL:[NSURL URLWithString:xy_userItem.itemUserHead] placeholderImage:[UIImage imageNamed:xyCellPortraitPlaceholder]];
    self.xy_nameLabel.text = xy_userItem.itemUserName;}



@end












