//
//  ViewController.m
//  MySimpleProject
//
//  Created by Raija on 16/5/11.
//  Copyright © 2016年 Raija. All rights reserved.
//

#import "ViewController.h"

#import "BaseValues.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *pushBtnArray;    //按钮名称数组
@property (nonatomic, assign) NSInteger baseTag;        //按钮Tag值的基值

@end

@implementation ViewController

#pragma mark - ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏标题
    self.title = @"Fist";
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    //add subuviews
    [self initWithSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Initial

- (instancetype)init {
    //初始化viewcontroller
    self = [super init];
    if (self) {
        //背景色
        self.view.backgroundColor = COLOR_BLUE;
    }
    return self;
}

- (void)initWithSubViews {
    //初始化subviews
    for (int i = 0; i < self.pushBtnArray.count; i++) {
        //
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((10 + 100 * i) * Zoom_Width, (Height_Nav + 5 + (35 * i)) * Zoom_Height, 100 * Zoom_Width, 30 * Zoom_Height);
        btn.tag = i + self.baseTag;
        btn.backgroundColor = Color_Random;
        [btn setTitle:self.pushBtnArray[i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
    }
    //测试使用矢量图（PDF格式）
//    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 200, 100, 100)];
//    imgView.contentMode = UIViewContentModeScaleToFill;
//    imgView.image = [UIImage imageNamed:@"naniu"];
//    [self.view addSubview:imgView];
    
}

- (NSArray *)pushBtnArray {
    
    if (_pushBtnArray == nil) {
        
        _pushBtnArray = [NSArray arrayWithObjects:@"1", @"2", @"3",nil];
    }
    return _pushBtnArray;
}

- (NSInteger)baseTag {
    
    if (_baseTag == 0) {
        
        _baseTag = 100;
    }
    return _baseTag;
}

@end
