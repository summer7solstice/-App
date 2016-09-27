//
//  PhotoCell.h
//  项目1-时光电影
//
//  Created by Macx on 16/8/30.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoScroll;
@interface PhotoCell : UICollectionViewCell
@property(nonatomic,strong)PhotoScroll *scrollView;
@property(nonatomic,strong)NSURL *url;
@end
