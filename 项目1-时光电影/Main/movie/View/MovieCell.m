//
//  MovieCell.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/26.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "MovieCell.h"
#import "Movie.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"
@implementation MovieCell

- (void)awakeFromNib {
//    [super awakeFromNib];
    //单元格透明化
    self.backgroundColor = [UIColor clearColor];
    //单元格取消点击事件
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
-(void)setMovie:(Movie *)movie{
    _movie = movie;
    
    //图片加载
    NSString *small = [_movie.images objectForKey:@"small"];
    NSURL *url = [[NSURL alloc]initWithString:small];
    [_imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
    
    _yearLabel.text = [NSString stringWithFormat:@"年份 : %@",self.movie.year];
    _averageLabel.text = [NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
    _titleLabel.text = self.movie.title;
    
    _starView.average = [self.movie.average floatValue];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
