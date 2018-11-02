//
//  MyModel.h
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject

@property (nonatomic, copy) NSString *ID;
    
- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
