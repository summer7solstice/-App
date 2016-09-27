//
//  OtherCell.m
//  项目1-时光电影
//
//  Created by Macx on 16/9/9.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "OtherCell.h"
#import "Comment.h"
@implementation OtherCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    self.backgroundColor = [UIColor clearColor];
}
-(void)setComment:(Comment *)comment{
    if (_comment != comment) {
        _comment = comment;
        
        [_imgView sd_setImageWithURL:[NSURL URLWithString:comment.userImage]];
        _nicknameLabel.text = comment.nickname;
        _ratingLabel.text = comment.rating;
        _contentLabel.text = comment.content;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
