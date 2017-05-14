//
//  TestBCell.m
//  CDZTableViewManagerDemo
//
//  Created by Nemocdz on 2017/5/14.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "TestBCell.h"
#import "TestItem.h"

@implementation TestBCell

- (void)configWithItem:(id<NSObject>)item{
    if ([item isMemberOfClass:[TestItem class]]) {
        TestItem *cellItem = (TestItem *)item;
        self.textLabel.text = cellItem.title;
    }
}

+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(id)item{
    return 44;
}

@end
