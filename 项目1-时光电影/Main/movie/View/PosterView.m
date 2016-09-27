//
//  PosterView.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/31.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "PosterView.h"
#import "PosterCollectionView.h"
#import "MiniPosterCollectionView.h"
#import "Movie.h"
#define KHeaderViewHeight 100
#define KFooterViewHeight 35//尾部视图的高度
@implementation PosterView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //创建头视图
        [self _createHeaderView];
        [self _createFooterView];
        //创建遮盖视图
        _maskView = [[UIControl alloc]initWithFrame:self.bounds];
        _maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:.45];
        _maskView.hidden = YES;
        [_maskView addTarget:self action:@selector(_maskTap:) forControlEvents:UIControlEventTouchUpInside];
        [self insertSubview:_maskView belowSubview:_headerView];
        
        //创建collectionView
        [self _createCollectionView];
        //创建上方小collecView
        [self _createMiniCollectionView];
        
        //KVO观察对象
        [_collectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
        
        [_miniCollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
        
    }
    return self;
}
#pragma mark - KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"currentItem"]) {
        NSNumber *newValue = [change objectForKey:@"new"];
        NSInteger item = [newValue integerValue];
        
        if (object == _collectionView && _miniCollectionView.currentItem != item) {
            _miniCollectionView.currentItem = item;
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            
            [_miniCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }else if (object == _miniCollectionView && _collectionView.currentItem != item){
            _collectionView.currentItem = item;
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            
            [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        //title随之改变
        Movie *movie = _modelArr[item];
        _footerLabel.text = movie.title;
    }
}
#pragma mark - collectionView创建
-(void)_createCollectionView{
    _collectionView = [[PosterCollectionView alloc]initWithFrame:CGRectMake(0, 64 + 30, KScreenWidth, self.height - 30 - 64 - 49 - KFooterViewHeight)];
    
    _collectionView.pageWidth = 220;

    [self insertSubview:_collectionView belowSubview:_maskView];
}
-(void)_createMiniCollectionView{
    _miniCollectionView = [[MiniPosterCollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KHeaderViewHeight)];
    
        _miniCollectionView.pageWidth = 70;
    [_headerView addSubview:_miniCollectionView];
}
-(void)setModelArr:(NSMutableArray *)modelArr{
    if (_modelArr != modelArr) {
        _modelArr = modelArr;
        [_collectionView setData:modelArr];
        
        [_miniCollectionView setData:modelArr];
        if (_modelArr.count > 0) {
            Movie *movie = _modelArr[0];
            _footerLabel.text = movie.title;
        }
    }
}
#pragma mark - 尾视图创建
-(void)_createFooterView{
    _footerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.height - KFooterViewHeight - 49, KScreenWidth, KFooterViewHeight)];
    
    [_footerLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]]];
    _footerLabel.textAlignment = NSTextAlignmentCenter;
    _footerLabel.textColor = [UIColor whiteColor];
    
    
    [self addSubview:_footerLabel];
}
#pragma mark - 头视图创建
-(void)_createHeaderView{
    //创建
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64 - KHeaderViewHeight, KScreenWidth, 130)];
    _headerView.backgroundColor = [UIColor clearColor];
    [self addSubview:_headerView];
    
    //创建一个ImageView
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 130)];
    
    UIImage *img = [UIImage imageNamed:@"indexBG_home"];
    //拉伸
    img = [img stretchableImageWithLeftCapWidth:0 topCapHeight:2];
    imgView.image = img;
    
    [_headerView addSubview:imgView];
    
    //创建箭头按钮
    UIButton *arrowsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    arrowsButton.frame = CGRectMake(0, 0, 26, 20);
    arrowsButton.center = CGPointMake(KScreenWidth/2 + 3, 120);
    
    arrowsButton.tag = 123;
    [arrowsButton setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [arrowsButton setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    
    [arrowsButton addTarget:self action:@selector(_arrowsBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_headerView addSubview:arrowsButton];
    
    //添加滑动手势
    UISwipeGestureRecognizer *swipDown = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(_show)];
    swipDown.direction = UISwipeGestureRecognizerDirectionDown;
    [_headerView addGestureRecognizer:swipDown];
    
    UISwipeGestureRecognizer *swipUp = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(_hide)];
    swipUp.direction = UISwipeGestureRecognizerDirectionUp;
    [_headerView addGestureRecognizer:swipUp];
    
}


#pragma mark - 点击事件
-(void)_arrowsBtnAction:(UIButton *)btn{
//    btn.selected = !btn.selected;
    if (btn.selected == NO) {
        [self _show];
        //已经将btn.selected取反写进show hide 方法里
    }else{
        [self _hide];
    }
}
-(void)_maskTap:(UIControl*)mask{
    [self _hide];

}
-(void)_show{
    [UIView animateWithDuration:.3 animations:^{
        _headerView.transform = CGAffineTransformMakeTranslation(0, KHeaderViewHeight);
        
        UIButton *arrowsButton = (UIButton*)[_headerView viewWithTag:123];
        arrowsButton.selected = ! arrowsButton.selected;
    }];
    _maskView.hidden = NO;
}
-(void)_hide{
    [UIView animateWithDuration:.3 animations:^{
        _headerView.transform = CGAffineTransformIdentity;
        
        UIButton *arrowsButton = (UIButton*)[_headerView viewWithTag:123];
        arrowsButton.selected = ! arrowsButton.selected;
    }];
    _maskView.hidden = YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
