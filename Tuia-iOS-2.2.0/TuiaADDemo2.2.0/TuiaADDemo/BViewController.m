//
//  BViewController.m
//  TaTmDemo
//
//  Created by  on 17/2/23.
//  Copyright © 2017年 dozening. All rights reserved.
//

#import "BViewController.h"
#import <TaTmSDK/TaTm.h>
@interface BViewController ()

@end

@implementation BViewController
-(void)returnPress:(id)sender{
   
    [self dismissViewControllerAnimated:YES completion:nil];

    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"< 返回" style:UIBarButtonItemStylePlain target:self action:@selector(goback)];
    UIView* mainView = [UIView new];
    NSArray *viewcontrollers=self.navigationController.viewControllers;
    if (viewcontrollers.count>1) {
        if ([viewcontrollers objectAtIndex:viewcontrollers.count-1]==self) {
            //push方式
             mainView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height );
        }
    }
    else{
        //present方式
         mainView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height );
        
        UIButton* button = [[UIButton alloc]init];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:@"<" forState:UIControlStateNormal];
        button.frame = CGRectMake(10, 20, 40, 40);
        [button addTarget:self action:@selector(returnPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"< 返回" style:UIBarButtonItemStylePlain target:self action:@selector(returnPress:)];
    }
    
    
   
    mainView.backgroundColor = [self getColorWithHexString:@"4c4c4c"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:mainView];
    switch (self.tag) {
        case 0:
        {   self.title = @"横幅";
            
            TaStreamerView *streamer = [TaStreamerView adViewWithOrigin:CGPointMake(0, 0) adslotId:@"458" parentViewController:self successBlock:^{
                NSLog(@"success");
            } failedBlock:^{
                NSLog(@"failed");
            } closedBlock:^{
                NSLog(@"closed");
            }];
            [mainView addSubview:streamer];
            
            NSLog(@"canTap:%@ ad_title:%@ parentViewController:%@", @(streamer.canTap), streamer.ad_title, streamer.parentViewController);
//            streamer.closed() = (^closed)(){
//                
//            };
            
//            void(^closed)(void) = ^{
//                NSLog(@"closed");
//
//            };
//            streamer.closed = closed;
        }
            
            break;
        case 1:
        {
            self.title = @"插屏";
            TaScreenView *screen = [TaScreenView adViewWithAdslotId:@"459" parentViewController:self successBlock:^{
                NSLog(@"success");
            } failedBlock:^{
                NSLog(@"failed");
            } closedBlock:^{
                NSLog(@"closed");
            }];
            [screen show];
        }
            
            break;
        case 2:
            
            
        {
           TaInfoStreamerView* infoStreamer2 = [TaInfoStreamerView adViewWithOrigin:CGPointMake(0, 250) adslotId:@"461" type:TaInfoStreamTypeShort parentViewController:self successBlock:^{
                NSLog(@"success");
            } failedBlock:^{
                NSLog(@"failed");
            } closedBlock:^{
                NSLog(@"closed");
            }];
            [mainView addSubview:infoStreamer2];
            
            self.title = @"信息流";
            TaInfoStreamerView *infoStreamer1 = [TaInfoStreamerView adViewWithOrigin:CGPointMake(0, 10) adslotId:@"460" type:TaInfoStreamTypeTall parentViewController:self successBlock:^{
                NSLog(@"success");
            } failedBlock:^{
                NSLog(@"failed");
            } closedBlock:^{
                NSLog(@"closed");
            }];
            [mainView addSubview:infoStreamer1];
            
         
        }

            
            break;
        case 3:
        {
            self.title = @"BANNER";
            TaBnView *banner = [TaBnView adViewWithOrigin:CGPointMake(0, 0) adslotId:@"462" parentViewController:self successBlock:^{
                NSLog(@"success");
            } failedBlock:^{
                NSLog(@"failed");
            } closedBlock:^{
                NSLog(@"closed");
            }];
            [mainView addSubview:banner];
        }

            
            break;
        case 4:
        {
            self.title = @"浮标";
            //463
            TaDriftView *list = [TaDriftView adViewWithOrigin:CGPointMake(100, 100) adslotId:@"463" parentViewController:self successBlock:^{
                NSLog(@"success");
            } failedBlock:^{
                NSLog(@"failed");
            } closedBlock:^{
                NSLog(@"closed");
            }];
            UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
            [mainView addSubview:tableView];
            [mainView addSubview:list];
        }
            
            break;
        case 5:
        {
            self.title = @"应用墙";
            TaAppWallView *wall = [TaAppWallView adViewWithOrigin:CGPointMake(100, 100) adslotId:@"464" circle:YES parentViewController:self successBlock:^{
                NSLog(@"success");
            } failedBlock:^{
                NSLog(@"failed");
            } closedBlock:^{
                NSLog(@"closed");
            }];
            UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
            [mainView addSubview:tableView];
            [tableView addSubview:wall];
        }
            
            break;
            
        default:{
            [TaTmHelper getActivityDataWithAdslotId:@"465" parentViewController:nil successBlock:^(id resultObj) {
                
                NSLog(@"%@", resultObj);
                
                
                
                
                
                UIAlertView *alert =[[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"%@",resultObj] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                [alert show];
                //[TaTmHelper displayAd:@"2062" activityId:[resultObj objectForKey:@"activity_id"] requestId:[resultObj objectForKey:@"request_id"]];
                NSString *adID = [NSString stringWithFormat:@"%@", resultObj[@"adslot_id"]];
                NSString *rqID = [NSString stringWithFormat:@"%@", resultObj[@"request_id"]];
                NSString *atID = [NSString stringWithFormat:@"%@", resultObj[@"activity_id"]];
                [TaTmHelper clickAd:adID activityId:atID requestId:rqID];
                [TaTmHelper displayAd:adID activityId:atID requestId:rqID];
                
            } failedBlock:^(id resultObj) {
                NSLog(@"自定义广告位请求失败");
            }];
        }
            break;
    }
    
    
}
- (UIColor *)getColorWithHexString:(NSString *)hexColor
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green / 255.0f) blue:(float)(blue / 255.0f)alpha:1.0f];
}
-(void)goback{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
