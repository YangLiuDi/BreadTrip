//
//  HotModel.h
//  Bear--LX
//
//  Created by 千锋 on 16/8/2.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@class YCUserModel,YCStart_PointModel;
@interface HotModel : JSONModel

@property (nonatomic, copy) NSString *last_day;

@property (nonatomic, assign) NSInteger device;

@property (nonatomic, copy) NSString *summary;

//@property (nonatomic, assign) long long id;
@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *cover_image;

@property (nonatomic, assign) NSInteger spot_count;

@property (nonatomic, copy) NSString *cover_image_w640;

@property (nonatomic, strong) YCStart_PointModel *start_point;

@property (nonatomic, assign) BOOL is_hot_trip;

@property (nonatomic, copy) NSString <Optional>*desc;

@property (nonatomic, copy) NSString *first_day;

@property (nonatomic, assign) NSInteger version;

@property (nonatomic, copy) NSString *cover_image_1600;

@property (nonatomic, assign) BOOL is_featured_trip;

//@property (nonatomic, assign) CGFloat mileage;
@property (nonatomic, assign) NSInteger mileage;

@property (nonatomic, assign) NSInteger privacy;

//@property (nonatomic, assign) CGFloat last_modified;
@property (nonatomic, assign) NSInteger last_modified;

@property (nonatomic, assign) BOOL recommended;

@property (nonatomic, strong) YCUserModel *user;

@property (nonatomic, assign) NSInteger recommendations;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *popular_place_str;

@property (nonatomic, assign) NSInteger waypoints;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, strong) NSNumber <Optional> *date_complete;

@property (nonatomic, assign) BOOL wifi_sync;

@property (nonatomic, assign) NSInteger date_added;

@property (nonatomic, assign) NSInteger view_count;

//default
@property (nonatomic, assign) BOOL defau;

@property (nonatomic, copy) NSString *cover_image_default;

@property (nonatomic, copy) NSString <Optional>*index_title;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, assign) NSInteger day_count;

@end
@interface YCUserModel : JSONModel

//@property (nonatomic, assign) long long id;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *avatar_l;

@property (nonatomic, assign) BOOL is_hunter;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString <Optional>*user_desc;

@property (nonatomic, copy) NSString *avatar_m;

@property (nonatomic, copy) NSString *avatar_s;

@property (nonatomic, copy) NSString <Optional>*location_name;

@property (nonatomic, copy) NSString <Optional>*mobile;

@property (nonatomic, copy) NSString <Optional>*country_num;

@property (nonatomic, strong) NSNumber <Optional>*resident_city_id;

@property (nonatomic, assign) BOOL email_verified;

@property (nonatomic, copy) NSString <Optional>*birthday;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *custom_url;

@property (nonatomic, copy) NSString <Optional>*country_code;

@property (nonatomic, copy) NSString <Optional>*email;

@property (nonatomic, assign) NSInteger gender;

@end

@interface YCStart_PointModel : JSONModel

@property (nonatomic, copy) NSString <Optional>*longitude;

@property (nonatomic, copy) NSString <Optional>*latitude;

@end

