//
//  TextTableViewCell.h
//  Bear--LX
//
//  Created by 千锋 on 16/8/9.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *local_TimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *localtionButton;

@end
