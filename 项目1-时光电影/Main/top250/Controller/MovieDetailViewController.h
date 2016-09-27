//
//  MovieDetailViewController.h
//  项目1-时光电影
//
//  Created by Macx on 16/9/9.
//  Copyright © 2016年 无限. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieDetailTableView;
@interface MovieDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    __weak IBOutlet UITableView *_tableView;
    
    
    
}

@property(nonatomic,strong)NSMutableArray *detailData;
@property(nonatomic,strong)NSMutableArray *commentData;
@property(nonatomic,assign)NSIndexPath *myIndex;
@end
