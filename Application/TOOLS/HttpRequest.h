//
//  HttpRequest.h
//  Bear--LX
//
//  Created by 千锋 on 16/8/2.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>


@interface HttpRequest : NSObject
+(void)GET:(NSString *)url parameter:(NSDictionary *)parameter returnBlock:(void(^)(NSData * data,NSError * error))resule;




@end
