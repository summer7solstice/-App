//
//  PhotoViewController.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/30.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollectionView.h"
@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"相册";
    [self _createCollectionView];
    [self _createBackButtonItem];
    
    
    //导航栏不占位置
    self.navigationController.navigationBar.translucent = YES;
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    //滑到制定图片
    [_collectionView scrollToItemAtIndexPath:self.indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    //接受通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_tap1Action:) name:@"单击" object:nil];
    isHiden = NO;
}

#pragma mark - collectionView
-(void)_createCollectionView{
    _collectionView = [[PhotoCollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    
    _collectionView.urls = _photoUrls;
    [self.view addSubview:_collectionView];
    
}
#pragma mark - 点击事件
-(void)_createBackButtonItem{
    UIBarButtonItem *backBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(_backAction)];
    self.navigationItem.leftBarButtonItem = backBtnItem;
}
-(void)_backAction{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(void)_tap1Action:(NSNotification *)noti{
    isHiden = !isHiden;
    [self.navigationController setNavigationBarHidden:isHiden animated:YES];
    
    }
-(BOOL)prefersStatusBarHidden{
    return self.navigationController.navigationBarHidden;
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
