//
//  DailystoryModel.h
//  Bear--LX
//
//  Created by 千锋 on 16/8/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol StoryDataModel <NSObject>

@end

@class StoryDataModel,StpryUsermodel,storyRegionModel,storyPoiMode,StoryLocation,StoryCenter_PointModel;

@interface DailystoryModel : JSONModel

@property (nonatomic, copy) NSString <Optional>*desc;

@property (nonatomic, strong) NSArray<StoryDataModel > *data;

@property (nonatomic, assign) NSInteger type;

@end
@interface StoryDataModel : JSONModel

@property (nonatomic, copy) NSString *cover_image_1600;

@property (nonatomic, assign) NSInteger recommendations_count;

@property (nonatomic, copy) NSString *cover_image_s;

@property (nonatomic, copy) NSString *date_tour;

@property (nonatomic, copy) NSString <Optional>*location_alias;

@property (nonatomic, assign) NSInteger cover_image_height;

@property (nonatomic, copy) NSString <Optional>*index_title;

@property (nonatomic, assign) BOOL is_hiding_location;

@property (nonatomic, assign) NSInteger comments_count;

@property (nonatomic, strong) storyRegionModel *region;

@property (nonatomic, assign) BOOL is_liked;

@property (nonatomic, strong) storyPoiMode *poi;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, strong) StoryCenter_PointModel *center_point;

@property (nonatomic, strong) StpryUsermodel *user;

@property (nonatomic, assign) int spot_id;

@property (nonatomic, assign) NSInteger cover_image_width;

@property (nonatomic, assign) BOOL is_author;

@property (nonatomic, copy) NSString *timezone;

@property (nonatomic, assign) int trip_id;

@property (nonatomic, copy) NSString *cover_image_w640;

@property (nonatomic, copy) NSString *index_cover;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, assign) NSInteger view_count;

@property (nonatomic, copy) NSString *cover_image;

@end

@interface StpryUsermodel : JSONModel

@property (nonatomic, assign) int id;

@property (nonatomic, copy) NSString *avatar_l;

@property (nonatomic, assign) BOOL is_hunter;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *user_desc;

@property (nonatomic, copy) NSString *avatar_m;

@property (nonatomic, copy) NSString *avatar_s;

@property (nonatomic, copy) NSString <Optional>*location_name;

@property (nonatomic, copy) NSString <Optional>*mobile;

@property (nonatomic, copy) NSString *country_num;

@property (nonatomic, assign) NSInteger resident_city_id;

@property (nonatomic, assign) BOOL email_verified;

@property (nonatomic, copy) NSString <Optional>*birthday;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString <Optional>*custom_url;

@property (nonatomic, copy) NSString *country_code;

@property (nonatomic, copy) NSString <Optional>*email;

@property (nonatomic, assign) NSInteger gender;

@end

@interface storyRegionModel : JSONModel

@property (nonatomic, copy) NSString <Optional>*primary;

@property (nonatomic, copy) NSString <Optional>*secondary;

@end

@interface storyPoiMode : JSONModel
//description
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, strong) StoryLocation *location;

@property (nonatomic, assign) BOOL is_nearby;

@property (nonatomic, copy) NSString *name_en;

@property (nonatomic, copy) NSString *arrival_type;

@property (nonatomic, copy) NSString <Optional>*extra1;

@property (nonatomic, assign) BOOL recommended;

@property (nonatomic, copy) NSString *tel;

@property (nonatomic, copy) NSString *time_consuming;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *currency;

@property (nonatomic, assign) NSInteger category;

@property (nonatomic, copy) NSString <Optional>*name;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) BOOL verified;

@property (nonatomic, assign) NSInteger time_consuming_min;

@property (nonatomic, assign) int id;

@property (nonatomic, copy) NSString *recommended_reason;

@property (nonatomic, copy) NSString <Optional>*website;

@property (nonatomic, assign) NSInteger time_consuming_max;

@property (nonatomic, copy) NSString *timezone;

@property (nonatomic, assign) NSInteger popularity;

@property (nonatomic, copy) NSString *fee;

@property (nonatomic, copy) NSString *opening_time;

@property (nonatomic, copy) NSString *spot_region;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *date_added;

@end

@interface StoryLocation : JSONModel

@property (nonatomic, assign) float lat;

@property (nonatomic, assign) float lng;

@end

@interface StoryCenter_PointModel : JSONModel

@property (nonatomic, assign) NSInteger lat;

@property (nonatomic, assign) NSInteger lng;

@end

