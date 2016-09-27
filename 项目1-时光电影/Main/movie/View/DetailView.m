//
//  DetailView.m
//  项目1-时光电影
//
//  Created by Macx on 16/9/8.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "DetailView.h"
#import "Movie.h"
#import "StarView.h"
@implementation DetailView

-(void)setMovie:(Movie *)movie{
    if (_movie != movie) {
        _movie = movie;
        
        [_imgView sd_setImageWithURL:[NSURL URLWithString:[movie.images objectForKey:@"medium"]] placeholderImage:[UIImage imageNamed:@"pig"]];
        //中文名
        _cnTitleLabel.text = [NSString stringWithFormat:@"中文名:%@",movie.title];
        //英文名
        _engTitleLabel.text = [NSString stringWithFormat:@"英文名:%@",movie.original_title];
        //年份
        _yearLabel.text = [NSString stringWithFormat:@"年份:%@",movie.year];
        //评分
        _averageLabel.text = [NSString stringWithFormat:@"%.1f",[movie.average floatValue]];
        
        _starView.average = [movie.average floatValue];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
