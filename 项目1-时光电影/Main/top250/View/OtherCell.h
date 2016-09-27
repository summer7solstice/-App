//
//  OtherCell.h
//  项目1-时光电影
//
//  Created by Macx on 16/9/9.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Comment;
@interface OtherCell : UITableViewCell{
    
    __weak IBOutlet UIImageView *_imgView;
    __weak IBOutlet UILabel *_nicknameLabel;
    
    __weak IBOutlet UILabel *_ratingLabel;
    
    __weak IBOutlet UILabel *_contentLabel;
}

@property(nonatomic,strong)Comment *comment;
@end
