//
//  XYGroupSetTVC.m
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/5.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import "XYGroupSetTVC.h"
#import "XYGroupSetCell.h"
#import "XYGROUPCONSTANT.h"
@interface XYGroupSetTVC ()<XYGoupSetCellDelegate>
{
    NSMutableArray * _xyIconMArr;
}
@end

@implementation XYGroupSetTVC

- (instancetype)init{
    self = [super init];
    if(self){
        [self xySetTVC];
        [self lvInitMArr];
    }
    return self;

}

- (void)lvInitMArr{
    _xyIconMArr = [[NSMutableArray alloc]init];
    NSArray * lvArr1 = [NSArray arrayWithObject:@"群聊名称"];
    NSArray * lvArr2 = [NSArray arrayWithObjects:@"群组头像",@"消息免打扰", nil];
    [_xyIconMArr addObject:lvArr1];
    [_xyIconMArr addObject:lvArr2];
    
}

- (void)xySetTVC{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.sectionHeaderHeight = 0;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _xyIconMArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_xyIconMArr[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifier = @"LVCELL";
    XYGroupSetCell * xyCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!xyCell){
        xyCell = [[XYGroupSetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    xyCell.xy_delegate = self;
    xyCell.xy_switchBtn.hidden = YES;
    xyCell.xy_contentLabel.hidden = YES;
    xyCell.xy_portraitImgView.hidden = YES;

    if(indexPath.row == 0){
        [xyCell.xy_cellImgView setImage:[UIImage imageNamed:@"TFup_bgImage"]];
    }else if(indexPath.row == ([_xyIconMArr[indexPath.section] count]-1)){
        [xyCell.xy_cellImgView setImage:[UIImage imageNamed:@"TFdown_bgImage"]];
        
    }
    
    if(indexPath.section == 0){
        [xyCell.xy_cellImgView setImage:[UIImage imageNamed:@"TF_bgImage"]];
        
        xyCell.xy_contentLabel.hidden = NO;
        xyCell.xy_arrowImgView.hidden = NO;
    }
    if(indexPath.section == 1){
        if(indexPath.row == 0){
            xyCell.xy_arrowImgView.hidden = NO;
            xyCell.xy_portraitImgView.hidden = NO;
        }
        if(indexPath.row == 1){
            xyCell.xy_switchBtn.hidden = NO;
        }
    }
    
    xyCell.xy_titleLabel.text = [ _xyIconMArr[indexPath.section] objectAtIndex:indexPath.row];
    xyCell.xy_GroupItem = _xy_groupItem;
    return xyCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return xyChatFriendListCellH + xy(0.5);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return xyPadding *2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XYGroupSetCell * xyCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if([self.xy_delegate respondsToSelector:@selector(xyGroupSetCellSelected:withIndexPath:)]){
        [self.xy_delegate xyGroupSetCellSelected:xyCell withIndexPath:indexPath];
    }
}

- (void)xyGroupCellDisturbSwitchWithSender:(id)sender withCell:(id)cell{
    if(self.xy_delegate && [self.xy_delegate respondsToSelector:@selector(xyGroupSetTVCDisturbSwitchSender:withCell:)]){
        [self.xy_delegate xyGroupSetTVCDisturbSwitchSender:sender withCell:cell];
    }
}



@end










