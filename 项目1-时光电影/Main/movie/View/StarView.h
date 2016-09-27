//
//  StarView.h
//  项目1-时光电影
//
//  Created by Macx on 16/8/27.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    //金色星星
    UIView *_yellowView;
    //灰色星星
    UIView *_grayView;
}
@property(nonatomic,assign)CGFloat average;//评分
@end
