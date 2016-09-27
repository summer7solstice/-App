//
//  TheaterCell.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/30.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "TheaterCell.h"
#import "Theater.h"
@implementation TheaterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setTheater:(Theater *)theater{
    if (_theater != theater) {
        _theater = theater;
        
        _nameLabel.text = theater.name;
        _addressLabel.text = theater.address;
        _gradeLabel.text = theater.grade;
        _lowPriceLabel.text = theater.lowPrice;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
