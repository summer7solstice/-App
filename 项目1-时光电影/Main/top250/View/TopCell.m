//
//  TopCell.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/29.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "TopCell.h"
#import "Movie.h"
#import "StarView.h"
@implementation TopCell
-(void)setMovie:(Movie *)movie{
    _movie = movie;
    
    //加载图片
    [_imgView sd_setImageWithURL:[NSURL URLWithString:[self.movie.images objectForKey:@"medium"]] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    //电影名字
    _titleLabel.text = self.movie.title;
    _titleLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:.3];
    //评分
    _averageLabel.text = [NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
    
    //星星视图
    _starView.average = [self.movie.average floatValue];
    
}
@end
