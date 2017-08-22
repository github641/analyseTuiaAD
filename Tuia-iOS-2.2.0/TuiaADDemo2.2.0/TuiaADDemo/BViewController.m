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
@property (nonatomic, strong)TaStreamerView *streamer;
@end

@implementation BViewController
-(void)returnPress:(id)sender{
   
    [self dismissViewControllerAnimated:YES completion:nil];

    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [TaTmHelper displaySuccess:^(id resultObj) {
        //
        NSLog(@"曝光成功：%@", resultObj);
    } displayFailed:^(id resultObj) {
        //
        NSLog(@"曝光失败：%@", resultObj);
    } clickTm:^(id resultObj) {
        //
        NSLog(@"点击成功：%@", resultObj);
        
    }];
    
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
    

//    mainView.backgroundColor = [self getColorWithHexString:@"4c4c4c"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:mainView];
    switch (self.tag) {
        case 0:
        {   self.title = @"横幅";
            
            self.streamer = [TaStreamerView adViewWithOrigin:CGPointMake(0, 0) adslotId:@"3231" parentViewController:self successBlock:^{
                NSLog(@"success");
                /* lzy注170821：补充、提取重点
                 {
                 "activity_id" = "2000000675,3885";
                 "activity_title" = "今天有惊喜，红包送给你";
                 "activity_way" = 6;
                 "ad_close" = "https://yun.tuia.cn/upload/4UyUC1480924005775.png";
                 "ad_close_visible" = 0;
                 "ad_content" = "<null>";
                 "ad_icon" = "https://yun.tuia.cn/upload/8ujO01480924005776.png";
                 "ad_icon_visible" = 0;
                 "ad_title" = "今天有惊喜，红包送给你";
                 "ad_type" = 1;
                 "adslot_id" = 3231;
                 "app_id" = 27840;
                 "click_url" = "http://activity.tuia.cn/activity/index?id=675&slotId=3231&login=normal&appKey=h4FMhRa9nNDu3jTT9NkDqhvNYnK&deviceId=268663912BED49C3B5EAC0185B2E2469&tenter=SOW&tck_rid_6c8=0a2f5cbdj6ddq968-95900188&tck_loc_c5d=tactivity-675&dcm=401.3231.0.3885&";
                 data1 = "0a2f5cbdj6ddq968-95900188";
                 data2 = "{\"materialId\":3885}";
                 dcm = "401.3231.0.3885";
                 description = "今天有惊喜，红包送给你";
                 "device_id" = "<null>";
                 "error_code" = 0;
                 expire = 0;
                 "img_height" = 150;
                 "img_url" = "https://yun.tuia.cn/tuia-media/img/11ltq7mj86.png";
                 "img_width" = 640;
                 "material_id" = 3885;
                 "material_list" =     (// 数组，数组中，一个字典（广告），广告数据中有图片的宽高。难道它没有开放宽高的设置，是因为，横幅的宽高是后台配置，sdk根据返回数据设置的吗
                 {
                 "image_height" = 150;
                 "image_url" = "//yun.tuia.cn/tuia-media/img/11ltq7mj86.png";
                 "image_width" = 640;
                 "item_type" = 1;
                 "ms_item_id" = 2;
                 text = "<null>";
                 }
                 );
                 "material_way" = 2;
                 "request_id" = 268663912BED49C3B5EAC0185B2E2469323115032864324960623;
                 rid = "0a2f5cbdj6ddq968-95900188";
                 "sck_Id" = "<null>";
                 "server_time" = "<null>";
                 source = 1;
                 "wdata_token" = "<null>";
                 }
                 */
            } failedBlock:^{
                NSLog(@"failed");
            } closedBlock:^{
                NSLog(@"closed");
            }];
            [mainView addSubview:self.streamer];
            
            NSLog(@"canTap:%@ ad_title:%@ parentViewController:%@", @(self.streamer.canTap), self.streamer.ad_title, self.streamer.parentViewController);
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
            TaScreenView *screen = [TaScreenView adViewWithAdslotId:@"3238" parentViewController:self successBlock:^{
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
           TaInfoStreamerView* infoStreamer2 = [TaInfoStreamerView adViewWithOrigin:CGPointMake(0, 250) adslotId:@"3247" type:TaInfoStreamTypeShort parentViewController:self successBlock:^{
                NSLog(@"success");
            } failedBlock:^{
                NSLog(@"failed");
            } closedBlock:^{
                NSLog(@"closed");
            }];
            [mainView addSubview:infoStreamer2];
            
            self.title = @"信息流";
            TaInfoStreamerView *infoStreamer1 = [TaInfoStreamerView adViewWithOrigin:CGPointMake(0, 10) adslotId:@"3246" type:TaInfoStreamTypeTall parentViewController:self successBlock:^{
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
            TaBnView *banner = [TaBnView adViewWithOrigin:CGPointMake(0, 0) adslotId:@"3250" parentViewController:self successBlock:^{
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
            TaDriftView *list = [TaDriftView adViewWithOrigin:CGPointMake(100, 100) adslotId:@"3251" parentViewController:self successBlock:^{
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
            TaAppWallView *wall = [TaAppWallView adViewWithOrigin:CGPointMake(100, 100) adslotId:@"3252" circle:YES parentViewController:self successBlock:^{
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
            [TaTmHelper getActivityDataWithAdslotId:@"3253" parentViewController:nil successBlock:^(id resultObj) {
                
                NSLog(@"%@", resultObj);

                UIAlertView *alert =[[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"%@",resultObj] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                [alert show];
                
//                [TaTmHelper displayAd:@"3253" activityId:[resultObj objectForKey:@"activity_id"] requestId:[resultObj objectForKey:@"request_id"]];
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
