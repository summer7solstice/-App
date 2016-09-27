//
//  MovieDetailViewController.m
//  项目1-时光电影
//
//  Created by Macx on 16/9/9.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "TopMovie.h"
#import "Comment.h"
#import "OtherCell.h"
@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _requestData];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];

}


-(void)_requestData{
    _detailData = [NSMutableArray array];
    _commentData = [NSMutableArray array];
    
    NSDictionary *detailDic = (NSDictionary *)[XJDataService _requestData:@"movie_detail.json"];
    TopMovie *topMovie = [[TopMovie alloc]init];
    //firstCell
    topMovie.image = [detailDic objectForKey:@"image"];
    topMovie.titleCn = [detailDic objectForKey:@"titleCn"];
    topMovie.directors = [detailDic objectForKey:@"directors"];
    topMovie.content = [detailDic objectForKey:@"content"];
    
    //secondCell
    topMovie.secImages = [detailDic objectForKey:@"images"];
    topMovie.videos = [detailDic objectForKey:@"videos"];
    [_detailData addObject:topMovie];
    
    
    NSDictionary *commentDic = (NSDictionary*)[XJDataService _requestData:@"movie_comment.json"];
    NSArray *list = [commentDic objectForKey:@"list"];
    
    for (NSDictionary *dic in list) {
        Comment *comment = [[Comment alloc]init];
        
        comment.userImage = [dic objectForKey:@"userImage"];
        comment.rating = [dic objectForKey:@"rating"];
        comment.nickname = [dic objectForKey:@"nickname"];
        comment.content = [dic objectForKey:@"content"];
        
        [_commentData addObject:comment];
    }
    
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 150;
    }else if (indexPath.row == 1){
        return 85;
    }else if ([_myIndex isEqual:indexPath]){
        Comment *comment = self.commentData[indexPath.row - 2];
        
        NSString *text = comment.content;
        
        CGRect rect = [text boundingRectWithSize:CGSizeMake(230, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        
        
        return MAX(CGRectGetHeight(rect) + 45, 85);
    }
    else return 85;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.myIndex == indexPath) {
//        NSIndexPath *path = [NSIndexPath indexPathForItem:self.commentData.count + 3 inSection:0];
//        self.myIndex = path;
//    }else{
    
    self.myIndex = indexPath;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
}
#pragma mark - dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _commentData.count + 2;
}
//cell创建
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstCell" forIndexPath:indexPath];
        TopMovie *topMovie = self.detailData[0];
        UIImageView *imgView = (UIImageView *)[cell.contentView viewWithTag:101];
        [imgView sd_setImageWithURL:[NSURL URLWithString:topMovie.image]];
        UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:102];
        titleLabel.text = topMovie.titleCn;
        UILabel *directorLabel = (UILabel *)[cell.contentView viewWithTag:103];
        directorLabel.text = topMovie.directors[0];
        UITextView *contentTextView = (UITextView *)[cell.contentView viewWithTag:104];
        contentTextView.text = topMovie.content;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecondCell" forIndexPath:indexPath];
        TopMovie *topMovie = self.detailData[0];
//        UIButton *btn1 = (UIButton*)[cell.contentView viewWithTag:201];
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:topMovie.secImages[0]]];
//        [btn1 setImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
//        [btn1.imageView sd_setImageWithURL:[NSURL URLWithString:topMovie.secImages[0]]];
        UIImageView *img1 = (UIImageView *)[cell.contentView viewWithTag:201];
        [img1 sd_setImageWithURL:topMovie.secImages[0]];
        UIImageView *img2 = (UIImageView*)[cell.contentView viewWithTag:202];
        [img2 sd_setImageWithURL:[NSURL URLWithString:topMovie.secImages[1]]];
        UIImageView *img3 = (UIImageView*)[cell.contentView viewWithTag:203];
        [img3 sd_setImageWithURL:[NSURL URLWithString:topMovie.secImages[2]]];
        UIImageView *img4 = (UIImageView*)[cell.contentView viewWithTag:204];
        [img4 sd_setImageWithURL:[NSURL URLWithString:topMovie.secImages[3]]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        OtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OtherCell" forIndexPath:indexPath];
        cell.comment = self.commentData[indexPath.row - 2];
        return cell;
    }
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
