//
//  ParticViewController.m
//  Bear--LX
//
//  Created by 千锋 on 16/8/3.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ParticViewController.h"
#import "ParticTableViewCell.h"
#import "TextTableViewCell.h"
#import "HttpRequest.h"
#import "Tripsmodel.h"
#import <AFNetworking.h>
#import <UIKit+AFNetworking.h>
@interface ParticViewController ()

@property(strong,nonatomic)TRipTopPoi_Infos_CountModel * poModel;

@property(strong,nonatomic)TripUserModel * userModel;

@property(strong,nonatomic)Tripsmodel * tripsmodel;

@property(strong,nonatomic)TripDaySWaypointsModel * watModel;

@property(strong,nonatomic)NSMutableArray * daysArr;

@property(strong,nonatomic)NSMutableArray * waypointsArr;

@property(strong,nonatomic)NSMutableArray * tripArr;

@property(strong,nonatomic)NSMutableArray * day;

@property(strong,nonatomic)NSMutableArray * photoArr;

@property(strong,nonatomic)UIView * HeaderView;

@property(strong,nonatomic)NSMutableArray * tripsModelArr;

@property(strong,nonatomic)NSMutableArray * userModelArr;

@property(strong,nonatomic)NSMutableArray * poiInfoArr;

@end

@implementation ParticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIImage * image = [UIImage imageNamed:@"tripnewbtnback"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,15, 15)];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressBlack:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    UIBarButtonItem * shareitem = [[UIBarButtonItem alloc]initWithCustomView:[self createButtonNomlImage:@"tripnewsharehl"selectionImage:@"" setTitle:@""]];
    
    UIBarButtonItem * commentItem = [[UIBarButtonItem alloc]initWithCustomView:[self createButtonNomlImage:@"tripnewcomment" selectionImage:@"" setTitle:@""]];
    UIBarButtonItem * collectItem = [[UIBarButtonItem alloc]initWithCustomView:[self createButtonNomlImage:@"triplikenormal" selectionImage:@"triplikednormal" setTitle:@""]];
    
    UIBarButtonItem * downItem = [[UIBarButtonItem alloc]initWithCustomView:[self createButtonNomlImage:@"tripnewdownload" selectionImage:@"" setTitle:@""]];
    UIBarButtonItem * fixedItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = 30;
    
    self.navigationItem.rightBarButtonItems = @[shareitem,fixedItem,commentItem,fixedItem,collectItem,fixedItem,downItem];
    
    
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 44.0;
   
    [self.tableView registerNib:[UINib nibWithNibName:@"ParticTableViewCell" bundle:nil] forCellReuseIdentifier:@"ParticTableViewCell"];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"TextTableViewCell" bundle:nil] forCellReuseIdentifier:@"TextTableViewCell"];
    
    self.tableView.rowHeight = 700;
    self.tableView.backgroundColor = [UIColor colorWithRed:251/255.0 green:247/255.0 blue:237/255.0 alpha:1];
    [self createLoadData];
}


#pragma mark - 创建表头
-(void)createHeaderView
{
    _HeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth,500)];
//    _HeaderView.backgroundColor = [UIColor redColor];
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 166)];
    _imageView.backgroundColor = [UIColor grayColor];
    UITapGestureRecognizer * tapgest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestPress)];
    [_imageView addGestureRecognizer:tapgest];
    
    
    [_imageView setImageWithURL:[NSURL URLWithString:_tripsmodel.trackpoints_thumbnail_image]];
//    _imageView.backgroundColor = [UIColor greenColor];
    [_HeaderView addSubview:_imageView];
    _playImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    _playImageView.center = _imageView.center;
    _playImageView.image = [UIImage imageNamed:@"playbutton"];
    _playImageView.layer.cornerRadius = 15;
    _playImageView.clipsToBounds = YES;
    [_imageView addSubview:_playImageView];
    _btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
