//
//  ONEMMTableViewCellProtocol.h
//  Pods
//
//  Created by Nemocdz on 2017/4/25.
//
//

#import <Foundation/Foundation.h>

@protocol CDZTableViewCellDelegate <NSObject>
@optional
- (void)didTriggleCell:(UITableViewCell*)cell message:(id)message;
@end

@protocol CDZTableViewCell<NSObject>
@required
- (void)configWithItem:(id<NSObject>)item;
+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(id)item;
@optional
- (void)setCDZCellDelegate:(id<CDZTableViewCellDelegate>)objectDelegate;
@end


