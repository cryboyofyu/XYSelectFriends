//
//  XYGroupSetVC.m
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/5.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import "XYGroupSetVC.h"
#import "XYGroupMembersShow.h"
#import "XYGroupSetTVC.h"
#import "XYGROUPCONSTANT.h"
#import "XYGroupCollectionCell.h"
#import "XYHUD.h"
#import "XYSelectFriendsVC.h"
#import "XYConversationManager.h"
@interface XYGroupSetVC ()<XYGroupItemDelegate,XYGroupSetTVCDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UIView * _xyBgView;
    XYGroupMembersShow * _xyGroupMembersShow;
    NSMutableArray * _xyMembersMArr;
    XYGroupSetTVC * _xyGroupSetTVC;
    UIButton * _xyDeleteBtn;//删除并退出
    UIButton * _xyDissolveBtn;//解散并删除
    UIAlertController * _xyAlertController;
    
}
@end

@implementation XYGroupSetVC
- (instancetype)init{
    self = [super init ];
    if(self){
        [self xyInitMArr];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.xy_IsGroupOwner = YES;
    [self xyRequestGetGroupMembersInfo];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self xyJudge];
    [self xyLayoutBgView];
    [self xyLayoutHeaderView];
    [self xyLayoutTableView];
    [self xyLayoutFooterView];
    [self xyLayoutActionSheet];
    
}

- (void)xyInitMArr{
    _xy_GroupItem = [[XYGroupItem alloc]init];
    _xy_GroupItem.itemGroupId = @"0001";
    _xy_GroupItem.itemGroupName = @"欣宇技术群Q:549943887";
    _xy_GroupItem.itemGroupNum =  @"50";
    _xy_GroupItem.itemGroupPortrait = [UIImage imageNamed:@"girl0.jpg"];
    _xyMembersMArr = [[NSMutableArray alloc]init];

}

- (void)xyJudge{
    
    if([self.xy_GroupItem.itemGroupOwnerId isEqualToString:@"自己的用户id"]){
        self.xy_IsGroupOwner = YES;
    }
}

- (void)xyLayoutBgView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"欣宇技术群Q:549943887";
    _xyBgView = [[UIView alloc]initWithFrame:CGRectMake(0,64,xy_width, xy_height - 64)];
    [self.view addSubview:_xyBgView];
    _xyBgView.backgroundColor = xyGrayColor;
    
}

- (void)xyLayoutHeaderView{
    UICollectionViewFlowLayout * lvLayout = [[UICollectionViewFlowLayout alloc]init];
    lvLayout.itemSize = CGSizeMake(xy(45), xy(60));
    lvLayout.minimumLineSpacing = xyPadding;
    lvLayout.minimumInteritemSpacing = (xy_width - xyPadding*2 *2 - xyCollectionCellW *4)/3;
    [lvLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _xyGroupMembersShow = [[XYGroupMembersShow alloc]initWithCollectionViewLayout:lvLayout];
    _xyGroupMembersShow.xy_delegate = self;
    _xyGroupMembersShow.xy_isOwner = _xy_IsGroupOwner;
    _xyGroupMembersShow.view.backgroundColor = [UIColor redColor];
    _xyGroupMembersShow.xy_membersMArr = _xyMembersMArr;
    
    _xyGroupMembersShow.collectionView.scrollEnabled = NO;
    _xyGroupMembersShow.collectionView.layer.cornerRadius = xyPadding;
    _xyGroupMembersShow.collectionView.layer.masksToBounds = YES;
    
    _xyGroupMembersShow.collectionView.frame = CGRectMake(xyPadding,xyPadding*2, xy_width - xyPadding *2,xy(200));
    _xyGroupMembersShow.collectionView.backgroundColor = [UIColor whiteColor];
    [_xyGroupMembersShow.collectionView registerClass:[XYGroupCollectionCell class] forCellWithReuseIdentifier:@"LVCELL"];
    
    
}

- (void)xyChangeHeaderH{
    
    NSInteger  count = 0;
    if(self.xy_IsGroupOwner == YES){
        if(([XYConversationManager xy_shareManger].xyGroupMembersMArr.count+2) %4==0){
            count = ([XYConversationManager xy_shareManger].xyGroupMembersMArr.count + 2)/4;
        }else{
            count = ([XYConversationManager xy_shareManger].xyGroupMembersMArr.count + 2)/4 + 1;
            
        }
    }else{
        if(([XYConversationManager xy_shareManger].xyGroupMembersMArr.count) %4==0){
            count = ([XYConversationManager xy_shareManger].xyGroupMembersMArr.count )/4;
        }else{
            count = ([XYConversationManager xy_shareManger].xyGroupMembersMArr.count )/4 + 1;
            
        }
    }
    [_xyMembersMArr removeAllObjects];
    [_xyMembersMArr addObjectsFromArray:[XYConversationManager xy_shareManger].xyGroupMembersMArr];
    _xyGroupMembersShow.collectionView.frame = CGRectMake(_xyGroupMembersShow.collectionView.frame.origin.x,xyPadding *2, _xyGroupMembersShow.collectionView.frame.size.width, count * (xyCollectionCellH + xyPadding ) + xyPadding *4);
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, xy_width, _xyGroupMembersShow.collectionView.frame.size.height + xyPadding*4)];
    [headerView addSubview:_xyGroupMembersShow.collectionView];
    _xyGroupSetTVC.tableView.tableHeaderView = headerView;
    
}

