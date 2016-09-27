//
//  PhotoCell.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/30.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "PhotoCell.h"
#import "PhotoScroll.h"
@implementation PhotoCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[PhotoScroll alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
        
        
        [self.contentView addSubview:_scrollView];
        
        //cell的属性
        
    }
    return self;
}
-(void)setUrl:(NSURL *)url{
    if (_url != url) {
        _url = url;
    }
    _scrollView.url = self.url;
}
@end
