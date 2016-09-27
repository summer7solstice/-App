//
//  MovieViewController.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/26.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"
#import "MovieCell.h"
#import "PosterView.h"
@interface MovieViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]]];
    //创建post/list旋转按钮
    [self _createNavigationBarRightItem];
    
    //创建postView和tableview
    [self _createListView];
    [self _createPostView];
    
    //加载数据
    [self _loadData];
    
}
-(void)_loadData{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"us_box" ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    //解析Json文件
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:NULL];
    _data = [[NSMutableArray alloc]init];
    
    NSArray *array = [jsonDic objectForKey:@"subjects"];
    
    for (NSDictionary *dic in array) {
        Movie *movie = [[Movie alloc]init];
        //subject字典
        NSDictionary *subject = [dic objectForKey:@"subject"];
        movie.average = [[subject objectForKey:@"rating"]objectForKey:@"average"];
        movie.title = [subject objectForKey:@"title"];
        movie.collect_count = [subject objectForKey:@"collect_count"];
        movie.movieId = [subject objectForKey:@"id"];
        movie.original_title = [subject objectForKey:@"original_title"];
        movie.year = [subject objectForKey:@"year"];
        movie.subtype = [subject objectForKey:@"subtype"];
        movie.images = [subject objectForKey:@"images"];
        
        //添加进数组
        [_data addObject:movie];
    }
    //刷新数据
    [_listView reloadData];
    
    //posterView数据加载
    _postView.modelArr = _data;
}
#pragma mark - 视图创建
-(void)_createPostView{
    _postView = [[PosterView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    _postView.hidden = NO;
    [self.view addSubview:_postView];
}
-(void)_createListView{
    _listView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStylePlain];
    _listView.hidden = YES;
    _listView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    _listView.rowHeight = 120;
    _listView.separatorColor = [UIColor grayColor];
    _listView.delegate = self;
    _listView.dataSource = self;
    [self.view addSubview:_listView];
}
#pragma mark - 创建导航栏item
-(void)_createNavigationBarRightItem{
    //创建父视图ImageView
    UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    //创建两个button
    UIButton *postButton = [[UIButton alloc]initWithFrame:bgImageView.frame];
    [postButton setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [postButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    postButton.hidden = YES;
    postButton.tag = 201;
    [postButton addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgImageView addSubview:postButton];
    
    UIButton *listButton = [[UIButton alloc]initWithFrame:bgImageView.frame];
    [listButton setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [listButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    listButton.hidden = NO;
    listButton.tag = 202;
    [listButton addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgImageView addSubview:listButton];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:bgImageView];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
//rightItem点击事件
-(void)rightItemAction:(UIBarButtonItem *)item{
    UIImageView *bgImageView = self.navigationItem.rightBarButtonItem.customView;
    UIButton *postButton = (UIButton*)[bgImageView viewWithTag:201];
    UIButton *listButton = (UIButton*)[bgImageView viewWithTag:202];
    
    //hidden取反
    postButton.hidden = !postButton.hidden;
    listButton.hidden = !listButton.hidden;
    
    _postView.hidden = !_postView.hidden;
    _listView.hidden = !_listView.hidden;
    
    //旋转
    [self _flipImageView:bgImageView flag:postButton.hidden];
    
    [self _flipImageView:self.view flag:postButton.hidden];
    
}
//旋转方法
-(void)_flipImageView:(UIView *)imageView flag:(BOOL)flag{
    UIViewAnimationOptions option = flag ? UIViewAnimationOptionTransitionFlipFromRight :UIViewAnimationOptionTransitionFlipFromLeft;
    
    [UIView transitionWithView:imageView duration:.5 options:option animations:^{
        [imageView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    } completion:^(BOOL finished) {
        nil;
    }];
}
#pragma mark - tableViewDatasourse
//row数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
//cell初始化
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MovieCell" owner:self options:nil]lastObject];
    }
    //传递数据model
    cell.movie = _data[indexPath.row];
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