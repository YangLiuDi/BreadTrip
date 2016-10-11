//
//  ListViewController.m
//  Bear--LX
//
//  Created by 千锋 on 16/7/29.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ListViewController.h"
#import "travelNotsTableViewCell.h"
#import "ParticViewController.h"
#import "HttpRequest.h"
#import "ADModel.h"
#import "HotModel.h"
#import "DailystoryModel.h"
#import <UIKit+AFNetworking.h>

@interface ListViewController () <UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate>


@property(strong,nonatomic)UIView * hotview;

@property(strong,nonatomic)UITextField * tf;

@property(strong,nonatomic)UIView * bgview;

@property(strong,nonatomic)UIButton * btn;

@property(strong,nonatomic)NSMutableArray * ADArry;

@property(strong,nonatomic)NSMutableArray * hotArray;

@property(strong,nonatomic)NSMutableArray * YCuserArry;

@property(strong,nonatomic)NSMutableArray *storyArry;

@property(strong,nonatomic)UIScrollView * scrollview;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createItems];
    [self createBtn];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"travelNotsTableViewCell" bundle:nil] forCellReuseIdentifier:@"travelNotsTableViewCell"];
    
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);

    self.tableView.backgroundColor = [UIColor whiteColor];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 200;
    
    [self requestData];
    
}

#pragma mark - 表头的创建
-(void)createTableHeader
{
    _scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 220)];
    _scrollview.contentSize = CGSizeMake(ScreenWidth+1, 0);
    _scrollview.pagingEnabled = NO;
    _scrollview.bounces = YES;
    _scrollview.showsHorizontalScrollIndicator = NO;
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, ScreenWidth - 20, 190)];
    ADModel * model = [[ADModel alloc]init];
    model = _ADArry[0];
    [imageView setImageWithURL:[NSURL URLWithString:model.image_url]];
    [_scrollview addSubview:imageView];
    self.tableView.tableHeaderView = _scrollview;
}


#pragma mark - 数组的初始化
-(void)initArray
{
    _ADArry = [[NSMutableArray alloc]init];
    _hotArray = [[NSMutableArray alloc]init];
    _YCuserArry = [[NSMutableArray alloc]init];
}


#pragma mark - CreateNav
-(void)createItems
{
    _hotview = [[UIView alloc]initWithFrame:CGRectMake(0, 0 - ScreenHeight, ScreenWidth, ScreenHeight)];
    [self.view addSubview:_hotview];
    _hotview.backgroundColor = [UIColor cyanColor];

    self.navigationController.navigationBar.translucent = NO;
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    UIImage * leftItemImage = [UIImage imageNamed:@"featurediphone@2x"];
    leftItemImage = [leftItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:leftItemImage style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIImage * rightImage = [UIImage imageNamed:@"featured@2x"];
    rightImage = [rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:rightImage style:UIBarButtonItemStylePlain target:nil action:nil];
    
    
    _tf = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    
    self.navigationItem.titleView = _tf;
    
    _tf.tintColor = [UIColor whiteColor];
    _tf.placeholder = @"搜索内容、地点、用户";
    
    [_tf setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_tf setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    
    UIImage * titleImage = [UIImage imageNamed:@"btcityhunterotcity"];
    titleImage = [titleImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _tf.background = titleImage;
    _tf.delegate = self;
    UIImageView * leftimageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    leftimageView.image = [UIImage imageNamed:@""];
    _tf.leftView = leftimageView;
    _tf.leftViewMode = UITextFieldViewModeAlways;
}


#pragma mark - createBtn
-(void)createBtn
{
    _bgview = [[UIView alloc]initWithFrame:ScreenSize];
    //    _bgview.backgroundColor = [UIColor colorWithRed:178/255.0 green:178/255.0 blue:178/255.0 alpha:0.5];
    _bgview.backgroundColor = [UIColor blackColor];
    _bgview.alpha = 0.3;
    _bgview.hidden = YES;
    [self.navigationController.view addSubview:_bgview];
    UITapGestureRecognizer * tapGestue = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(BGpressDianJi:)];
    [_bgview addGestureRecognizer:tapGestue];
    
    
    _btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    _btn.center = CGPointMake(ScreenWidth / 2, ScreenHeight - 100);
    UIImage * image = [UIImage imageNamed:@"tripdisplayaddspotbtniphon"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_btn setBackgroundImage:image forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
}


#pragma mark - bgButton点击事件
-(void)btnClick
{
    _btn.selected = !_btn.selected;
    if (_btn.selected == NO)
    {
        _bgview.hidden = YES;
    }
    else if (_btn.selected == YES)
    {
        _bgview.hidden = NO;
    }
}

#pragma mark - bgView的点击手势
-(void)BGpressDianJi:(UITapGestureRecognizer *)tap
{
    _bgview.hidden = YES;
    _btn.selected = NO;
}


#pragma mark - TextField点击事件手势

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    [UIView animateWithDuration:0.3 animations:^{
        [_hotview bringSubviewToFront:self.view];
        _hotview.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        
    }];
    
    UIButton * rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 50)];
    UIImage * canlueitemimage = [UIImage imageNamed:@"destsearchbarbtncancel"];
    canlueitemimage = [canlueitemimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [rightBtn setImage:[UIImage imageNamed:@"destsearchbarbtncancel"] forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(pressFanHui) forControlEvents:UIControlEventTouchUpInside];
    
    
    _btn.hidden = YES;
    
    return YES;
}

#pragma mark - 取消返回按钮的点击事件
-(void)pressFanHui
{

    [UIView animateWithDuration:0.3 animations:^{
        _hotview.frame = CGRectMake(0, 0 -ScreenHeight, ScreenWidth, ScreenHeight);
    }];
    
    UIImage * image = [UIImage imageNamed:@"featured@2x"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:nil action:nil];
    [_tf resignFirstResponder];
    
    _btn.hidden = NO;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_tf resignFirstResponder];
}


