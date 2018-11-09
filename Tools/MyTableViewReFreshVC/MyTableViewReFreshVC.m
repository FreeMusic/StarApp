//
//  MyTableViewReFreshVC.m
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

#import "MyTableViewReFreshVC.h"
#import "MJRefresh.h"

@interface MyTableViewReFreshVC ()

@end

@implementation MyTableViewReFreshVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    [self.view addSubview:self.tableView];
    //请求数据
    [self serviceData];
    self.navigationController.navigationBar.translucent = NO;
}
/**
 数据源
 */
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
/**
 请求数据
 */
- (void)serviceData{
    __weak typeof(self) weakSelf = self;
    //仿微博的下拉刷新
    self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        [self setUpData];
        // 结束刷新
        [weakSelf.tableView.mj_header endRefreshing];
    }];
    [self setUpData];
    // 上拉刷新
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page++;
        [weakSelf setUpData];
    }];
    // 默认先隐藏footer
    self.tableView.mj_footer.hidden = NO;
}

#pragma  UITableViewDataSource---numberOfRowsInSection
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

#pragma mark - 消息数据
-(void)setUpData{
    
}
/**
 请求数据成功后 刷新tableView
 */
- (void)refreshTableViewWithDataSource:(NSArray *)array{
    if (self.page==1) {
        self.dataSource = [NSMutableArray arrayWithArray:array];
        
        self.noDataImgView.hidden = !(self.dataSource.count == 0);
    }else{
        [self.dataSource addObjectsFromArray:array];
        
        self.noDataImgView.hidden = YES;
    }
    
    [self.tableView reloadData];
    
    if (array.count){
        [self.tableView.mj_footer endRefreshing];//有数据可以加载
    }else{
        [self.tableView.mj_footer endRefreshingWithNoMoreData];//没有数据可以加载
    }
}

- (void)layOutTableView{
    //    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    //    }];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // 结束刷新
    [self.tableView.mj_header endRefreshing];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

@end
