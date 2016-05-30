//
//  RJImageCache.m
//  MySimpleProject
//
//  Created by Raija on 16/5/30.
//  Copyright © 2016年 Raija. All rights reserved.
//

#import "RJImageCache.h"

@interface RJImageCache ()

@property (nonatomic, strong) dispatch_queue_t concurrentQueue;

@end

@implementation RJImageCache

/*构建一个单列，数据共享*/
+ (instancetype)shareDownloader {
    
    static RJImageCache *cacheObj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        cacheObj = [[RJImageCache alloc] init];
    });
    return cacheObj;
}

/*添加回调信息*/
/**
 *  @param  progressBlock           DownloaderProgressBlock
 *  @param  completedBlock          DownloaderCompletedBlock
 *  @param  url                     URL
 *  @param  downloaderCreateBlock   DownloaderCreateBlock
 **/
- (void)addWithDownloaderProgressBlock:(DownloaderProgressBlock)progressBlock
              DownloaderCompletedBlock:(DownloaderCompletedBlock)completedBlock
                                   URL:(NSURL *)url
                 DownloaderCreateBlock:(DownloaderCreateBlock)downloaderCreateBlock {
    /*判断url是否为空*/
    if ([url isEqual:nil]) {
        
        completedBlock(nil,nil,nil,NO);
    }
    /*设置屏障，保证在同一时间，只有一个线程可以操作downloaderCallBack属性，保证在并行多个处理的时候，
     对downloaderCallBack属性的读写操作保持一致*/
    dispatch_barrier_sync(self.concurrentQueue, ^{
        //
        BOOL firstDownload = NO;
        /*添加回调信息，处理同一个url信息*/
        if ( !self.downloaderCallBack[url]) {
            //
            self.downloaderCallBack[url] = [NSMutableArray new];
            firstDownload = YES;
        }
        //
        NSMutableArray *callBacksArray = self.downloaderCallBack[url];
        NSMutableDictionary *callBacks = [[NSMutableDictionary alloc] init];
        if (progressBlock) {
            //
            callBacks[@"progress"] = [progressBlock copy];
        }
        if (completedBlock) {
            //
            callBacks[@"completed"] = [completedBlock copy];
        }
        [callBacksArray addObject:callBacks];
        self.downloaderCallBack[url] = callBacksArray;
        if (firstDownload) {
            //
            downloaderCreateBlock();
        }
        
    });
    
}

/*下载管理器对于下载请求的管理*/
/**
 *  @param  progressBlock           DownloaderProgressBlock
 *  @param  completedBlock          DownloaderCompletedBlock
 *  @param  url                     URL
**/

- (void)downloaderImageWithDownloaderWithURL:(NSURL *)url
                     DownloaderProgressBlock:(DownloaderProgressBlock)progressBlock
                    DownloaderCompletedBlock:(DownloaderCompletedBlock)completedBlock {
    //
    __weak __typeof(self)myself = self;
//    __block RJDownloaderOperation *operation;
}

@end
