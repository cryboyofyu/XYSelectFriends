//
//  XYSelectFriendsTVC.m
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/10.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import "XYSelectFriendsTVC.h"
#import "XYSelectFriendsCell.h"
#import "XYGROUPCONSTANT.h"
@interface XYSelectFriendsTVC ()

@end

@implementation XYSelectFriendsTVC
- (instancetype)init{
    self = [super init];
    if(self){
        self.xySeletedMArr = [[NSMutableArray alloc]init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
        self.tableView.sectionIndexColor = [UIColor blackColor];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteContactFinish:) name:@"deleteContactFinish" object:nil];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.xyDataMArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary * dic =  [self.xyDataMArr objectAtIndex:section];
    NSMutableArray * lvMArr = [NSMutableArray arrayWithArray:[dic allValues][0]];
    return lvMArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifier = @"LVCell";
    XYSelectFriendsCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[XYSelectFriendsCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    
    NSDictionary * dic =  [self.xyDataMArr objectAtIndex:indexPath.section];
    NSMutableArray * lvMArr = [dic allValues][0];
    if(lvMArr.count >0){
        
        XYUserItem * item = [lvMArr objectAtIndex:indexPath.row];
        
        cell.xyCellItem = item;
        
    }
    return cell;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary  * dic = [self.xyDataMArr objectAtIndex:section];
    NSString * str = [[dic allKeys] objectAtIndex:0];
    NSLog(@"什么:%@",str);
    return str;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return xyChatFriendListCellH + xy(0.5);
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    NSLog(@"索引title:%@,index:%ld",title,index);
    
    [tableView
     scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index]
     atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    return index;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XYSelectFriendsCell  * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.xyIsChecked = !cell.xyIsChecked;
    NSDictionary * dic =  [self.xyDataMArr objectAtIndex:indexPath.section];
    NSMutableArray * lvMArr = [dic allValues][0];
    if(lvMArr.count >0){
        
        XYUserItem * item = [lvMArr objectAtIndex:indexPath.row];
        item.itemIsSelected= cell.xyIsChecked;
        if(item.itemIsSelected == YES){
            [self.xySeletedMArr addObject:item];
        }else{
            [self.xySeletedMArr removeObject:item];
            
        }
    }
    
    NSLog(@"\n选中:%@\n",self.xySeletedMArr);
    self.xyReturnSelectedMArrBlock(_xySeletedMArr);
    
}

#pragma mark-lv ----------------------------响应位置-------------------------------
- (void)deleteContactFinish:(NSNotification *)not{
    NSDictionary * paraDic = not.userInfo;
    NSInteger index = [[paraDic objectForKey:@"LVKEY"] integerValue];
    
    XYUserItem * item = [self.xySeletedMArr objectAtIndex:index];
    item.itemIsSelected = NO;
    
    [self.xySeletedMArr removeObjectAtIndex:index];
    self.xyReturnSelectedMArrBlock(_xySeletedMArr);
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
