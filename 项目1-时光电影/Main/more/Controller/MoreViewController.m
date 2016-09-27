//
//  MoreViewController.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/26.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setBackgroundColor:[UIColor clearColor]];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self countCacheSize];
}

-(void)countCacheSize{
    //byte kb MB GB TB
    
    NSUInteger fileSize = [[SDImageCache sharedImageCache]getSize];
    
    _label.text = [NSString stringWithFormat:@"%.1f MB",fileSize / 1024 / 1024.0];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"清理缓存" message:@"你看见我的。。。。" delegate:self cancelButtonTitle:@"宝宝不要" otherButtonTitles:@"扶朕上龙椅", nil];
        
        [alertView show];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [[SDImageCache sharedImageCache]clearDisk];
        
        [self countCacheSize];
    }
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