//    _btn.backgroundColor = [UIColor yellowColor];
    _btn.center = CGPointMake(_imageView.center.x, _imageView.frame.size.height);
    _btn.layer.cornerRadius = 25;
    _btn.clipsToBounds = YES;
    [_btn setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:_userModel.avatar_l] placeholderImage:[UIImage imageNamed:@"avatarplaceholder"]];
    _btn.layer.borderWidth = 2.5;
    _btn.layer.borderColor = [UIColor whiteColor].CGColor;
    [_HeaderView addSubview:_btn];
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 15)];
//    _label.backgroundColor = [UIColor redColor];
    
    if (_userModel.name == NULL)
    {
//        _label.text = @""
    }
    _label.text = [NSString stringWithFormat:@"by %@",_userModel.name];
//    [_label sizeToFit];
    _label.font = [UIFont systemFontOfSize:10];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.center = CGPointMake(_imageView.center.x, _imageView.frame.size.height+7 + 5 + 24);
    [_HeaderView addSubview:_label];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
    _titleLabel.text = _tripsmodel.name;
//    _titleLabel.backgroundColor = [UIColor cyanColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.numberOfLines = 2;
    [_titleLabel sizeToFit];
    _titleLabel.center = CGPointMake(_imageView.center.x, _label.frame.origin.y + 20+ 15+5 );
    [_HeaderView addSubview:_titleLabel];

    _imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth - 300) / 2, _titleLabel.frame.origin.y + 40 + 10 , 300, 1)];
//    _imageView2.backgroundColor = [UIColor blackColor];
    _imageView2.image = [UIImage imageNamed:@"poiseperatorline"];
    [_HeaderView addSubview:_imageView2];
    
    _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake((ScreenWidth - 300) / 2, _imageView2.frame.origin.y + 10, 100, 20)];

//    _timeLabel.backgroundColor = [UIColor blueColor];
    _timeLabel.text = _tripsmodel.first_day;
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    [_HeaderView addSubview:_timeLabel];
    _dayLabel = [[UILabel alloc]initWithFrame:CGRectMake((ScreenWidth - 300) / 2, _timeLabel.frame.origin.y + 25, 100 , 20)];
    _dayLabel.textAlignment = NSTextAlignmentCenter;
//    _dayLabel.backgroundColor = [UIColor whiteColor];
    _dayLabel.text = [NSString stringWithFormat:@"%ld天",(long)_tripsmodel.day_count];
    [_HeaderView addSubview:_dayLabel];
    _miLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth / 2 -50, _imageView2.frame.origin.y + 10, 100, 20)];
    _miLabel.textAlignment = NSTextAlignmentCenter;
    _miLabel.text = @"里程";
    [_HeaderView addSubview:_miLabel];
    
    _lcLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth / 2 -50, _timeLabel.frame.origin.y + 25, 100, 20)];
//    _lcLabel.backgroundColor = [UIColor redColor];
    _lcLabel.textAlignment = NSTextAlignmentCenter;
    _lcLabel.text = [NSString stringWithFormat:@"%.0fkm",_tripsmodel.mileage];
    [_HeaderView addSubview:_lcLabel];
    
    _likeLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth / 2 + 50, _imageView2.frame.origin.y + 10, 100, 20)];
//    _likeLabel.backgroundColor = [UIColor greenColor];
    _likeLabel.text = @"喜欢";
    _likeLabel.textAlignment = NSTextAlignmentCenter;
    [_HeaderView addSubview:_likeLabel];
    _countLabel = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth / 2 + 50, _timeLabel.frame.origin.y + 25, 100, 20)];
    _countLabel.textAlignment = NSTextAlignmentCenter;
    _countLabel.text = [NSString stringWithFormat:@"%ld",(long)_tripsmodel.recommendations];
    [_HeaderView addSubview:_countLabel];
    
    _imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth / 3 + 19, _imageView2.frame.origin.y + 10,1, 40)];
    _imageView3.image = [UIImage imageNamed:@"destvirturalline"];
    [_HeaderView addSubview:_imageView3];
    
    _imageView4 = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth / 3 + 119, _imageView2.frame.origin.y + 10, 1, 40)];
    _imageView4.image = [UIImage imageNamed:@"destvirturalline"];
    [_HeaderView addSubview:_imageView4];
    
    _imageView5 = [[UIImageView alloc]initWithFrame:CGRectMake(13, _dayLabel.frame.origin.y +30, ScreenWidth - 26, 5)];
    _imageView5.image = [UIImage imageNamed:@"feednavbottombar"];
    [_HeaderView addSubview:_imageView5];
    _imageView6 = [[UIImageView alloc]initWithFrame:CGRectMake(13, _imageView5.frame.origin.y + 3, ScreenWidth - 26, 166)];
