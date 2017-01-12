//
//  XYGroupMembersShow.m
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/5.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import "XYGroupMembersShow.h"
#import "XYGroupCollectionCell.h"
#import "XYGROUPCONSTANT.h"
@interface XYGroupMembersShow ()

@end

@implementation XYGroupMembersShow

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init{
    self = [super init];
    if(self){
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(self.xy_isOwner == YES){
        return self.xy_membersMArr.count + 2;
    }else{
        return self.xy_membersMArr.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"LVCELL";
    XYGroupCollectionCell * xyCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if(indexPath.row <_xy_membersMArr.count){
        XYUserItem * item = [_xy_membersMArr objectAtIndex:indexPath.row];
        xyCell.xy_userItem = item;
        
    }
    
    if(self.xy_isOwner == YES){
        if(indexPath.row == self.xy_membersMArr.count ){
            [xyCell.xy_portraitImgView setImage:[UIImage imageNamed:@"add_member"]];
            xyCell.xy_nameLabel.text = @"";
            
        }else if(indexPath.row == (self.xy_membersMArr.count +1)){
            [xyCell.xy_portraitImgView setImage:[UIImage imageNamed:@"delete_member"]];
            xyCell.xy_nameLabel.text = @"";
            
        }
        
    }else{
        if(indexPath.row == self.xy_membersMArr.count ){
            [xyCell.xy_portraitImgView setImage:[UIImage imageNamed:@"add_member"]];
            xyCell.xy_nameLabel.text = @"";
            
        }
    }
    
    return xyCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(xyCollectionCellW, xyCollectionCellH);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UICollectionViewFlowLayout * flowLayout = (UICollectionViewFlowLayout *)collectionViewLayout;
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.minimumLineSpacing = 12;
    return UIEdgeInsetsMake(xyPadding * 2, xyPadding *2, xyPadding *2, xyPadding *2);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    XYGroupCollectionCell * xyCell = (XYGroupCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if(self.xy_delegate&&[self.xy_delegate respondsToSelector:@selector(xy_groupItemSelected:withIndexPath:)]){
        [self.xy_delegate xy_groupItemSelected:xyCell withIndexPath:indexPath];
    }
}

@end




























