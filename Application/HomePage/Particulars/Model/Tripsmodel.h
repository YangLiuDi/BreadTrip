//
//  Tripsmodel.h
//  Bear--LX
//
//  Created by 千锋 on 16/8/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol TripDaysModel<NSObject>
@end
@protocol TripDaySWaypointsModel <NSObject>
@end
@protocol BiaoTouCovered_CountriesModel <NSObject>
@end

@class TRipTopPoi_Infos_CountModel,TripUserModel,TripUserTitleModel,TripUserExperienceModel,TripUserEXPERLevel_InfoModel,Start_PointModel,BiaoTouCovered_CountriesModel,TripDaysModel,TripDaySWaypointsModel,TRIpPlaceModel,TripPlaceCountryModel,TripPlaceCityModel,TripPlaceProvinceModel,TripDayPhoto_InfoMidel,TRipLocationModel,tripDayPoiModel,tripDayPoiLocationModel;
@interface Tripsmodel : JSONModel

@property (nonatomic, strong) NSArray<BiaoTouCovered_CountriesModel> *covered_countries;

@property (nonatomic, assign) NSInteger device;

@property (nonatomic, strong) NSArray<NSString <Optional>*> *city_slug_urls;

@property (nonatomic, copy) NSString *last_day;

@property (nonatomic, assign) int id;

@property (nonatomic, copy) NSString *cover_image;

@property (nonatomic, copy) NSString <Optional>*country;

@property (nonatomic, strong) Start_PointModel *start_point;
//description
@property (nonatomic, copy) NSString <Optional>*desc;

@property (nonatomic, copy) NSString *first_day;

@property (nonatomic, assign) float mileage;

@property (nonatomic, assign) NSInteger privacy;

@property (nonatomic, copy) NSString *first_timezone;

@property (nonatomic, assign) BOOL recommended;

@property (nonatomic, assign) float last_modified;

@property (nonatomic, assign) NSInteger target_waypoint_id;

@property (nonatomic, strong) TripUserModel *user;

@property (nonatomic, assign) NSInteger recommendations;

@property (nonatomic, copy) NSString <Optional>*name;

@property (nonatomic, strong) TRipTopPoi_Infos_CountModel *poi_infos_count;

@property (nonatomic, assign) NSInteger waypoints;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, assign) NSInteger date_complete;

@property (nonatomic, copy) NSString <Optional>*city;

@property (nonatomic, strong) NSArray<TripDaysModel> *days;

@property (nonatomic, copy) NSString *trackpoints_thumbnail_image;

@property (nonatomic, assign) BOOL wifi_sync;

@property (nonatomic, assign) NSInteger shared;

@property (nonatomic, assign) NSInteger date_added;

@property (nonatomic, copy) NSString *province;

@property (nonatomic, assign) NSInteger view_count;

@property (nonatomic, strong) NSArray<NSString *> *cities;

@property (nonatomic, assign) NSInteger day_count;

@end
@interface TRipTopPoi_Infos_CountModel : JSONModel

@property (nonatomic, assign) NSInteger hotel;

@property (nonatomic, assign) NSInteger mall;

@property (nonatomic, assign) NSInteger restaurant;

@property (nonatomic, assign) NSInteger sights;

@property (nonatomic, assign) NSInteger flight;

@end

@interface TripUserModel : JSONModel

@property (nonatomic, copy) NSString *birthday;

@property (nonatomic, copy) NSString *location_name;

@property (nonatomic, strong) TripUserTitleModel *title;

@property (nonatomic, copy) NSString <Optional>*country_code;

@property (nonatomic, assign) BOOL is_hunter;

@property (nonatomic, copy) NSString *custom_url;

@property (nonatomic, copy) NSString *user_desc;

@property (nonatomic, copy) NSString *avatar_s;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString <Optional>*name;

@property (nonatomic, copy) NSString *country_num;

@property (nonatomic, copy) NSString *avatar_l;

@property (nonatomic, assign) BOOL email_verified;

@property (nonatomic, assign) int id;

@property (nonatomic, assign) NSInteger gender;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, copy) NSString *mobile;

@property (nonatomic, copy) NSString *avatar_m;

@property (nonatomic, copy) NSString *resident_city_id;

@property (nonatomic, strong) TripUserExperienceModel *experience;

@end

@interface TripUserTitleModel : JSONModel

@property (nonatomic, copy) NSString <Optional>*name;

@property (nonatomic, assign) BOOL verified;

@end

@interface TripUserExperienceModel : JSONModel

@property (nonatomic, strong) TripUserEXPERLevel_InfoModel *level_info;

@property (nonatomic, assign) NSInteger value;

@end

@interface TripUserEXPERLevel_InfoModel : JSONModel

@property (nonatomic, copy) NSString <Optional>*name;

