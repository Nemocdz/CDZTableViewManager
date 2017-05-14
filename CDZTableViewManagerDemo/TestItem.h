//
//  TestItem.h
//  CDZTableViewManagerDemo
//
//  Created by Nemocdz on 2017/5/14.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) void (^tapBlock)(TestItem *item);

@end
