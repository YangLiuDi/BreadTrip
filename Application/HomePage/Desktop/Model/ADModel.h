//
//  ADModel.h
//  Bear--LX
//
//  Created by 千锋 on 16/8/2.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ADModel : JSONModel

@property (nonatomic, copy) NSString *html_url;

@property (nonatomic, copy) NSString *platform;

@property (nonatomic, copy) NSString *image_url;

@end
