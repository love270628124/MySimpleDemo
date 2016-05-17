//
//  RJLoadingHUD.h
//  MySimpleProject
//
//  Created by Raija on 16/5/13.
//  Copyright © 2016年 Raija. All rights reserved.
//

#import <UIKit/UIKit.h>

/**/
typedef NS_ENUM(NSUInteger, RJProgressHUDType) {
    RJProgressHUDTypeDarkForground,
    RJProgressHUDTypeDarkBackground
};

/**/
typedef NS_ENUM(NSUInteger, RJProgressHUDShape) {
    RJProgressHUDShapeLinear,
    RJProgressHUDShapeCircle
};

@interface RJProgressHUD : UIView

@property (nonatomic, assign) RJProgressHUDType     type;
@property (nonatomic, assign) RJProgressHUDShape    shape;
@property (nonatomic, assign) CGFloat   diameter;   //radius * 2
@property (nonatomic, strong) NSString  *text;

/**/
- (id)initWithView:(UIView *)superView;
/**/
- (void)show;
/**/
- (void)showWithAnimation:(BOOL)animated;
/**/
- (void)showWithAnimation:(BOOL)animated duration:(NSTimeInterval)duration;
/**/
- (void)dismiss;
/**/
- (void)dismissWithAnimation:(BOOL)animation;

@end