//    _imageView6.backgroundColor = [UIColor blackColor];
    _imageView6.image = [UIImage imageNamed:@"userinfoaddfriendweibobuttonbg"];
    [_HeaderView addSubview:_imageView6];


    
    
    _imageView7 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 40, 40)];
//    _imageView7.backgroundColor = [UIColor greenColor];
    _imageView7.image = [UIImage imageNamed:@"attractioncounticon"];
    [_imageView6 addSubview:_imageView7];
    
    _jingdianLabel = [[UILabel alloc]initWithFrame:CGRectMake(55, 15, 100, 40)];
//    _jingdianLabel.backgroundColor = [UIColor orangeColor];
    _jingdianLabel.text = [NSString stringWithFormat:@"%ld 景点",(long)_poModel.sights];
    [_imageView6 addSubview:_jingdianLabel];
    
    
    
    _imageView8 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 65, 40, 40)];
//    _imageView8.backgroundColor = [UIColor whiteColor];
    _imageView8.image = [UIImage imageNamed:@"hotelcounticon"];
    [_imageView6 addSubview:_imageView8];
    
    _zhusuLabel = [[UILabel alloc]initWithFrame:CGRectMake(55, 65, 100, 40)];
//    _zhusuLabel.backgroundColor = [UIColor blueColor];
    
//    if (_poModel.hotel == NULL)
//    {
//        _zhusuLabel.text = @"0 住宿";
//    }
//    else
//    {
       _zhusuLabel.text = [NSString stringWithFormat:@"%ld 住宿",(long)_poModel.hotel];
//    }
    
    [_imageView6 addSubview:_zhusuLabel];
    
    _imageView9 = [[UIImageView alloc]initWithFrame:CGRectMake(_imageView6.frame.size.width / 2, 15, 40, 40)];
    _imageView9.image = [UIImage imageNamed:@"foodcounticon"];
//    _imageView9.backgroundColor = [UIColor redColor];
    [_imageView6 addSubview:_imageView9];
    _canyinLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imageView6.frame.size.width / 2 + 50, 15, 100, 40)];
//    _canyinLabel.backgroundColor = [UIColor greenColor];
    _canyinLabel.text = [NSString stringWithFormat:@"%ld 餐饮",(long)_poModel.restaurant];
    [_imageView6 addSubview:_canyinLabel];
    _imageView10 = [[UIImageView alloc]initWithFrame:CGRectMake(_imageView6.frame.size.width / 2 , 65, 40, 40)];
//    _imageView10.backgroundColor = [UIColor yellowColor];
    _imageView10.image = [UIImage imageNamed:@"shopcounticon"];
    [_imageView6 addSubview:_imageView10];
    _gouwuLabel = [[UILabel alloc]initWithFrame:CGRectMake(_imageView6.frame.size.width / 2 + 50, 65, 100, 40)];
//    _gouwuLabel.backgroundColor = [UIColor whiteColor];
    _gouwuLabel.text = [NSString stringWithFormat:@"%ld 购物",(long)_poModel.mall];
    [_imageView6 addSubview:_gouwuLabel];

    
    
    
    
    
    _iv1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 115, 20, 20)];
    [_iv1 setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    [_imageView6 addSubview:_iv1];
    UIImageView * iv2 = [[UIImageView alloc]initWithFrame:CGRectMake(40, 115, 20, 20)];
    [iv2 setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    [_imageView6 addSubview:iv2];
    UILabel * guojiaLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 115, 160, 20)];
    guojiaLabel.text = @"";
    [_imageView6 addSubview:guojiaLabel];

    self.tableView.tableHeaderView = _HeaderView;
}


