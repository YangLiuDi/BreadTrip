//
//  Tripsmodel.m
//  Bear--LX
//
//  Created by 千锋 on 16/8/5.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "Tripsmodel.h"

@implementation Tripsmodel

+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"description":@"desc"}];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}
@end
@implementation TRipTopPoi_Infos_CountModel

@end


@implementation TripUserModel

@end


@implementation TripUserTitleModel

@end


@implementation TripUserExperienceModel

@end


@implementation TripUserEXPERLevel_InfoModel

@end


@implementation Start_PointModel

@end


@implementation BiaoTouCovered_CountriesModel

@end


@implementation TripDaysModel

+ (NSDictionary *)objectClassInArray{
    return @{@"waypoints" : [TripDaySWaypointsModel class]};
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}
@end


@implementation TripDaySWaypointsModel

@end


@implementation TRIpPlaceModel

@end


@implementation TripPlaceCountryModel

@end


@implementation TripPlaceCityModel

@end


@implementation TripPlaceProvinceModel

@end


@implementation TripDayPhoto_InfoMidel

@end


@implementation TRipLocationModel

@end


@implementation tripDayPoiModel
+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"description":@"desc"}];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}
@end


@implementation tripDayPoiLocationModel

@end


