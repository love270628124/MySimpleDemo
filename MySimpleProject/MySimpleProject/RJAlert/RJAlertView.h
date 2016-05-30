//
//  RJAlertView.h
//  MySimpleProject
//
//  Created by Raija on 16/5/27.
//  Copyright © 2016年 Raija. All rights reserved.
//


/**
 *  弹窗
 **/
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface RJAlertView : UIView

+ (RJAlertView *)standerDefaults;

- (void)showInSuperView:(UIView *)aSuperView;

- (void)showInWindow;

@end
