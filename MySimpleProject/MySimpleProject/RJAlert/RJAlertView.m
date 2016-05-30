//
//  RJAlertView.m
//  MySimpleProject
//
//  Created by Raija on 16/5/27.
//  Copyright © 2016年 Raija. All rights reserved.
//

#import "RJAlertView.h"

static RJAlertView *alertObj = nil;   //静态实例,初始化

#define RJColor_RGB(r,g,b)   [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255,0f) alpha:(1.0)];
#define RJColor_RGBA(r,g,b,a)   [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255,0f) alpha:(a)];

@interface RJAlertView () {
    
    UIView *popView;
}

@end

@implementation RJAlertView

- (void)drawRect:(CGRect)rect {
    
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(15,100,451,120)];
    bg.backgroundColor = UIColor.blueColor;
    
    // Create a mask layer and the frame to determine what will be visible in the view.
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    CGRect maskRect = CGRectMake(50, 50, 100, 20);
    
    // Create a path and add the rectangle in it.
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, nil, maskRect);
    
    // Set the path to the mask layer.
    [maskLayer setPath:path];
    
    // Release the path since it's not covered by ARC.
    CGPathRelease(path);
    
    // Set the mask of the view.
    bg.layer.mask = maskLayer;
    
    [self addSubview:bg];
}

+ (RJAlertView *)standerDefaults {
    
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        
        alertObj = [[self alloc] init];
    });
    
    return alertObj;
}


- (void)showInSuperView:(UIView *)aSuperView {
    
    
}

- (void)showInWindow {
    
    
}

@end
