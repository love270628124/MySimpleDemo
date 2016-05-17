//
//  RJLoadingHUD.m
//  MySimpleProject
//
//  Created by Raija on 16/5/13.
//  Copyright © 2016年 Raija. All rights reserved.
//

#import "RJProgressHUD.h"

static float const xMargin = 10;    //

float Width_Hud;
float Height_Hud;

float Degrees2Radians(float degrees) {
    return degrees * M_PI / 180;
}

@interface RJProgressHUD () {
    NSInteger   _animationIndex;    //
}

@property (nonatomic, weak) UIView  *hudView;
@property (nonatomic, weak) UILabel *stringLabel;
@property (nonatomic, strong) NSArray   *ringsColorsArr;
@property (nonatomic, strong) NSArray   *shapeLayersArr;

@end

@implementation RJProgressHUD

- (id)initWithView:(UIView *)superView {
    
    return [self initWithFrame:superView.frame];
}

- (id)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        
        self.alpha = 0.0;
        self.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        if ([UIDevice currentDevice].userInterfaceIdiom != UIUserInterfaceIdiomPad) {
            
            _diameter = 10.0;
        } else {
            
            _diameter = 12.0;
        }
        
        [self initialWithSubViews];
        [self registerKVO];
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self layout];
}

- (void)layout {
    
    if ([UIDevice currentDevice].userInterfaceIdiom != UIUserInterfaceIdiomPad) {
        
        Width_Hud = 200.0;
        Height_Hud = 80.0;
    } else {
        
        Width_Hud = 210.0;
        Height_Hud = 90.0;
    }
    
    self.hudView.frame = CGRectMake((CGRectGetWidth(self.bounds)- Width_Hud) * 0.5,
                                    (CGRectGetHeight(self.bounds) - Height_Hud) * 0.5,
                                    Width_Hud,
                                    Height_Hud);
    
    if (_shape == RJProgressHUDShapeLinear) {
        
        self.stringLabel.frame = CGRectMake(xMargin,
                                            20,
                                            CGRectGetWidth(_hudView.bounds) - xMargin * 2,
                                            16);
    } else {
        
        self.stringLabel.frame = CGRectMake(xMargin,
                                            CGRectGetHeight(_hudView.bounds) - 20,
                                            CGRectGetWidth(_hudView.bounds) - xMargin * 2,
                                            16);
    }
}

#pragma mark - initial Method

- (void)initialWithSubViews {
    
    self.hudView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

#pragma mark - private Method 

- (NSArray *)createColorShapes:(NSArray *)aColors Shape:(RJProgressHUDShape)shape {
    
    return nil;
}

#pragma mark ========== KVO ==========

- (void)registerKVO {
    
}

- (void)dealloc {
    
}

@end
