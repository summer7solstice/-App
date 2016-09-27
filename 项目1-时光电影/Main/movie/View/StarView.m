//
//  StarView.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/27.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "StarView.h"
#import "UIViewExt.h"
@implementation StarView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //创建子视图
        [self _createView];
        
    }
    return self;
}
//若有xib文件,则会优先调用此方法
-(void)awakeFromNib{
    [self _createView];
}
-(void)_createView{
    UIImage *yellowImg = [UIImage imageNamed:@"yellow"];
    UIImage *grayImg = [UIImage imageNamed:@"gray"];
    
    //1.创建灰色星星
    _grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, grayImg.size.width * 5, grayImg.size.height)];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImg];
    [self addSubview:_grayView];
    //2.创建黄色星星
    _yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, yellowImg.size.width * 5 , yellowImg.size.height)];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImg];
    [self addSubview:_yellowView];

    //3.设置当前视图的宽度为5个星星的宽度
    CGFloat star5Width = yellowImg.size.width * 5;
    self.width = star5Width;
    
    //缩放比例
    CGFloat scale = self.frame.size.height / yellowImg.size.height;
    CGAffineTransform t = CGAffineTransformMakeScale(scale, scale);
    _grayView.transform = t;
    _yellowView.transform = t;
    
    _grayView.origin = CGPointZero;
    _yellowView.origin = CGPointZero;
    
    //给当前视图一个透明背景，便于观察
    self.backgroundColor = [UIColor clearColor];

}
-(void)setAverage:(CGFloat)average{
    _average = average;
    
    //1.计算分数的百分比
    CGFloat s = average / 10.0;
    //2.黄色视图的宽度进行相应的变化
    
    //1)先修改黄色星星的宽度（这边注意，我们要用已经改变了的宽度进行设置）
    CGFloat width = self.frame.size.height / [UIImage imageNamed:@"yellow"].size.height
    *[UIImage imageNamed:@"yellow"].size.width * 5 *s;
    
    
    //2)设定黄色星星的宽度
    _yellowView.width = width;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
