//
//  BaseCollectionView.h
//  项目1-时光电影
//
//  Created by Macx on 16/9/8.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property(nonatomic,strong)NSMutableArray *data;//接受数据的数组
@property(nonatomic,assign)NSInteger currentItem;//记录当前的item
@property(nonatomic,assign)CGFloat pageWidth;//设置页宽

@end
