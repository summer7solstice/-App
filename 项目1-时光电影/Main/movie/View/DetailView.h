//
//  DetailView.h
//  项目1-时光电影
//
//  Created by Macx on 16/9/8.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class Movie;
@interface DetailView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *cnTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *engTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet StarView *starView;
@property (weak, nonatomic) IBOutlet UILabel *averageLabel;


@property(nonatomic,strong)Movie *movie;
@end