- (void)xyLayoutTableView{
    _xyGroupSetTVC = [[XYGroupSetTVC alloc]init];
    _xyGroupSetTVC.xy_delegate = self;
    _xyGroupSetTVC.xy_groupItem = _xy_GroupItem;
    _xyGroupSetTVC.view.frame = CGRectMake(0, 0, _xyBgView.bounds.size.width, _xyBgView.bounds.size.height);
    _xyGroupSetTVC.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _xyGroupSetTVC.tableView.backgroundColor = xyGrayColor;

    [_xyBgView addSubview:_xyGroupSetTVC.tableView];

}

- (void)xyLayoutFooterView{
    
    UIView * footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, xy_width, xy(150))];
    _xyDeleteBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _xyDeleteBtn.frame = CGRectMake(xyPadding, 0, xy_width - xyPadding *2, xyDefaultBtnH);
    _xyDeleteBtn.hidden = YES;
    [footerView addSubview:_xyDeleteBtn];
    _xyDeleteBtn.backgroundColor = [UIColor redColor];
    [_xyDeleteBtn setTitle:@"删除并退出" forState:UIControlStateNormal];
    _xyDeleteBtn.hidden = YES;
    [_xyDeleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _xyDeleteBtn.layer.cornerRadius = xyPadding;
    [_xyDeleteBtn addTarget:self action:@selector(xyDeleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _xyDissolveBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _xyDissolveBtn.frame = CGRectMake(xyPadding, 0, xy_width - xyPadding *2, xyDefaultBtnH);
    [footerView addSubview:_xyDissolveBtn];
    _xyDissolveBtn.backgroundColor = [UIColor redColor];
    [_xyDissolveBtn setTitle:@"解散并退出" forState:UIControlStateNormal];
    _xyDissolveBtn.layer.cornerRadius = xyPadding;
    [_xyDissolveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_xyDissolveBtn addTarget:self action:@selector(xyDissolveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    if([_xy_GroupItem.itemGroupOwnerId isEqualToString:@"自己用户id"]){
        _xyDissolveBtn.hidden = NO;
    }else{
        _xyDeleteBtn.hidden = NO;
    }
    _xyGroupSetTVC.tableView.tableFooterView = footerView;
    
    
    
}

-(void)xyLayoutActionSheet{
    
    _xyAlertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * takePhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self takePhoto];

    }];
    
    UIAlertAction * photoAction = [UIAlertAction actionWithTitle:@"手机相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self LocalPhoto];

    }];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [_xyAlertController addAction:takePhotoAction];
    [_xyAlertController addAction:photoAction];
    [_xyAlertController addAction:cancelAction];
}

-(void)LocalPhoto{
    
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.allowsEditing = YES;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

-(void)takePhoto{
    //资源类型为照相机
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //判断是否有相机
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:nil];
    }else {
        NSLog(@"该设备无摄像头");
    }
}

#pragma mark-lv -----------------代理位置---------------------------------
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    [self xySetPortraitImgWithInfo:info];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)xySetPortraitImgWithInfo:(NSDictionary *)info{
    UIImage * xyImg = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    _xy_GroupItem.itemGroupPortrait = xyImg;
    [XYHUD showCustomHUDWithBgView:self.view withTitle:@"群头像更换成功!"];

    [self xyRequestGetGroupMembersInfo];
}

#pragma mark-lv --------------------代理位置--------------------------------------

- (void)xyGroupSetCellSelected:(id)sender withIndexPath:(NSIndexPath *)indexPath{

        if(indexPath.section == 0){
            NSLog(@"设定群组名字");
            UIAlertController * alertController = [XYHUD xyShowAlertTitle:nil withMessage:@"设置群名称!" withUIAlertControllerStyle:UIAlertControllerStyleAlert withReturnValue:^(id reponseObject) {
                _xy_GroupItem.itemGroupName = reponseObject;
                [self xyRequestGetGroupMembersInfo];
                [XYHUD showCustomHUDWithBgView:self.view withTitle:@"群名更改成功!"];

            }];
            [self presentViewController:alertController animated:YES completion:nil];
            
        }else{
            if(indexPath.row == 0){
                [self presentViewController:_xyAlertController animated:YES completion:nil];
            }else{
                
            }
        }
}

