//
//  MyTableViewCell.h
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 MyTableViewCellStyle  tableViewCell的单线隐藏与否
 
 - MyTableViewCellNoneStyle: 隐藏
 - MyTableViewCellSignleLineStyle: 不隐藏
 */
typedef NS_ENUM(NSUInteger, MyTableViewCellStyle) {
    MyTableViewCellNoneStyle,
    MyTableViewCellSignleLineStyle,
};

@interface MyTableViewCell : UITableViewCell
    
@property (nonatomic, strong) UIView *cellLine;//单线
@property (nonatomic, assign) MyTableViewCellStyle style;
@property (nonatomic, strong) UIView *baseView;

@end