#pragma mark - 地图单击手势
-(void)tapGestPress
{
    
}



#pragma mark - 返回上一个页面
-(void)pressBlack:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - ViewWillApper
//即将进入该界面的时候
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"journeytimeline"]];
    
}


#pragma mark - CreateButton
-(UIButton *)createButtonNomlImage:(NSString *)nomlImage selectionImage:(NSString *)selectionImage setTitle:(NSString *)title
{
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 17)];
    [button setImage:[UIImage imageNamed:nomlImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectionImage] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    
    return button;
}

#pragma mark - init
-(void)initMutArr
{
    _photoArr = [[NSMutableArray alloc]initWithCapacity:0];
    _day = [[NSMutableArray alloc]initWithCapacity:0];
    _daysArr = [[NSMutableArray alloc]initWithCapacity:0];
    _waypointsArr = [[NSMutableArray alloc]initWithCapacity:0];
    _tripArr = [[NSMutableArray alloc]initWithCapacity:0];
    _userModelArr = [[NSMutableArray alloc]init];
    _poiInfoArr = [[NSMutableArray alloc]init];
    _tripsModelArr = [[NSMutableArray alloc]init];
}




#pragma mark - 请求数据
-(void)createLoadData
{
    [self initMutArr];
    NSString * requestURL = [NSString stringWithFormat:@"http://api.breadtrip.com/%@waypoints/?gallery_mode=1&sign=51ef9d24df1f15f2a5d01393175610da",self.model.share_url];

    [HttpRequest GET:requestURL parameter:nil returnBlock:^(NSData *data, NSError *error) {
        if (!error)
        {
     
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

//            NSLog(@"%@",dict);
            _tripsmodel = [[Tripsmodel alloc]initWithDictionary:dict error:nil];
 
//            [_tripsModelArr addObject:_tripsmodel];
//            NSLog(@"%@",_tripsmodel);
            NSDictionary * dict3 = dict[@"poi_infos_count"];
            _poModel = [[TRipTopPoi_Infos_CountModel alloc]initWithDictionary:dict3 error:nil];
            
//            [self createPoLabel];
            
            NSDictionary * dict4 = dict[@"user"];
            _userModel = [[TripUserModel alloc]initWithDictionary:dict4 error:nil];
            
//            NSLog(@"%@",_tripsmodel);
            [self createHeaderView];
        NSArray * DaysArry = dict[@"days"];
        for (NSDictionary * dict1 in DaysArry) {
//            NSError * error = nil;
            TripDaysModel * model1 = [[TripDaysModel alloc]initWithDictionary:dict1 error:&error];
//            NSLog(@"%@",error);
            [_day addObject:[NSString stringWithFormat:@"%ld",(long)model1.day]];
            [_daysArr addObject:model1];
            
            NSArray * waypoints = dict1[@"waypoints"];
            for (NSDictionary * dict2 in waypoints)
            {

                TripDaySWaypointsModel * model2 = [[TripDaySWaypointsModel alloc]initWithDictionary:dict2 error:nil];
                

                    [_waypointsArr addObject:model2];

            }
        }

        [self.tableView reloadData];
 
        }

    }];

}

#pragma mark - TableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _waypointsArr.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ParticTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ParticTableViewCell" forIndexPath:indexPath];

//    TextTableViewCell * textcell = [tableView dequeueReusableCellWithIdentifier:@"TextTableViewCell" forIndexPath:indexPath];
    

//        [cell setDayModel:_daysArr[0]];
 
    [cell setWayModel:_waypointsArr[indexPath.row]];

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}








-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return [ParticTableViewCell caculateHeightWithModel:_waypointsArr[indexPath.row] And:_photoArr[indexPath.row] And:_daysArr[indexPath.row]];
    return 800;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
