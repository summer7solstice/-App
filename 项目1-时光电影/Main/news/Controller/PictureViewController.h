//
//  PictureViewController.h
//  项目1-时光电影
//
//  Created by Macx on 16/8/29.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *modelArr;
@end
