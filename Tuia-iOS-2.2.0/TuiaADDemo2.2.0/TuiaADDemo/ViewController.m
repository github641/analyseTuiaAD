//
//  ViewController.m
//  TaTmDemo
//
//  Created by  on 17/2/23.
//  Copyright © 2017年 dozening. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"
#import <TaTmSDK/TaTm.h>

#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}
- (void) setupView{
    NSArray* arr = @[@"横幅", @"插屏", @"信息流", @"BANNER", @"浮标", @"应用墙", @"自定义"];
    UIView* mainView = [UIView new];
    
    mainView.backgroundColor = [UIColor lightGrayColor];
    mainView.frame = self.view.frame;
    if (self.navigationController.topViewController == self) {
        self.title = @"测试demo";
        mainView.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64-49);
    }
    [self.view addSubview:mainView];
    __block UIButton* lastButton = nil;
    for (int i =0; i<7; i++) {
        UIButton *button = [UIButton new];
        button.backgroundColor = [UIColor blackColor];
        button.layer.masksToBounds =YES;
        button.layer.cornerRadius = 10;
        button.layer.borderColor =  [[UIColor whiteColor]CGColor];
        button.layer.borderWidth = 2;
        
        //button.frame = CGRectMake(80, 60*i+100, 90, 40);
        
        button.tag = i;
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [mainView addSubview:button];
        
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(-5);
            if (!lastButton) {
                make.top.mas_equalTo(20);
               
                
                
            } else if (i ==6){
                make.top.mas_equalTo(lastButton.mas_bottom).mas_equalTo(5);
                make.bottom.mas_equalTo(-5);
                make.height.mas_equalTo(lastButton.mas_height);
            }else{
                make.top.mas_equalTo(lastButton.mas_bottom).mas_equalTo(5);
                 make.height.mas_equalTo(lastButton.mas_height);
                
            }
            
            lastButton = button;
        }];
        
        [button addTarget:self action:@selector(gotoView:) forControlEvents:UIControlEventTouchUpInside];
    }
    
//    [TaTmHelper displaySuccess:^(id resultObj) {
//        //
//        NSLog(@"曝光成功");
//    } displayFailed:^(id resultObj) {
//        //
//        NSLog(@"曝光失败");
//    } clickTm:^(id resultObj) {
//        //
//        NSLog(@"点击成功");
        
//    }];
    
    [TaTmHelper displaySuccess:^(id resultObj) {
        //
        NSLog(@"曝光成功");
    } displayFailed:^(id resultObj) {
        //
        NSLog(@"曝光失败");
    } clickTm:^(id resultObj) {
        //
        NSLog(@"点击成功");
    
    }];
}
- (void) gotoView:(UIButton *)btn{
    BViewController* vc = [BViewController new];
    vc.tag = btn.tag;
    if (self.navigationController.topViewController == self) {
        [self.navigationController pushViewController:vc animated:YES];
    } else{
        //UINavigationController* navi = [[UINavigationController alloc]initWithRootViewController:vc];
        
        [self presentViewController:vc animated:YES completion:nil];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
