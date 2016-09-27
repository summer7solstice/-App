//
//  TheaterViewController.h
//  项目1-时光电影
//
//  Created by Macx on 16/8/26.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "MyViewController.h"

@interface TheaterViewController : MyViewController<UITableViewDelegate,UITableViewDataSource>{
    
    __weak IBOutlet UITableView *_tableView;
}
@property(nonatomic,strong)NSMutableArray *data;
@end
