//
//  MyTabBarItem.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/25.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "MyTabBarItem.h"

@implementation MyTabBarItem
-(instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imgName title:(NSString*)title{
    self = [super initWithFrame:frame];
    if (self != nil) {
        //创建ImageView
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - 20)/2, 6, 20, 20)];
        imgView.image = [UIImage imageNamed:imgName];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        //titleLabel
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgView.frame), frame.size.width, 20)];
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = title;
        
        [self addSubview:imgView];
        [self addSubview:titleLabel];
    }
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
