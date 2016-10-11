//
//  travelNotsTableViewCell.m
//  Bear--LX
//
//  Created by 千锋 on 16/7/29.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "travelNotsTableViewCell.h"
#import <UIKit+AFNetworking.h>
@implementation travelNotsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setUserModel:(YCUserModel *)userModel
{
    [_headerImageView setImageWithURL:[NSURL URLWithString:userModel.avatar_m]placeholderImage:[UIImage imageNamed:@"avatarplaceholder"]];
    _headerImageView.layer.cornerRadius = 20.0;
    _headerImageView.layer.masksToBounds = YES;
    _nameLabel.text = [NSString stringWithFormat:@"by %@",userModel.name];
    
}

-(void)setHotModel:(HotModel *)hotModel
{
    [_picImageView setImageWithURL:[NSURL URLWithString:hotModel.cover_image]placeholderImage:[UIImage imageNamed:@"triplistcellbg"]];
    _picImageView.layer.cornerRadius = 5.0;
    _picImageView.layer.masksToBounds = YES;
    _dataLabel.text = hotModel.first_day;
    _titleLabel.text = hotModel.name;
    _cityLabel.text = hotModel.popular_place_str;
    _dayLabel.text = [NSString stringWithFormat:@"%ld 天",(long)hotModel.day_count];
    _browseLabel.text = [NSString stringWithFormat:@"%ld 浏览",(long)hotModel.view_count];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
