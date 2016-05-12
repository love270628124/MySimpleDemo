//
//  BaseValues.h
//  MySimpleProject
//
//  Created by Raija on 16/5/11.
//  Copyright © 2016年 Raija. All rights reserved.
//

#ifndef BaseValues_h
#define BaseValues_h

/*自定义一些全局通用的值，省去使用PCH文件，影响编译速度*/

//屏幕尺寸
#define Width_Screen    ([UIScreen mainScreen].bounds.size.width)
#define Height_Screen   ([UIScreen mainScreen].bounds.size.height)
//屏幕缩放比例
#define Zoom_Width      (float)Width_Screen / 320.f
#define Zoom_Height     (float)Height_Screen / 480.f

//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//真机的情况
#endif

#if TARGET_IPHONE_SIMULATOR
//模拟器的情况
#endif

//定义导航栏的高度
#define Height_Nav  64

//随机取值（0.0 - 1.0）
#define Random_Color    (arc4random() % 256 / 256.0)
//颜色基值
#define Color_BaseValue 255.0f
//随机颜色
#define Color_Random    ([UIColor colorWithRed:Random_Color green:Random_Color blue:Random_Color alpha:1.0])
//RGB颜色
#define Color_RGB(R, G, B, A)   ([UIColor colorWithRed:R / Color_BaseValue green:G / Color_BaseValue blue:B / Color_BaseValue alpha:A])
//16进制颜色
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define COLOR_BLUE             UIColorFromRGB(0x41CEF2)
#define COLOR_GRAY             UIColorFromRGB(0xababab) //171
#define COLOR_333              UIColorFromRGB(0x333333) //51
#define COLOR_666              UIColorFromRGB(0x666666) //102
#define COLOR_888              UIColorFromRGB(0x888888) //136
#define COLOR_999              UIColorFromRGB(0x999999) //153
#define COLOR_PLACEHOLD        UIColorFromRGB(0xc5c5c5) //197
#define COLOR_RED              UIColorFromRGB(0xff5400) //红色
#define COLOR_GREEN            UIColorFromRGB(0x31d8ab)//绿色
#define COLOR_YELLOW           UIColorFromRGB(0xffa200)//黄色
#define COLOR_SEPARATE_LINE    UIColorFromRGB(0xC8C8C8)//200
#define COLOR_LIGHTGRAY        Color_RGB(200, 200, 200, 0.4)//淡灰色

//图片
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]

#endif /* BaseValues_h */
