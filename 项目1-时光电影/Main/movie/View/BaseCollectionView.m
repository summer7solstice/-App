//
//  BaseCollectionView.m
//  项目1-时光电影
//
//  Created by Macx on 16/9/8.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView
-(instancetype)initWithFrame:(CGRect)frame{
    
    //布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //水平滑动
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //间隙
    flowLayout.minimumLineSpacing = 0;
    
    //创建
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    
    if (self) {
        //设置代理
        self.delegate = self;
        self.dataSource = self;
        
        //取消滚动条
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        
        //scrollView减速范围
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        
    }
    return self;
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    //计算index
    NSInteger index = (targetContentOffset->x + _pageWidth/2)/_pageWidth;
    
    //设置跳转偏移
    targetContentOffset->x = _pageWidth * index;
    
    //记录当前页  set方法触发KVO
    [self setCurrentItem:index];
    
}
//起始位置偏移,第一张图对准中心
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    CGFloat offsetX = (CGRectGetWidth(self.frame) - _pageWidth) / 2;
    return UIEdgeInsetsMake(0, offsetX, 0, offsetX);
    
}

//cell尺寸
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_pageWidth, self.frame.size.height);
}
#pragma mark - dataSourse
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
