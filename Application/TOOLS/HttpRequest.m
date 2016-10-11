//
//  HttpRequest.m
//  Bear--LX
//
//  Created by 千锋 on 16/8/2.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

+(void)GET:(NSString *)url parameter:(NSDictionary *)parameter returnBlock:(void (^)(NSData *, NSError *))resule
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
//    AFJSONResponseSerializer * response = [AFJSONResponseSerializer serializer];
//    response.removesKeysWithNullValues = YES;
//    manager.responseSerializer = response;
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        //下载进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //调用block
        resule(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        resule(nil,error);
    }];
}



@end
