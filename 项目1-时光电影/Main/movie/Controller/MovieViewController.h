//
//  MovieViewController.h
//  项目1-时光电影
//
//  Created by Macx on 16/8/26.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "MyViewController.h"
@class PosterView;
@interface MovieViewController : MyViewController{
    NSMutableArray *_data;
    UITableView *_listView;
    PosterView *_postView;
}

@end
