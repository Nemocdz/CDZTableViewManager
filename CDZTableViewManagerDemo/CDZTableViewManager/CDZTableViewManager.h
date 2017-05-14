//
//  ONEMMTableViewManager.h
//  Pods
//
//  Created by Nemocdz on 17/5/14.
//
//

#import <UIKit/UIKit.h>
#import "CDZTableViewCellProtocol.h"

@class CDZTableViewSection;
@protocol CDZTableViewManagerDelegate <UITableViewDelegate>
@optional
- (void)tableView:(UITableView *)tableView didSelectItem:(id)item atIndexPath:(NSIndexPath *)indexPath;
- (void)receiveCellMessage:(id)message atIndexPath:(NSIndexPath *)indexPath item:(id)item;
//原生协议
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)sectionIndex;
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)sectionIndex;
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex;
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface CDZTableViewManager : NSObject <UITableViewDelegate, UITableViewDataSource,CDZTableViewCellDelegate>

@property (nonatomic, strong) NSMutableArray<CDZTableViewSection *> *sections;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) id<CDZTableViewManagerDelegate>delegate;

- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<CDZTableViewManagerDelegate>)objectDelegate;
- (id)tableView:(UITableView *)tableView itemForRowAtIndexPath:(NSIndexPath *)indexPath;
- (Class)tableView:(UITableView *)tableView cellClassForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForItem:(id)item;
- (NSIndexPath *)tableView:(UITableView *)tableView indexPathForItem:(id)item;

@end
