//
//  travelNotsTableViewCell.h
//  Bear--LX
//
//  Created by 千锋 on 16/7/29.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADModel.h"
#import "HotModel.h"
@interface travelNotsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView * picImageView;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *identificationImageView;

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *browseLabel;

@property (strong,nonatomic) HotModel * hotModel;

@property (strong,nonatomic) YCUserModel * userModel;

@end
