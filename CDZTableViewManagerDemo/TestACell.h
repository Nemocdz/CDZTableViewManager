//
//  TestACell.h
//  CDZTableViewManagerDemo
//
//  Created by Nemocdz on 2017/5/14.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDZTableViewCellProtocol.h"

@interface TestACell : UITableViewCell<CDZTableViewCell>
@property (nonatomic ,weak) id<CDZTableViewCellDelegate> delegate;
@end
