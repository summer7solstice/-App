//
//  PhotoViewController.h
//  项目1-时光电影
//
//  Created by Macx on 16/8/30.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoCollectionView;
@interface PhotoViewController : UIViewController{
    PhotoCollectionView *_collectionView;
    
    BOOL isHiden;
    
}
@property(nonatomic,strong)NSMutableArray *photoUrls;
@property(nonatomic,strong)NSIndexPath *indexPath;
@end
