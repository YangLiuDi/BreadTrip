//
//  TravelNotesViewController.h
//  BreadTravelProject
//
//  Created by 千锋 on 16/7/28.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "BaseViewController.h"



@interface TravelNotesViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic)UITableView * tableView;

@property(strong,nonatomic)NSMutableArray * dataArray;





//刷新数据
-(void)loadData;
//加载更多
-(void)loadMoreData;



@end
