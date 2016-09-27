//
//  MiniPosterCell.h
//  项目1-时光电影
//
//  Created by Macx on 16/9/6.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;
@interface MiniPosterCell : UICollectionViewCell{
    //小海报视图
    UIImageView *_imgView;
}
@property(nonatomic,strong)Movie *movie;
@end
