//
//  TopMovie.h
//  项目1-时光电影
//
//  Created by Macx on 16/9/9.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopMovie : NSObject
//firstCell图片
@property(nonatomic,copy)NSString *image;

@property(nonatomic,copy)NSString *titleCn;

@property(nonatomic,copy)NSArray *directors;

@property(nonatomic,copy)NSString *content;

//secondCell
@property(nonatomic,copy)NSArray *secImages;
@property(nonatomic,copy)NSArray *videos;
@end
