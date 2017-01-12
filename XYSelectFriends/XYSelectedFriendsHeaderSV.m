//
//  XYSelectedFriendsHeaderSV.m
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/10.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import "XYSelectedFriendsHeaderSV.h"
#import "XYUserItem.h"
#import <UIImageView+WebCache.h>
#import "XYGROUPCONSTANT.h"
@implementation XYSelectedFriendsHeaderSV

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setXySelectedMArr:(NSMutableArray *)xySelectedMArr{
    _xySelectedMArr = xySelectedMArr;
    for(UIView *view in self.subviews){
        [view removeFromSuperview];
    }
    
    CGFloat padding = (self.bounds.size.width - xyChatFriendListPortraitH *7 )/8;
    for(int i=0;i<_xySelectedMArr.count;i++){
        XYUserItem * xyItem = [_xySelectedMArr objectAtIndex:i];
        CGFloat imgViewW = xyChatFriendListPortraitH;
        CGFloat imgViewH = xyChatFriendListPortraitH;
        CGFloat itemW = (imgViewW + padding);
        CGFloat imgViewX = padding + itemW *i;
        CGFloat imgViewY = (CGRectGetHeight(self.frame) - imgViewH)/2;
        
        [self xyLayoutPortraitWithFrame:CGRectMake(imgViewX, imgViewY,imgViewW,imgViewH) withItem:xyItem withTag:i];
        
        if(i == (_xySelectedMArr.count -1)){
            CGFloat maxX = imgViewX + itemW;
            if(maxX >self.bounds.size.width){
                [UIView animateWithDuration:0.2 animations:^{
                    
                    self.contentOffset = CGPointMake(maxX - self.contentSize.width + self.contentOffset.x, self.contentOffset.y);
                }];
            }
            self.contentSize = CGSizeMake(maxX, self.contentSize.height);
            
        }
        
    }
}

- (void)xyLayoutPortraitWithFrame:(CGRect)frame withItem:(XYUserItem *)item withTag:(NSInteger)tag{
    
    UIImageView * portraitImgView = [[UIImageView alloc]initWithFrame:frame];
    portraitImgView.backgroundColor = [UIColor yellowColor];
    [self addSubview:portraitImgView];
    [portraitImgView sd_setImageWithURL:[NSURL URLWithString:item.itemUserHead] placeholderImage:[UIImage imageNamed:xyCellPortraitPlaceholder]];
    portraitImgView.layer.cornerRadius = frame.size.height/2;
    portraitImgView.layer.masksToBounds =YES;
    portraitImgView.contentMode = UIViewContentModeScaleAspectFill;
    portraitImgView.tag = tag;
    portraitImgView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * deleteTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(deleteTapClick:)];
    [portraitImgView addGestureRecognizer:deleteTap];
}


- (void)deleteTapClick:(UITapGestureRecognizer *)sender{
    
    NSDictionary * paraDic = @{@"LVKEY":[NSString stringWithFormat:@"%ld",sender.view.tag]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"deleteContactFinish" object:nil userInfo:paraDic];
}


@end
