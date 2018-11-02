//
//  MyModel.m
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel
    
    - (instancetype)initWithDictionary:(NSDictionary *)dic
    {
        if (self = [super init]) {
            if ([dic isKindOfClass:[NSDictionary class]]) {
                [self setValuesForKeysWithDictionary:dic];
            }
        }
        return self;
    }
    
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
    {
        if ([key isEqualToString:@"id"]) {
            _ID = value;
        }
    }
    
- (id)valueForUndefinedKey:(NSString *)key
    {
        return nil;
    }

@end
