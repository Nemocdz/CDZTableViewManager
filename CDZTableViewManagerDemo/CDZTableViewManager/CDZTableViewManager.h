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

/**
 点击Cell时的Delegate，在原生的基础上加上了Item

 @param tableView tableView
 @param item 对应的item
 @param indexPath 对应的indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectItem:(id)item atIndexPath:(NSIndexPath *)indexPath;

/**
 cell内部的回调，message携带传递的信息，message格式为cell内部和外部规定一套逻辑

 @param message 传递的信息
 @param indexPath 点击的indexPath
 @param item 对应的Item
 */
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
/**
 sectionObject数组，真正的Item放在每个SectionObject中，sectionObject详见CDZTableViewSection
 */
@property (nonatomic, strong) NSMutableArray<CDZTableViewSection *> *sections;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) id<CDZTableViewManagerDelegate>delegate;

/**
 初始化方法，传入接管的tableView

 @param tableView 接管的tableView
 @param objectDelegate 实现Delegate的
 @return manager
 */
- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<CDZTableViewManagerDelegate>)objectDelegate;

//返回indexPath对应的item
- (id)tableView:(UITableView *)tableView itemForRowAtIndexPath:(NSIndexPath *)indexPath;
//返回indexPath对应item对应的Cell的Class
- (Class)tableView:(UITableView *)tableView cellClassForRowAtIndexPath:(NSIndexPath *)indexPath;
//返回item对应的Cell实例
- (UITableViewCell *)tableView:(UITableView *)tableView cellForItem:(id)item;
//返回item对应的indexPath
- (NSIndexPath *)tableView:(UITableView *)tableView indexPathForItem:(id)item;

@end