@property (nonatomic, assign) NSInteger value;

@end

@interface Start_PointModel : JSONModel

@property (nonatomic, copy) NSString *longitude;

@property (nonatomic, copy) NSString *latitude;

@end

@interface BiaoTouCovered_CountriesModel : JSONModel

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString <Optional>*name;

@property (nonatomic, assign) NSInteger type;

@end

@interface TripDaysModel : JSONModel

@property (nonatomic, copy) NSString *date;

@property (nonatomic, assign) NSInteger day;

@property (nonatomic, strong) NSArray<TripDaySWaypointsModel > *waypoints;

@end

@interface TripDaySWaypointsModel : JSONModel

@property (nonatomic, strong) TRIpPlaceModel <Optional>*place;

@property (nonatomic, strong) TRipLocationModel <Optional>*location;

@property (nonatomic, copy) NSString *photo_s;

@property (nonatomic, copy) NSString *province;

@property (nonatomic, assign) BOOL recommended;

@property (nonatomic, copy) NSString *country;

@property (nonatomic, copy) NSString *photo_1600;

@property (nonatomic, strong) TripDayPhoto_InfoMidel <Optional>*photo_info;

@property (nonatomic, copy) NSString *photo_w640;

@property (nonatomic, copy) NSString *city;

@property (nonatomic, assign) BOOL cover;

@property (nonatomic, assign) NSInteger day;

@property (nonatomic, copy) NSString *local_time;

@property (nonatomic, strong) tripDayPoiModel <Optional>*poi;

@property (nonatomic, assign) NSInteger recommendations;

@property (nonatomic, assign) NSInteger shared;

@property (nonatomic, copy) NSString *photo_webtrip;

@property (nonatomic, assign) int id;

@property (nonatomic, assign) BOOL track;

@property (nonatomic, assign) int trip_id;

@property (nonatomic, copy) NSString <Optional>*timezone;

@property (nonatomic, copy) NSString <Optional>*model;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, assign) NSInteger comments;

@property (nonatomic, copy) NSString *photo;

@property (nonatomic, copy) NSString <Optional,Ignore>*hotel;
////////////////////
@property (nonatomic, copy) NSString *photo_weblive;

@property (nonatomic, assign) NSInteger privacy;

@property (nonatomic, assign) NSInteger device;

@property (nonatomic, assign) NSInteger date_added;

@end

@interface TRIpPlaceModel : JSONModel

@property (nonatomic, strong) TripPlaceCountryModel *country;

@property (nonatomic, strong) TripPlaceCityModel *city;

@property (nonatomic, strong) TripPlaceProvinceModel *province;

@end

@interface TripPlaceCountryModel : JSONModel

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger type;

@end

@interface TripPlaceCityModel : JSONModel

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger type;

@end

@interface TripPlaceProvinceModel : JSONModel

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger type;

@end

@interface TripDayPhoto_InfoMidel : JSONModel

@property (nonatomic, assign) NSInteger h;

@property (nonatomic, assign) NSInteger w;

@end

@interface TRipLocationModel : JSONModel

@property (nonatomic, assign) float lng;

@property (nonatomic, assign) float lat;

@property (nonatomic, assign) float latitude;

@property (nonatomic, assign) float longitude;

@end


@interface tripDayPoiModel : JSONModel
//description
@property (nonatomic, copy) NSString <Optional>*desc;

@property (nonatomic, strong) tripDayPoiLocationModel *location;

@property (nonatomic, assign) BOOL is_nearby;

@property (nonatomic, copy) NSString <Optional>*name_en;

@property (nonatomic, copy) NSString <Optional>*arrival_type;

@property (nonatomic, copy) NSString *extra1;

@property (nonatomic, assign) BOOL recommended;

@property (nonatomic, copy) NSString <Optional>*tel;

@property (nonatomic, copy) NSString <Optional>*time_consuming;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *currency;

@property (nonatomic, assign) NSInteger category;

@property (nonatomic, copy) NSString <Optional>*name;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) BOOL verified;

@property (nonatomic, assign) NSInteger time_consuming_min;

@property (nonatomic, assign) int id;

@property (nonatomic, copy) NSString <Optional>*recommended_reason;

@property (nonatomic, copy) NSString <Optional>*website;

@property (nonatomic, assign) NSInteger time_consuming_max;

@property (nonatomic, copy) NSString <Optional>*timezone;

@property (nonatomic, assign) NSInteger popularity;

@property (nonatomic, copy) NSString <Optional>*fee;

@property (nonatomic, copy) NSString <Optional>*opening_time;

@property (nonatomic, copy) NSString *spot_region;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *date_added;

@end

@interface tripDayPoiLocationModel : JSONModel

@property (nonatomic, assign) float lat;

@property (nonatomic, assign) float lng;

@end

