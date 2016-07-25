//
//  DealData.m
//  ChinaWeather
//
//  Created by 创新创业中心 on 16/7/24.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DealData.h"
#import "AFNetworking.h"
#import "AFNetworking.h"
#import "MainViewController.h"


@implementation DealData
-(instancetype)init{
    if (self=[super init]) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadData) name:@"refreshpage" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadData) name:@"changecity" object:nil];
        self.county=@"";
        self.date=@"";
        self.day_condition=@"";
        self.day_wind=@"";
        self.day_temperature=@"";
        self.night_condition=@"";
        self.night_wind=@"";
        self.night_temperature=@"";
        self.update_time=@"";
        if (![[NSUserDefaults standardUserDefaults]objectForKey:@"city"])
        {
            self.selectcity=@"成都";
        }
        else
            self.selectcity=[[NSUserDefaults standardUserDefaults]objectForKey:@"city"];
    
        [self loadData];
        

    }return self;
}






-(void)loadData{
   [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSDictionary* citydic=@{@"city":self.selectcity};
    NSString* urlnet=@"http://api.1-blog.com/biz/bizserver/weather/list.do";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:urlnet parameters:citydic progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSDictionary* dic1 = [responseObject objectForKey:@"detail"];
        if ([[dic1 valueForKey:@"city"] count] == 0) {
            [[NSNotificationCenter defaultCenter]postNotificationName:@"wrong" object:nil];
            self.selectcity=[[NSUserDefaults standardUserDefaults]objectForKey:@"city"];
            return ;
        }
        
        
        self.city=[NSString stringWithFormat:@"%@", [dic1 valueForKey:@"city"][0]];
        self.county=[NSString stringWithFormat:@"%@", [dic1 valueForKey:@"county"][0]];
        self.date=[NSString stringWithFormat:@"%@", [dic1 valueForKey:@"date"][0]];
        self.day_condition=[NSString stringWithFormat:@"%@", [dic1 valueForKey:@"day_condition"][0]];
        self.day_wind=[NSString stringWithFormat:@"%@", [dic1 valueForKey:@"day_wind"][0]];
        self.day_temperature=[NSString stringWithFormat:@"%@", [dic1 valueForKey:@"day_temperature"][0]];
        self.night_condition=[NSString stringWithFormat:@"%@", [dic1 valueForKey:@"night_condition"][0]];
        self.night_wind=[NSString stringWithFormat:@"%@", [dic1 valueForKey:@"night_wind"][0]];
        self.night_temperature=[NSString stringWithFormat:@"%@", [dic1 valueForKey:@"night_temperature"][0]];
        self.update_time=[NSString stringWithFormat:@"%@", [dic1 valueForKey:@"update_time"][0]];
        [[NSUserDefaults standardUserDefaults]setObject:self.city forKey:@"city"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"refresh" object:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
    }];
}



@end
