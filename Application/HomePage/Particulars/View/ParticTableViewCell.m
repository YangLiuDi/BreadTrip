//
//  ParticTableViewCell.m
//  Bear--LX
//
//  Created by 千锋 on 16/8/8.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ParticTableViewCell.h"
#import <UIKit+AFNetworking.h>
@implementation ParticTableViewCell




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDayModel:(TripDaysModel *)dayModel
{
    _dayLabel.text = [NSString stringWithFormat:@"第%ld天",(long)dayModel.day];
    _timelabel.text = dayModel.date;

}



-(void)setWayModel:(TripDaySWaypointsModel *)wayModel
{
    _localtionLabel.text = wayModel.local_time;
    _titlelabel.text = wayModel.text;
    [_titlelabel sizeToFit];
    [_bgImage setImageWithURL:[NSURL URLWithString:wayModel.photo_webtrip] placeholderImage:[UIImage imageNamed:@"poibgplaceholder"]];
    [_likeButton setTitle:[NSString stringWithFormat:@"%ld",(long)wayModel.recommendations] forState:UIControlStateNormal];
//    [_likeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_commentButton setTitle:[NSString stringWithFormat:@"%ld",(long)wayModel.comments] forState:UIControlStateNormal];
//    [_commentButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _localtionLabel.text = wayModel.local_time;
    [_localtionLabel sizeToFit];
}

-(void)setPoModel:(tripDayPoiModel *)poModel
{
    [_locaiButton setTitle:poModel.name forState:UIControlStateNormal];
}

#pragma mark - button点击事件
-(void)buttonClick:(TripDaySWaypointsModel *)model
{
    _likeButton.selected = !_likeButton.selected;
    if (_likeButton.selected == YES)
    {
        [_likeButton setTitle:[NSString stringWithFormat:@"%d",model.recommendations+1] forState:UIControlStateSelected];
        [_likeButton setBackgroundImage:[UIImage imageNamed:@"floatlikehighlight"] forState:UIControlStateSelected];
    }
    else if (_likeButton.selected == NO)
    {
        [_likeButton setTitle:[NSString stringWithFormat:@"%ld",(long)model.recommendations] forState:UIControlStateNormal];
        [_likeButton setBackgroundImage:[UIImage imageNamed:@"floatlikes~"] forState:UIControlStateNormal];
    }
    //评论跳转页面
}



+(CGFloat)caculateHeightWithModel:( TripDaySWaypointsModel *)model And:(TripDayPhoto_InfoMidel *)ImageModel And:(TripDaysModel *)dayModel
{
    ParticTableViewCell * cell = [[ParticTableViewCell alloc]init];
    
    if (model.photo.length > 0 )
    {
        cell.bgImage.frame = CGRectMake(13, cell.startImage.frame.size.height, ScreenWidth - 26 , ImageModel.h / ImageModel.w * (ScreenWidth - 26));
        
        if (model.text.length > 0)
        {
            CGFloat height = 63 + ImageModel.h / ImageModel.w * (ScreenWidth - 26) + 5 + 12 + 38 + 10 + 38;
            CGFloat height2 = 5 + 12 + 38 + 10;
            //titleImage的高度
            height2 += [model.text boundingRectWithSize:CGSizeMake(ScreenWidth - 36, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
            cell.titleImage.frame = CGRectMake(ScreenWidth - 13, ImageModel.h / ImageModel.w * (ScreenWidth - 26), ScreenWidth - 26, height2);
            
            //总高度
            height += [model.text boundingRectWithSize:CGSizeMake(ScreenWidth - 36, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
            return height;
        }
        else if ([model.text isEqualToString:@""])
        {
            CGFloat height = 63 + ImageModel.h / ImageModel.w * (ScreenWidth - 26) + 5 + 38 + 10 + 38;
            CGFloat height2 = 5 + 38 + 10;
            
            cell.titleImage.frame = CGRectMake(ScreenWidth - 13, ImageModel.h / ImageModel.w * (ScreenWidth - 26), ScreenWidth - 26, height2);
            return height;
        }
    }
    else if ([model.photo isEqualToString:@""])
    {
        cell.bgImage.frame = CGRectMake(0, 0, 0, 0);
        if (model.text.length > 0)
        {
            CGFloat height = 63 + 5 + 12 + 38 + 10 + 38;
            CGFloat height2 = 5 + 12 + 38 + 10;
            height2 += [model.text boundingRectWithSize:CGSizeMake(ScreenWidth - 36, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
            cell.titleImage.frame = CGRectMake(ScreenWidth - 13, cell.startImage.frame.size.height, ScreenWidth - 26, height2);
            height += [model.text boundingRectWithSize:CGSizeMake(ScreenWidth - 36, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.height;
            return height;
        }
    }
    

    
    
    
    return 0;
}


@end
