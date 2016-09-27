//
//  PhotoCollectionView.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/30.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCell.h"
#import "PhotoScroll.h"
@implementation PhotoCollectionView
-(instancetype)initWithFrame:(CGRect)frame{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    //滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(KScreenWidth, KScreenHeight);
    //布局对象
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    
    if (self) {
    //设置代理对象
    self.delegate = self;
    self.dataSource = self;
    self.pagingEnabled = YES;
    flowLayout.minimumLineSpacing = 0;
    //注册cell ID
    [self registerClass:[PhotoCell class] forCellWithReuseIdentifier:@"cell"];
        
    
    }
    
    return self;
    
}
//上一个消失的Cell
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCell *myCell = (PhotoCell*)cell;
    
    [myCell.scrollView setZoomScale:1.0 animated:YES];
}
#pragma mark - dataSourse
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.urls.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell setBackgroundColor:[UIColor darkGrayColor]];
    cell.url = [NSURL URLWithString:self.urls[indexPath.row]];
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
