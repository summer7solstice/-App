//
//  MyTabBarController.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/25.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "MyTabBarController.h"
#import "MyTabBarItem.h"
@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tab_bg_all"];
    
}
//storyboard创建时,需要在viewWillappear中删除原有TabBar
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //自定义标签栏
    [self _createTabBar];

}
-(void)_createTabBar{
    //删除旧标签栏
    for (UIView *view in self.tabBar.subviews) {
        Class btnItem = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:btnItem]) {
            [view removeFromSuperview];
        }
    }
    
    //创建图片名,标签名数组
    NSArray *imgArr = @[@"movie_home",@"msg_new",@"start_top250@2x",@"icon_cinema",@"more_setting"];
    NSArray *titleArr = @[@"电影",@"新闻",@"top250",@"影院",@"更多"];
    
    //button宽与长
    CGFloat buttonWidth = KScreenWidth / imgArr.count;
    CGFloat buttonHeight = self.tabBar.frame.size.height;
    
    //选中时的暗框视图
    if (_selectedImage == nil) {
        _selectedImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"selectTabbar_bg_all1"]];
        _selectedImage.frame = CGRectMake(0, 0, 56, 48);
        _selectedImage.alpha = .55;
        [self.tabBar addSubview:_selectedImage];
        
    }
    
    //循环创建添加buttonItem
    for (NSInteger i = 0; i < imgArr.count; i ++) {
        NSString *imgName = imgArr[i];
        NSString *title = titleArr[i];
        
        CGRect frame = CGRectMake(buttonWidth * i, 0, buttonWidth, buttonHeight);
        
        MyTabBarItem *item = [[MyTabBarItem alloc]initWithFrame:frame imageName:imgName title:title];
        
        //tag
        item.tag = i + 100;
        
        [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //初始化放置_selectedImage的位置
        if (i == 0) {
            _selectedImage.center = item.center;
        }
        [self.tabBar addSubview:item];
    }
}
//点击事件
-(void)itemAction:(MyTabBarItem *)item{
    self.selectedIndex = item.tag - 100;
    [UIView animateWithDuration:.2 animations:^{
        _selectedImage.center = item.center;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
