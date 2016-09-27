//
//  PosterCell.h
//  项目1-时光电影
//
//  Created by Macx on 16/8/31.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;
@class DetailView;
@interface PosterCell : UICollectionViewCell{
    //电影大图
    UIImageView *_imgView;
    
    //detail界面
    DetailView *_detailView;
    
    //翻转方向
    BOOL direction;
    
   
}
@property(nonatomic,strong)Movie *movie;
@property(nonatomic,assign)BOOL isFliped;//是否被翻转了
-(void)flipCell;
@end
