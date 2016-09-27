//
//  PosterCell.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/31.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "PosterCell.h"
#import "Movie.h"
#import "DetailView.h"
@implementation PosterCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _isFliped = NO;
        
        //创建视图
        [self _createView];
        
        
    }
    return self;
}
-(void)_createView{
    //翻转前
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.size.width * .95, self.contentView.size.height * .95)];
    _imgView.hidden = NO;
    _imgView.center = self.contentView.center;
    [self.contentView addSubview:_imgView];
    
    //翻转后
    _detailView = [[[NSBundle mainBundle]loadNibNamed:@"DetailView" owner:self options:nil]lastObject];
    _detailView.hidden = YES;
    _detailView.backgroundColor = [UIColor colorWithWhite:.5 alpha:.7];
    _detailView.transform = CGAffineTransformMakeScale(.95, .95);
    _detailView.center = self.contentView.center;
    

    [self.contentView addSubview:_detailView];
    
}
//设置movie
-(void)setMovie:(Movie *)movie{
    if (_movie != movie) {
        _movie = movie;
        
        //将movie给detailView
        _detailView.movie = movie;
        //数据填充
        NSString *urlStr = [movie.images objectForKey:@"large"];
        
        [_imgView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"pig"]];
    }
}

//翻转实现
-(void)flipCell{
    UIViewAnimationOptions dir = direction ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight ;
    
    [UIView transitionWithView:self.contentView duration:.5 options:dir animations:^{
        _imgView.hidden = !_imgView.hidden;
        _detailView.hidden = !_detailView.hidden;
    } completion:NULL];
    
    direction = !direction;
}
@end
