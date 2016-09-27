//
//  TheaterCell.h
//  项目1-时光电影
//
//  Created by Macx on 16/8/30.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Theater;
@interface TheaterCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *seatSupport;
@property (weak, nonatomic) IBOutlet UIButton *groupBuySupport;
@property (weak, nonatomic) IBOutlet UIButton *couponSupport;
@property (weak, nonatomic) IBOutlet UIButton *imaxSupport;


@property(nonatomic,strong)Theater *theater;
@end
