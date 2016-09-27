//
//  NewsCell.h
//  项目1-时光电影
//
//  Created by Macx on 16/8/28.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *tipImgView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

@property(nonatomic,strong)NewsModel *model;
@end
