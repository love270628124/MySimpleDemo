//
//  RJImageCache.h
//  MySimpleProject
//
//  Created by Raija on 16/5/30.
//  Copyright © 2016年 Raija. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  无参数block
 **/
typedef void(^DownloaderCreateBlock)();

/**
 *  下载回调信息，下载进度block
 *
 *  @param  alreadyReceiveSize  已经接收大小
 *  @param  notReceiveSize      未接收大小
 **/
typedef void(^DownloaderProgressBlock)(NSInteger alreadyReceiveSize, NSInteger expectedContentLength);

/**
 *  下载回调信息，完成下载block
 *
 *  @param  data        data
 *  @param  image       图片
 *  @param  error       错误信息
 *  @param  finished    是否完成
 **/
typedef void(^DownloaderCompletedBlock)(NSData *data, UIImage *image, NSError *error, BOOL finished);

typedef NS_OPTIONS(NSInteger, DownloaderOptions) {
    DownloaderDefault = 1,              //默认下载操作
    DownloaderContinueInBackfround = 2  //允许后台操作
};

typedef NS_ENUM(NSInteger, DownloaderOrder) {
    DownloaderFIFO,     //默认下载顺序，先进先出
    DownloaderLIFO      //先进后出
};

@interface RJImageCache : NSObject

+ (instancetype)shareDownloader;

/**
 *  将所有的下载回调信息存储在这里，key是URL， value是多组回调信息
 **/
@property (nonatomic, strong) NSMutableDictionary *downloaderCallBack;

@end
