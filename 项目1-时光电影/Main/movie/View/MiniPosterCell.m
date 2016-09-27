//
//  MiniPosterCell.m
//  项目1-时光电影
//
//  Created by Macx on 16/9/6.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "MiniPosterCell.h"
#import "Movie.h"
@implementation MiniPosterCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //创建视图
        [self _creataView];
    }
    return self;
}
-(void)_creataView{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width * .95, self.frame.size.height * .95)];
    _imgView.center = self.contentView.center;
    [self.contentView addSubview:_imgView];
}
-(void)setMovie:(Movie *)movie{
    if (_movie != movie) {
        _movie = movie;
        
        [_imgView sd_setImageWithURL:[NSURL URLWithString:[_movie.images objectForKey:@"small"]] placeholderImage:[UIImage imageNamed:@"pig"]];
    }
}
@end
