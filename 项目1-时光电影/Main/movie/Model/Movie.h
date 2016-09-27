//
//  Movie.h
//  项目1-时光电影
//
//  Created by Macx on 16/8/26.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
//电影名字
@property(nonatomic,copy)NSString *title;
//英文名
@property(nonatomic,copy)NSString *original_title;
//年份
@property(nonatomic,copy)NSString *year;
//图片
@property(nonatomic,copy)NSDictionary *images;
//评分
@property(nonatomic,strong)NSNumber *average;
//种类
@property(nonatomic,copy)NSString *subtype;
//收藏人数
@property(nonatomic,strong)NSNumber *collect_count;
//id
@property(nonatomic,copy)NSString *movieId;
@end
