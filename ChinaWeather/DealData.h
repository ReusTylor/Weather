//
//  DealData.h
//  ChinaWeather
//
//  Created by 创新创业中心 on 16/7/24.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DealData : NSObject <NSObject>
@property(nonatomic,strong) NSString  *city,*county,*date,*day_condition,*day_wind,*day_temperature,*night_condition,*night_wind,*night_temperature,*update_time;
@property(nonatomic,strong) NSString *selectcity;


@end
