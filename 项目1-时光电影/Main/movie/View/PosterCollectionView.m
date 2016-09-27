//
//  PosterCollectionView.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/31.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterCell.h"
@implementation PosterCollectionView
-(instancetype)initWithFrame:(CGRect)frame{
    
    //创建
    self = [super initWithFrame:frame];
    if (self) {
        //注册单元格
        _identify = @"PosterCell";
        [self registerClass:[PosterCell class] forCellWithReuseIdentifier:_identify];
      
    }
    return self;
}

#pragma mark - delegate
//点击翻转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //先判断是否为当前cell
    if (self.currentItem == indexPath.item) {
        PosterCell *pCell = (PosterCell*)[collectionView cellForItemAtIndexPath:indexPath];
        [pCell flipCell];
        
        //记录翻转
        pCell.isFliped = ! pCell.isFliped;
        
    }else {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        //记录当前页  set方法出发KVO
        [self setCurrentItem:indexPath.item];
        
    }
    
    
}

//cell创建
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //复用
    PosterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identify forIndexPath:indexPath];
    if (cell.isFliped == YES) {
        [cell flipCell];
        
        cell.isFliped = NO;
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.movie = self.data[indexPath.item];
    
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
