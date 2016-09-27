//
//  NewsCell.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/28.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(NewsModel *)model{
    _model = model;
    _summaryLabel.transform = CGAffineTransformIdentity;
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.image]]];
    _titleLabel.text = model.title;
    _summaryLabel.text = model.summary;
    
    NSInteger tp = [model.type integerValue];
    if (tp == 0) {
        _tipImgView.hidden = YES;
        CGRect frame1 = _tipImgView.frame;
        CGRect frame2 = _summaryLabel.frame;
        _summaryLabel.transform = CGAffineTransformMakeTranslation(frame1.origin.x - frame2.origin.x, 0);
        
    }else if (tp == 1){
        _tipImgView.hidden = NO;
        _tipImgView.image = [UIImage imageNamed:@"sctpxw@2x"];
    }else if (tp == 2){
        _tipImgView.hidden = NO;
        _tipImgView.image = [UIImage imageNamed:@"scspxw@2x"];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
