//
//  XYHUD.m
//  XYSelectFriendsVC
//
//  Created by XY Lv on 17/1/6.
//  Copyright © 2017年 吕欣宇. All rights reserved.
//

#import "XYHUD.h"
#import "XYGROUPCONSTANT.h"
@implementation XYHUD


+ (void)showCustomHUDWithBgView:(UIView *)bgView withTitle:(NSString *)title{
    MBProgressHUD * hud = [[MBProgressHUD alloc]initWithView:bgView];
    
    hud.label.text = title;
    hud.mode = MBProgressHUDModeText;
    
    [bgView addSubview:hud];
    
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:1];
}

+ (void)showCustomHUDWithBgView:(UIView *)bgView withTitle:(NSString * )title withDelay:(NSTimeInterval)timeDelay{
    MBProgressHUD * hud = [[MBProgressHUD alloc]initWithView:bgView];
    
    hud.label.text = title;
    hud.mode = MBProgressHUDModeText;
    
    [bgView addSubview:hud];
    
    [hud showAnimated:YES];
    if(timeDelay >0){
        [hud hideAnimated:YES afterDelay:timeDelay];
    }
    
    
}

+ (MBProgressHUD *)lvShowCustomHUDWithBgView:(UIView *)bgView withTitle:(NSString *)title withDelay:(NSTimeInterval)timeDelay{
    MBProgressHUD * hud = [[MBProgressHUD alloc]initWithView:bgView];
    
    hud.label.text = title;
    hud.mode = MBProgressHUDModeText;
    
    [bgView addSubview:hud];
    
    [hud showAnimated:YES];
    if(timeDelay >0){
        [hud hideAnimated:YES afterDelay:1];
    }
    
    return hud;
}

- (UIAlertController *)lvShowAlertViewWithTitle:(NSString *)lvTitle withMessage:(NSString *)lvMessage {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:lvTitle message:lvMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction * okAction =[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击确认");
        
        self.lvReturnOKBtnClick();
    }];
    
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    return alertController;
}

- (void)lvShowNightStatusAlertWithImage:(NSString *)image withContent:(NSString *)content withTimeStr:(NSString *)timeStr withClass:(id)class withAction:(SEL)sel{
    
    CGFloat bgViewW = self.bounds.size.width/15*10;
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,bgViewW, bgViewW*1.1)];
    bgView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    bgView.layer.cornerRadius = xyPadding;
    bgView.layer.masksToBounds = YES;
    [self addSubview:bgView];
    bgView.backgroundColor = [UIColor whiteColor];
    
    UIImageView * headImgView = [[UIImageView alloc]initWithFrame:CGRectMake(xyPadding, xyPadding, CGRectGetWidth(bgView.frame) - xyPadding *2, CGRectGetHeight(bgView.frame)/3)];
    [bgView addSubview:headImgView];
    [headImgView setImage:[UIImage imageNamed:image]];
    
    UILabel * contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(headImgView.frame.origin.x, CGRectGetMaxY(headImgView.frame) + xyPadding, CGRectGetWidth(headImgView.frame), xy(80))];
    [bgView addSubview:contentLabel];
    contentLabel.numberOfLines = 0;
    contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    contentLabel.text = content;
    contentLabel.font = [UIFont systemFontOfSize:xy(10)];
    //    contentLabel.backgroundColor= [UIColor redColor];
    
    UILabel * timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(contentLabel.frame.origin.x, CGRectGetMaxY(contentLabel.frame), CGRectGetWidth(contentLabel.frame), xy(15))];
    [bgView addSubview:timeLabel];
    timeLabel.text = [NSString stringWithFormat:@"开放时间: %@",timeStr];
    timeLabel.font = [UIFont systemFontOfSize:xy(10)];
    //    timeLabel.backgroundColor = [UIColor greenColor];
    
    UIButton * finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    finishBtn.frame = CGRectMake(CGRectGetWidth(bgView.frame)/6,xyPadding + CGRectGetMaxY(timeLabel.frame), CGRectGetWidth(bgView.frame)/3*2, xy(28));
    [bgView addSubview:finishBtn];
    [finishBtn setTitle:@"知道了" forState:UIControlStateNormal];
    [finishBtn setBackgroundColor:xyGreenColor];
    finishBtn.layer.cornerRadius = xyPadding;
    finishBtn.titleLabel.font = [UIFont systemFontOfSize:xy(12)];
    finishBtn.layer.masksToBounds = YES;
    [finishBtn addTarget:class action:sel forControlEvents:UIControlEventTouchUpInside];
}

+ (UIAlertController *)xyShowAlertTitle:(NSString *)title withMessage:(NSString *)message withUIAlertControllerStyle:(UIAlertControllerStyle)style withReturnValue:(void (^)(id))returnValue{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    
    UIAlertAction * okAction =[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"点击确认");
        NSArray * textfields = alertController.textFields;
        UITextField * tf = [textfields objectAtIndex:0];
        returnValue(tf.text);
        if(tf.text.length >0){
            NSLog(@"原来密码:%@",tf.text);
        }
        
    }];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        NSLog(@"添加一个textField就会调用 这个block");
        
    }];
    
    return alertController;
}


@end




