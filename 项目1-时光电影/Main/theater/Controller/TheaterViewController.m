//
//  TheaterViewController.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/26.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "TheaterViewController.h"
#import "Theater.h"
#import "TheaterCell.h"
@interface TheaterViewController ()

@end

@implementation TheaterViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.title = @"影院";
//    
//    [self _requestData];
//    
//    //注册cell
//    [_tableView registerNib:[UINib nibWithNibName:@"TheaterCell.xib" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TheaterCell"];
//    
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//    
//}
//-(void)_requestData{
//    _data = [NSMutableArray array];
//    NSDictionary *jsonDic = (NSDictionary*)[XJDataService _requestData:@"cinema_list.json"];
//    NSArray *cinemaList = [jsonDic objectForKey:@"cinemaList"];
//    
//    for (NSDictionary *dic in cinemaList) {
//        Theater *theater = [[Theater alloc]init];
//        theater.lowPrice = [dic objectForKey:@"lowPrice"];
//        theater.grade = [dic objectForKey:@"grade"];
//        theater.address = [dic objectForKey:@"address"];
//        theater.name = [dic objectForKey:@"name"];
//        theater.isSeatSupport = [dic objectForKey:@"isSeatSupport"];
//        theater.isCouponSupport = [dic objectForKey:@"isCouponSupport"];
//        theater.isImaxSupport = [dic objectForKey:@"isImaxSupport"];
//        theater.isGroupBuySupport = [dic objectForKey:@"isGroupBuySupport"];
//        
//        [_data addObject:theater];
//    }
//}
//#pragma mark - dataSource
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return _data.count;
//}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    TheaterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TheaterCell"];
//    cell.theater = [self.data objectAtIndex:indexPath.row];
//    
//    return cell;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
