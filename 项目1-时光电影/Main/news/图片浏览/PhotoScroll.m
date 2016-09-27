//
//  PhotoScroll.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/30.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "PhotoScroll.h"

@implementation PhotoScroll
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imgView = [[UIImageView alloc]initWithFrame:self.bounds];
        
        [self addSubview:_imgView];
        
        //图片填充方式
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        //放大缩小
        self.maximumZoomScale = 3.0;
        self.minimumZoomScale = 1.0;
        
        self.delegate = self;
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        
        //单击
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1)];
        
        tap1.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tap1];
        
        //双击
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2)];
        
        tap2.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap2];
        
        [tap1 requireGestureRecognizerToFail:tap2];
    }
    return self;
}
//单双击
-(void)tap1{
    //发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"单击" object:self];
}
-(void)tap2{
    if (self.zoomScale > 1.0) {
        [self setZoomScale:1.0 animated:YES];
    }else {
        [self setZoomScale:2.5 animated:YES];
    }
}
-(void)setUrl:(NSURL *)url{
    if (_url != url) {
        _url = url;
    }
    
    [_imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
}
#pragma mark - scrollViewDelegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imgView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
