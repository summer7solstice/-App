//
//  Comment.h
//  项目1-时光电影
//
//  Created by Macx on 16/9/9.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <Foundation/Foundation.h>
//"userImage" : "http://img2.mtime.com/images/default/head.gif",
//"nickname" : "yangna988",
//"rating" : "9.0",
//"content" : "儿子很喜欢 一直期盼上映"
@interface Comment : NSObject
@property(nonatomic,copy)NSString *userImage;
@property(nonatomic,copy)NSString *nickname;
@property(nonatomic,copy)NSString *rating;
@property(nonatomic,copy)NSString *content;
@end
