//
//  WordViewController.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/29.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "WordViewController.h"

@interface WordViewController ()<UIWebViewDelegate>

@end

@implementation WordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight - 64)];
    
//    //加载网络url
//    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [_webView loadRequest:request];
//    
    [self.view addSubview:_webView];
    [self _loadData];
}
-(void)_loadData{
    //读取json数据
    NSDictionary *jsonDic = (NSDictionary *)[XJDataService _requestData:@"news_detail.json"];
    
    NSString *content = [jsonDic objectForKey:@"content"];//新闻内容
    NSString *source = [jsonDic objectForKey:@"source"];//新闻来源
    NSString *time = [jsonDic objectForKey:@"time"];//新闻时间
    NSString *author = [jsonDic objectForKey:@"author"];//新闻作者
    NSString *title = [jsonDic objectForKey:@"title"];//新闻标题
    
//    读取news.html
    NSString *fliePath = [[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:fliePath encoding:NSUTF8StringEncoding error:nil];
    
    
    //子标题 来源 时间
    NSString *subTitle = [NSString stringWithFormat:@"%@ %@",source,time];
    
    //编辑(作者)
    NSString *at = [NSString stringWithFormat:@"来自:%@",author];
    
    //拼接html文件
    NSString *htmlString = [NSString stringWithFormat:html,title,subTitle,content,at];
    
    
    [_webView loadHTMLString:htmlString baseURL:nil];
    
    //自适应
    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    
    //创建小菊花
    _activityIndicator= [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:_activityIndicator];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

//开始加载
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityIndicator startAnimating];
}
//完成加载
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityIndicator stopAnimating];
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
