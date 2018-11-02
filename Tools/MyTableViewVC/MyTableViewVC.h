//
//  MyTableViewVC.h
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

#import "BaseViewController.h"

@interface MyTableViewVC : BaseViewController<UITableViewDelegate, UITableViewDataSource>
    
    @property (nonatomic, strong) UITableView *tableView;
    
    @property (nonatomic, strong) UIImageView *noDataImgView;//无数据背景图

@end
