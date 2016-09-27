//
//  XJDataService.m
//  项目1-时光电影
//
//  Created by Macx on 16/8/28.
//  Copyright © 2016年 无限. All rights reserved.
//

#import "XJDataService.h"

@implementation XJDataService
+(instancetype)_requestData:(NSString *)fileName{
    NSString *filepath = [[NSBundle mainBundle]pathForResource:fileName ofType:NULL];
    
    NSData *data = [NSData dataWithContentsOfFile:filepath];
    
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    return json;
}
@end
