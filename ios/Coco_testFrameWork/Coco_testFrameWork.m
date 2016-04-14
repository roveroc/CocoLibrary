//
//  Coco_testFrameWork.m
//  Coco_testFrameWork
//
//  Created by rover on 16/4/14.
//  Copyright © 2016年 rover. All rights reserved.
//

#import "Coco_testFrameWork.h"

#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"


@implementation Coco_testFrameWork


-(void)obtainData
{
    // 启动系统风火轮
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    //前面写服务器给的域名,后面拼接上需要提交的参数，假如参数是key＝1
    NSString *domainStr = @"www.baidu.com";
    
    NSURL *baseURL = [NSURL URLWithString:domainStr];
    NSDictionary *parameters = @{@"format":@"json"};
    
    AFHTTPSessionManager *manager =[[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:@"weather.php"
      parameters:parameters
         success:^(NSURLSessionDataTask *task, id responseObject) {
             
             NSLog(@"OK OK success");
             
         }
         failure:^(NSURLSessionDataTask *task, NSError*error) {
             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                 message:[error localizedDescription]
                                                                delegate:nil
                                                       cancelButtonTitle:@"Ok"
                                                       otherButtonTitles:nil];
             [alertView show];
         }];
    
}


@end
