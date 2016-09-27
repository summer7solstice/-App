//
//  TopViewController.h
//  项目1-时光电影
//
//  Created by Macx on 16/8/26.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "MyViewController.h"

@interface TopViewController : MyViewController
{
    __weak IBOutlet UICollectionView *_collectionView;
    //model数组
    NSMutableArray *_modelArr;
}
@end
