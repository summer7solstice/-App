//
//  TopViewController.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/26.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "TopViewController.h"
#import "Movie.h"
#import "TopCell.h"
#import "MovieDetailViewController.h"
@interface TopViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    //解析json
    [self _requestData];
    
    //间距
    
    
    //代理设置
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MovieDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MovieDetailViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - 解析json文件
-(void)_requestData{
    _modelArr = [NSMutableArray array];
    
    NSDictionary *rootDic = (NSDictionary *)[XJDataService _requestData:@"top250.json"];
    
    NSArray *arr = [rootDic objectForKey:@"subjects"];
    for (NSDictionary *dic in arr) {
        Movie *movie = [[Movie alloc]init];
        movie.average = [[dic objectForKey:@"rating"]objectForKey:@"average"];
        movie.title = [dic objectForKey:@"title"];
        movie.images = [dic objectForKey:@"images"];
        //加进数组
        [_modelArr addObject:movie];
    }
}
#pragma mark - dataSourse
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _modelArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[TopCell alloc]init];
    }
    //model传递到cell
    cell.movie = _modelArr[indexPath.row];
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
