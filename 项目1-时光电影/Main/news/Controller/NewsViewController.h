//
//  NewsViewController.h
//  项目1-时光电影
//
//  Created by Macx on 16/8/26.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "MyViewController.h"

@interface NewsViewController : MyViewController
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;
//存放model的可变数组
@property(nonatomic,copy)NSMutableArray *modelArr;

@end
