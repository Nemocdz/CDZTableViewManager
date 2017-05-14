//
//  TestACell.m
//  CDZTableViewManagerDemo
//
//  Created by Nemocdz on 2017/5/14.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "TestACell.h"

@implementation TestACell

- (void)setCDZCellDelegate:(id<CDZTableViewCellDelegate>)objectDelegate{
    _delegate = objectDelegate;
}

- (void)configWithItem:(id<NSObject>)item{
    if ([item isKindOfClass:[NSString class]]) {
        NSString *title = (NSString *)item;
        self.textLabel.text = title;
    }
    else if ([item isKindOfClass:[NSDictionary class]]){
        NSDictionary *cellDic = (NSDictionary *)item;
        self.textLabel.text = cellDic[@"title"];
        self.contentView.backgroundColor = [UIColor blueColor];
    }
}


+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(id)item{
    if ([item isKindOfClass:[NSDictionary class]]) {
        return 70;
    }
    return 50;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    if (selected) {
        [self.delegate didTriggleCell:self message:@"selected"];
    }
}


@end
