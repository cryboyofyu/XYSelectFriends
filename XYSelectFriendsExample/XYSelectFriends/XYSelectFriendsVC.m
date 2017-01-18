//
//  XYSelectFriendsVC.m
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/10.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import "XYSelectFriendsVC.h"
#import "XYSelectFriendsTVC.h"
#import "XYSelectedFriendsHeaderSV.h"
#import "XYUserItem.h"
#import "XYHUD.h"
#import "XYConversationManager.h"
@interface XYSelectFriendsVC ()
{
    UIView * _bgView;
    XYSelectFriendsTVC * _xySelectFriendsTVC;
    
    XYSelectedFriendsHeaderSV * _xySelectedHeaderSV;
    UIView * _headerBgView;
    NSString * _membersIdStr;
    char  _letter;
    int _xy;

}
@end

@implementation XYSelectFriendsVC

- (instancetype)init{
    self = [super init ];
    if(self){
        _letter = 'A';
        _xy = 0;
    }
    return self;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self xyLayoutNavigationBar];
    [self layoutBgView];
    [self xyLayoutHeaderView];
    [self layoutSelectFriendListTableView];
    if(self.xyType == XYSelectContactCreate){
        
    }else if(self.xyType == XYSelectContactAdd){
        [self xyRequestMyAllFriends];

    }else if(self.xyType == XYSelectContactDelete){
        [self xyMakeGroupMembers];
    }
}

- (void)xyLayoutNavigationBar{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = _xyTitle;
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(xyMakeSureBtnClick)];
    self.navigationItem.rightBarButtonItem = item;
    
}

- (void)layoutBgView{
    

    self.view.backgroundColor = [UIColor whiteColor];
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0,xy(64),xy_width, xy_height - xy(64))];
    [self.view addSubview:_bgView];
    _bgView.backgroundColor = xyGrayColor;
}

- (void)xyLayoutHeaderView{
    _headerBgView = [[UIView alloc]initWithFrame:CGRectMake(0,xyPadding, xy_width, xyChatFriendListCellH)];
    [_bgView addSubview:_headerBgView];
    _xySelectedHeaderSV = [[XYSelectedFriendsHeaderSV alloc]initWithFrame:CGRectMake(xyPadding,0, xy_width - xyPadding *2, xyChatFriendListCellH)];
    _xySelectedHeaderSV.contentSize = CGSizeMake(xy_width, xyChatFriendListCellH);
    [_headerBgView addSubview:_xySelectedHeaderSV];
}

- (void)layoutSelectFriendListTableView{

    _xySelectFriendsTVC = [[XYSelectFriendsTVC alloc]init];
    
    _xySelectFriendsTVC.view.frame = CGRectMake(0,CGRectGetMaxY(_headerBgView.frame), _bgView.bounds.size.width, _bgView.bounds.size.height - CGRectGetMaxY(_headerBgView.frame) - xyPadding);
    _xySelectFriendsTVC.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _xySelectFriendsTVC.tableView.backgroundColor = xyGrayColor;
    [_bgView addSubview:_xySelectFriendsTVC.tableView];
    
    @XYWeakObj(_xySelectedHeaderSV)

    _xySelectFriendsTVC.xyReturnSelectedMArrBlock = ^(NSMutableArray * selectedMArr){
        _xySelectedHeaderSVWeak.xySelectedMArr = selectedMArr;
        
    };
}

#pragma mark-lv ---------------------响应位置---------------------------------------
- (void)xyMakeSureBtnClick{
    
            if(_xySelectFriendsTVC.xySeletedMArr.count>0){
                
                if(self.xyType == XYSelectContactCreate){
                    NSLog(@"创建群成功!");
                    
                }else if(self.xyType == XYSelectContactAdd){
                    if(_xyGroupId.length >0){
                        NSLog(@"所选联系人加入成功!");
                        [[XYConversationManager xy_shareManger].xyGroupMembersMArr addObjectsFromArray:_xySelectFriendsTVC.xySeletedMArr];
                        [XYHUD showCustomHUDWithBgView:[UIApplication sharedApplication].keyWindow withTitle:@"所选联系人加入成功!"];
                    }
                }else if(self.xyType == XYSelectContactDelete){
                    NSLog(@"所选联系人删除成功!");
                    [[XYConversationManager xy_shareManger].xyGroupMembersMArr removeObjectsInArray:_xySelectFriendsTVC.xySeletedMArr];
                    [XYHUD showCustomHUDWithBgView:[UIApplication sharedApplication].keyWindow withTitle:@"所选联系人删除成功!"];

                }
            }else{
                
                    [XYHUD showCustomHUDWithBgView:self.view withTitle:@"请选择联系人!"];
                
            }
    [self.navigationController popViewControllerAnimated:YES];

    
}

#pragma mark-lv --------------------请求位置----------------------------------------
- (void)xyRequestMyAllFriends{
    NSMutableArray * friendsMarr = [NSMutableArray arrayWithCapacity:100];
    NSArray * imgArr = @[@"http://d.hiphotos.baidu.com/image/h%3D200/sign=4241e02c86025aafcc3279cbcbecab8d/562c11dfa9ec8a13f075f10cf303918fa1ecc0eb.jpg",@"http://g.hiphotos.baidu.com/image/h%3D200/sign=6531859969600c33ef79d9c82a4d5134/55e736d12f2eb93895023c7fd7628535e4dd6fcb.jpg",@"http://g.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c81e68f5be6be3eb13533fa4007.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/b21c8701a18b87d6dcf88618050828381f30fd7b.jpg",@"http://g.hiphotos.baidu.com/image/pic/item/5243fbf2b21193130e676fb067380cd791238d8e.jpg"];
    for(int i=0;i<26;i++){
        int count = arc4random()%7;
        NSMutableDictionary * mDic = [NSMutableDictionary dictionaryWithCapacity:100];
        
        
        NSMutableArray * letterArr = [NSMutableArray arrayWithCapacity:100];
        for(int j=0;j<count;j++){
            _xy++;
            XYUserItem * userItem = [[XYUserItem alloc]init];
            userItem.itemUserId = [NSString stringWithFormat:@"%d",i];
            userItem.itemUserName = [NSString stringWithFormat:@"欣宇%d",_xy];
            userItem.itemUserHead =imgArr[arc4random()%imgArr.count];
            [letterArr addObject:userItem];
        }
        
        [mDic setObject:letterArr forKey:[NSString stringWithFormat:@"%c",_letter]];

        [friendsMarr addObject:mDic];
        if(_letter<= 'Z'){
            _letter++;
        }else{
            _letter = 'A';
        }

    }
    _xySelectFriendsTVC.xyDataMArr = [NSMutableArray arrayWithArray:friendsMarr];

}

- (void)xyMakeGroupMembers{
    
    NSDictionary * dic = @{@"L":self.xyGroupMembersMArr};
    _xySelectFriendsTVC.xyDataMArr = [NSMutableArray arrayWithArray:@[dic]];

}




@end














