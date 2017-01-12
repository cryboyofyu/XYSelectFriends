//
//  XYHUD.h
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/6.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>
@interface XYHUD : UIView
+ (void)showCustomHUDWithBgView:(UIView *)bgView withTitle:(NSString *)title;

+ (void)showCustomHUDWithBgView:(UIView *)bgView withTitle:(NSString * )title withDelay:(NSTimeInterval)timeDelay;

+ (MBProgressHUD *)lvShowCustomHUDWithBgView:(UIView *)bgView withTitle:(NSString *)title withDelay:(NSTimeInterval)timeDelay;


- (UIAlertController *)lvShowAlertViewWithTitle:(NSString *)lvTitle withMessage:(NSString *)lvMessage;

@property (nonatomic,strong)void (^lvReturnOKBtnClick)();

- (void)lvShowNightStatusAlertWithImage:(NSString *)image withContent:(NSString *)content withTimeStr:(NSString *)timeStr withClass:(id)class withAction:(SEL)sel;

+ (UIAlertController *)xyShowAlertTitle:(NSString *)title withMessage:(NSString *)message withUIAlertControllerStyle:(UIAlertControllerStyle )style withReturnValue:(void (^)(id reponseObject))returnValue;

@end
