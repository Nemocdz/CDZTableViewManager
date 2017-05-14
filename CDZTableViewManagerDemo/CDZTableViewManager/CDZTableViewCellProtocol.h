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

/**
 Cell内部触发传递给外界的Delegate，可以传递任意信息，和外界约定格式即可

 @param cell 发消息的Cell
 @param message 传递的信息
 */
- (void)didTriggleCell:(UITableViewCell*)cell message:(id)message;
@end

@protocol CDZTableViewCell<NSObject>
@required
//根据item解析并绘制Cell
- (void)configWithItem:(id<NSObject>)item;
//item对应的Cell的高度
+ (CGFloat)tableView:(UITableView *)tableView rowHeightForItem:(id)item;
@optional
//设置cell的Delegate
- (void)setCDZCellDelegate:(id<CDZTableViewCellDelegate>)objectDelegate;
@end


