//
//  NewsViewController.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/26.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "NewsCell.h"
#import "WordViewController.h"
#import "PictureViewController.h"
@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载数据
    [self _loadData];
    [self _createHeaderView];
    
    [_newsTableView setBackgroundColor:[UIColor clearColor]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]]];
    
    self.navigationController.navigationBar.translucent = NO;
}
-(void)_loadData{
    _modelArr = [NSMutableArray array];
    
    NSArray *jsonArr = (NSArray*)[XJDataService _requestData:@"news_list.json"];
    for (NSDictionary *dic in jsonArr) {
        NewsModel *model = [[NewsModel alloc]init];
        model.newsId = [dic objectForKey:@"id"];
        model.type = [dic objectForKey:@"type"];
        model.title = [dic objectForKey:@"title"];
        model.summary = [dic objectForKey:@"summary"];
        model.image = [dic objectForKey:@"image"];
        
        [_modelArr addObject:model];
    }
    //reload数据
    [_newsTableView reloadData];
}
//cell高度设置
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 150;
    }else{
        return 70;
    }
}
#pragma mark - 预告信息
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsModel *news = self.modelArr[indexPath.row];
    NSInteger s = [news.type integerValue];
    
    if (s == 0) {//文字
        WordViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"];
        [self.navigationController pushViewController:view animated:YES];
    }else if (s == 1){//图片
        PictureViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"PictureViewController"];
        [self.navigationController pushViewController:view animated:YES];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}
#pragma mark - 可缩放的视图
-(void)_createHeaderView{
    UIImageView *headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 150)];
    NewsModel *news = self.modelArr[0];
    headerView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:news.image]]];
    headerView.tag = 123;
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((headerView.size.width - KScreenWidth)/2, 0, KScreenWidth, 25)];
    titleLabel.text = news.title;
    titleLabel.tag = 124;
    titleLabel.bottom = headerView.bottom;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:titleLabel];
    
    [self.view insertSubview:headerView belowSubview:_newsTableView];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.y;
    UIImageView *headerView = [self.view viewWithTag:123];
    UILabel *titleLabel = [self.view viewWithTag:124];
   
    //向上滑
    if (offset > 0) {
        headerView.top = -offset;
    }else{//向下滑
        
//        NSLog(@"%.1f",headerView.frame.size.height);
        CGFloat height = 150 +ABS(offset);
        
        CGFloat width = KScreenWidth /150 *height;
        
        CGRect frame1 = CGRectMake(-(width - KScreenWidth)/2, 0, width, height);
        headerView.frame = frame1;
        CGRect frame = titleLabel.frame;
        frame = CGRectMake((headerView.size.width - KScreenWidth)/2, 0, KScreenWidth, 25);
        titleLabel.frame = frame;
        titleLabel.bottom = headerView.bottom;
    }
}
#pragma mark - dataSourse
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _modelArr.count;
}
//cell创建
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"headerCell" forIndexPath:indexPath];

        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]]];
    if (cell == nil) {
        cell = [[NewsCell alloc]init];
    }
    //给cell赋予model
    cell.model = _modelArr[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
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
