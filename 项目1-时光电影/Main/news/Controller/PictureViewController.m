//
//  PictureViewController.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/29.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "PictureViewController.h"
#import "NewsModel.h"
#import "PhotoViewController.h"
#import "MyNavigationController.h"
@interface PictureViewController ()

@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图片新闻";
    [self _requestData];
    
//    self.navigationController.navigationBar.translucent = YES;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]]];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
}
-(void)_requestData{
    //加载数据
    NSArray *array = (NSArray *)[XJDataService _requestData:@"image_list.json"];
    self.modelArr = [NSMutableArray arrayWithCapacity:array.count];
    
    for (NSDictionary *dic in array) {
        NewsModel *newsModel = [[NewsModel alloc]init];
        newsModel.image = dic[@"image"];
        
        [_modelArr addObject:newsModel];
    }
    //刷新collectionview
    [_collectionView reloadData];
}
#pragma mark - 选中图片进入浏览
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoViewController *photoView = [[PhotoViewController alloc]init];
    photoView.photoUrls = [NSMutableArray array];
    MyNavigationController *navi = [[MyNavigationController alloc]initWithRootViewController:photoView];
    //将_modelArr中的model的image属性(nsstring)添加到photoView的存放图片的URL的数组中
    for (NewsModel *newsModel in _modelArr) {
        NSString *url = newsModel.image;
      [photoView.photoUrls addObject:url];
        photoView.indexPath = indexPath;
    }
    photoView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:navi animated:YES completion:NULL];
}
#pragma mark - dataSourse
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _modelArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imgCell" forIndexPath:indexPath];
    
    UIImageView *imgView = (UIImageView *)[cell.contentView viewWithTag:200];
    NewsModel *news = self.modelArr[indexPath.row];
    [imgView sd_setImageWithURL:[NSURL URLWithString:news.image] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    return cell;

}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
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
