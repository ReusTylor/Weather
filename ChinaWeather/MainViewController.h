//
//  MainViewController.h
//  ChinaWeather
//
//  Created by 创新创业中心 on 16/7/24.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DealData.h"

@interface MainViewController : UIViewController
@property(nonatomic,strong) DealData *data;
@property(nonatomic,strong) UILabel *city;
@property(nonatomic,strong) UILabel *county;
@property(nonatomic,strong) UILabel *date;
@property(nonatomic,strong) UILabel *day_condition;
@property(nonatomic,strong) UILabel *day_wind;
@property(nonatomic,strong) UILabel *day_temperature;
@property(nonatomic,strong) UILabel *night_condition;
@property(nonatomic,strong) UILabel *night_wind;
@property(nonatomic,strong) UILabel *night_temperature;
@property(nonatomic,strong) UILabel *update_time;



@end
