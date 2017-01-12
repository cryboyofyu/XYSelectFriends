//
//  XYGroupMembersShow.h
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/5.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYGroupItemDelegate <NSObject>

- (void)xy_groupItemSelected:(id)sender withIndexPath:(NSIndexPath *)indexPath;

@end

@interface XYGroupMembersShow : UICollectionViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)NSMutableArray * xy_membersMArr;
@property (nonatomic,assign)BOOL             xy_isOwner;
@property (nonatomic,weak) id<XYGroupItemDelegate>xy_delegate;

@end








