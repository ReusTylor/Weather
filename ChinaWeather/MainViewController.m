//
//  MainViewController.m
//  ChinaWeather
//
//  Created by 创新创业中心 on 16/7/24.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "MainViewController.h"
#import "DealData.h"

@implementation MainViewController
-(instancetype)init{
    if (self=[super init]) {
       
        
        self.data=[[DealData alloc]init];
        
        
        
        self.title=@"囧天气";
        
        [self.navigationController.navigationBar setBarTintColor:[UIColor purpleColor]];
        self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshpage)];
        UIBarButtonItem*rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"城市" style:UIBarButtonItemStylePlain target:self action:@selector(clicked)];
        self.navigationItem.rightBarButtonItem=rightBarButtonItem;

        
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(weather) name:@"refresh" object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(wrongcity) name:@"wrong" object:nil];
        self.data=[[DealData alloc]init];
        [self firstdata];
        
    }return self;
}


        
-(void)firstdata{
        self.city=[[UILabel alloc]initWithFrame:CGRectMake(120, 150, 60, 50)];
    
    
        self.city.font=[UIFont fontWithName:@"Helvetica" size:25];
        self.county=[[UILabel alloc]initWithFrame:CGRectMake(200, 150, 60, 50)];
        self.county.font=[UIFont fontWithName:@"Helvetica" size:25];
        self.date=[[UILabel alloc]initWithFrame:CGRectMake(138, 210, 100, 40)];
        self.day_condition=[[UILabel alloc]initWithFrame:CGRectMake(100, 300, 80, 40)];
        self.day_wind=[[UILabel alloc]initWithFrame:CGRectMake(80, 340, 80, 40)];
        self.day_temperature=[[UILabel alloc]initWithFrame:CGRectMake(100, 380, 80, 40)];
        self.night_condition=[[UILabel alloc]initWithFrame:CGRectMake(250,300, 100, 40)];
        self.night_wind=[[UILabel alloc]initWithFrame:CGRectMake(230, 340, 80, 40)];
        self.night_temperature=[[UILabel alloc]initWithFrame:CGRectMake(250, 380, 80, 40)];
        [self.view addSubview:self.city];
        [self.view addSubview:self.county];
        [self.view addSubview:self.date];
        [self.view addSubview:self.day_condition];
        [self.view addSubview:self.day_wind];
        [self.view addSubview:self.day_temperature];
        [self.view addSubview:self.night_condition];
        [self.view addSubview: self.night_wind];
        [self.view addSubview:self.night_temperature];
        [self.view addSubview: self.update_time];
}
-(void)weather{
    [self.city setText:self.data.city];
    [self.county setText:self.data.county];
    [self.date setText:self.data.date];
    [self.day_condition setText:self.data.day_condition];
    [self.day_wind setText:self.data.day_wind];
    [self.day_temperature setText: self.data.day_temperature];
    [self.night_condition setText:self.data.night_condition];
    [self.night_wind setText:self.data.night_wind];
    [self.night_temperature setText:self.data.night_temperature];
    [self.update_time setText:self.data.update_time];
//     UIBarButtonItem*rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:self.city.text style:UIBarButtonItemStylePlain target:self action:@selector(clicked)];
   self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:self.city.text style:UIBarButtonItemStylePlain target:self action:@selector(clicked)];
}


-(void)refreshpage{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshpage" object:nil];
    
}

-(void)clicked{
    // UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    NSString *alerttitle = @"选择城市";
    NSString *holder =@"请输入城市";
    UIAlertController *alertController =[UIAlertController alertControllerWithTitle:alerttitle message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
       textField.placeholder=holder;
      
      
    }];
    UIAlertAction *cancelAction =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *sureAction =[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.data.selectcity= alertController.textFields[0].text;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changecity" object:nil];

    }];
    [alertController addAction:cancelAction];
    [alertController addAction:sureAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
   

    
}
-(void)wrongcity{
    UIAlertController *wrong=[UIAlertController alertControllerWithTitle:@"错误" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [wrong addAction:cancel];
    [self presentViewController:wrong animated:YES completion:nil];

}

@end
