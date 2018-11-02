//
//  MyTableViewReFreshVC.h
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

#import "MyTableViewVC.h"

@interface MyTableViewReFreshVC : MyTableViewVC
    
@property (nonatomic, strong) NSMutableArray *dataSource;//数据源
@property (nonatomic, assign) NSInteger page;
    
/**
 请求数据
*/
- (void)serviceData;
    
- (void)setUpData;
/**
请求数据成功后 刷新tableView
*/
- (void)refreshTableViewWithDataSource:(NSArray *)array;
    
- (void)layOutTableView;
    
@end
