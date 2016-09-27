//
//  MiniPosterCollectionView.m
//  项目1-时光电影
//
//  Created by Macx on 16/9/6.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "MiniPosterCollectionView.h"
#import "MiniPosterCell.h"

@implementation MiniPosterCollectionView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        //注册单元格
        _identify = @"MiniPosterCell";
        [self registerClass:[MiniPosterCell class] forCellWithReuseIdentifier:_identify];

    }
    return self;
}
//点击跳转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //先判断是否为当前cell
    if (self.currentItem != indexPath.item) {
        
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
    }
        //记录当前页 set方法出发KVO
    [self setCurrentItem:indexPath.item];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //复用
    MiniPosterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identify forIndexPath:indexPath];
    
    
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
