//
//  PosterView.h
//  项目1-时光电影
//
//  Created by Macx on 16/8/31.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PosterCollectionView;
@class MiniPosterCollectionView;
@interface PosterView : UIView{
    UIView *_headerView;
    UILabel *_footerLabel;
    UIControl *_maskView;//遮盖视图
    PosterCollectionView *_collectionView;
    MiniPosterCollectionView *_miniCollectionView;
}
@property(nonatomic,strong)NSMutableArray *modelArr;
@end