#pragma mark - 请求数据
-(void)requestData
{
    [self initArray];
    [HttpRequest GET:DesktopURL parameter:nil returnBlock:^(NSData *data, NSError *error) {
        
        if (!error)
        {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary * dataDict = dict[@"data"];
            NSArray * elementsArry = dataDict[@"elements"];
            for (NSDictionary * dic1 in elementsArry)
            {
                if ([dic1[@"type"] intValue] == 1)
                {
                    NSArray * dataArr = dic1[@"data"];
                    for (NSArray *arr1 in dataArr)
                    {
                        for (NSDictionary * dic2 in arr1)
                        {
                            ADModel * model = [[ADModel alloc]initWithDictionary:dic2 error:nil];
                            [_ADArry addObject:model];
                        }
                    }
                    [self createTableHeader];
                    [self.tableView reloadData];
                    
                }
                
                else if ([dic1[@"type"] intValue] == 4)
                {
                    NSArray * dataArry = dic1[@"data"];
                    for (NSDictionary * dict3 in dataArry)
                    {
                        NSError *error = nil;
                        
                        HotModel * model1 = [[HotModel alloc]initWithDictionary:dict3 error:&error] ;
                        
                        [_hotArray addObject:model1];
                     
                        NSDictionary * dict4 = dict3[@"user"];
                        YCUserModel * model2 = [[YCUserModel alloc]initWithDictionary:dict4 error:&error];
                        [_YCuserArry addObject:model2];
                    }
                    [self.tableView reloadData];
                }
//                else if ([dic1[@"type"] intValue] == 10)
//                {
//                    NSArray * dataArry = dic1[@"data"];
//                    for (NSDictionary * dict4 in dataArry)
//                    {
//                        StoryDataModel * model4 = [[StoryDataModel alloc]initWithDictionary:dict4 error:nil];
//                        [_storyArry addObject:model4];
//                        
//                    }
//                }
            }
        }
    }];
}



#pragma mark - TableView的代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _hotArray.count ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    travelNotsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"travelNotsTableViewCell" forIndexPath:indexPath];

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    [cell.textLabel setHighlighted:NO];
    [cell setHotModel:_hotArray[indexPath.row]];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    travelNotsTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    ParticViewController * partVC = [[ParticViewController alloc]init];
    partVC.model = _hotArray[indexPath.row];
//    partVC.userModel = _YCuserArry[indexPath.row];
    [self.navigationController pushViewController:partVC animated:YES];
    
}



#pragma mark - ViewWillApper
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@""]];
}

@end