- (void)xy_groupItemSelected:(id)sender withIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == _xyMembersMArr.count){
        NSLog(@"添加选择联系人");
                XYSelectFriendsVC * xySelectFriendsVC = [[XYSelectFriendsVC alloc]init];
                xySelectFriendsVC.xyTitle = @"选择联系人";
                xySelectFriendsVC.xyGroupId = self.xy_GroupItem.itemGroupId;
                xySelectFriendsVC.xyType = XYSelectContactAdd;
                [self.navigationController pushViewController:xySelectFriendsVC animated:YES];
    }else if(indexPath.row == _xyMembersMArr.count +1){
        NSLog(@"删除选择联系人");
        
                XYSelectFriendsVC * xyDeleteFriendsVC = [[XYSelectFriendsVC alloc]init];
                xyDeleteFriendsVC.xyTitle = @"选择联系人";
                xyDeleteFriendsVC.xyType = XYSelectContactDelete;
                xyDeleteFriendsVC.xyGroupId = self.xy_GroupItem.itemGroupId;
                xyDeleteFriendsVC.xyGroupMembersMArr = [NSMutableArray arrayWithArray:_xyMembersMArr];
                [self.navigationController pushViewController:xyDeleteFriendsVC animated:YES];
    }else{
        NSLog(@"进入个人页面按钮被点击了");
    }

}

- (void)xyGroupSetTVCDisturbSwitchSender:(id)sender withCell:(id)cell{
    UISwitch * xySwitch = sender;
    if(xySwitch.isOn){
        NSLog(@"isOn");
        [XYHUD showCustomHUDWithBgView:self.view withTitle:@"免打扰已开启!"];
    }else{
        NSLog(@"isOff");
        [XYHUD showCustomHUDWithBgView:self.view withTitle:@"免打扰已关闭!"];

    }
}

#pragma mark-lv ---------------------响应位置---------------------------------------
- (void)xyBackBtnClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)xyDeleteBtnClick:(UIButton *)sender{
    NSLog(@"\n删除并退出按钮被点击了\n");
}

- (void)xyDissolveBtnClick:(UIButton *)sender{
    [self xyRequestDissolveGroup];

}

- (void)xyLayoutAlertDeleteControl{
    XYHUD * lvHud = [[XYHUD alloc]init];
    UIAlertController * lvAlertController = [lvHud lvShowAlertViewWithTitle:@"警告!" withMessage:@"将退出群组"];
    lvHud.lvReturnOKBtnClick = ^(){
        
    };
    [self presentViewController:lvAlertController animated:YES completion:nil];
}

#pragma mark-lv -------------------请求位置-----------------------------------------
- (void)xyRequestGetGroupMembersInfo{

    _xyGroupSetTVC.xy_groupItem = _xy_GroupItem;
    if([XYConversationManager xy_shareManger].xyGroupMembersMArr.count>0){
        _xyGroupMembersShow.xy_membersMArr = [NSMutableArray arrayWithArray:[XYConversationManager xy_shareManger].xyGroupMembersMArr];

    }else{
        for(int i=0;i<10;i++){
            XYUserItem * userItem = [[XYUserItem alloc]init];
            userItem.itemUserId = [NSString stringWithFormat:@"%d",i];
            userItem.itemUserName = [NSString stringWithFormat:@"欣宇%d",i];
            userItem.itemUserHead = @"http://f.hiphotos.baidu.com/image/pic/item/bba1cd11728b47101489df48c0cec3fdfd03238b.jpg";
            

            [_xyMembersMArr addObject:userItem];
            
        }
        [XYConversationManager xy_shareManger].xyGroupMembersMArr = [NSMutableArray arrayWithArray:_xyMembersMArr];
        _xyGroupMembersShow.xy_membersMArr = [NSMutableArray arrayWithArray:_xyMembersMArr];

    }
    
    _xyGroupMembersShow.xy_isOwner = YES;
    [self xyChangeHeaderH];
    [_xyGroupMembersShow.collectionView reloadData];
    [_xyGroupSetTVC.tableView reloadData];
    
    
}

- (void)xyRequestDissolveGroup{
    
    [XYHUD showCustomHUDWithBgView:[UIApplication sharedApplication].keyWindow withTitle:@"该群组已解散!"];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)xyRequestExitGroup{
    
    [XYHUD showCustomHUDWithBgView:[UIApplication sharedApplication].keyWindow withTitle:@"已退出该群组!"];
    [self.navigationController popToRootViewControllerAnimated:YES];
                
    
}

- (void)xyRequestModifyGroupPortrait{
    
   [XYHUD showCustomHUDWithBgView:self.view withTitle:@"修改成功!"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end










