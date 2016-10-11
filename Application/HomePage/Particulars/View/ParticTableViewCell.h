//
//  ParticTableViewCell.h
//  Bear--LX
//
//  Created by 千锋 on 16/8/8.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tripsmodel.h"
@interface ParticTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *startImage;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *localtionLabel;
@property (weak, nonatomic) IBOutlet UIButton *locaiButton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@property(strong,nonatomic)tripDayPoiModel * poModel;

@property(strong,nonatomic)TripDaySWaypointsModel * wayModel;
@property(strong,nonatomic)TripDaysModel * dayModel;



+(CGFloat)caculateHeightWithModel:(TripDaySWaypointsModel *)model And:(TripDayPhoto_InfoMidel *)ImageModel And:(TripDaysModel *)dayModel;

@end
