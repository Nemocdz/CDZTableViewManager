//
//  ONEMMTableViewSection.h
//  Pods
//
//  Created by Nemocdz on 17/5/14.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CDZTableViewSection : NSObject

@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, copy) NSString *footerTitle;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;

@property (nonatomic, strong) NSMutableArray *items;

/**
 添加进items数组并设置item对应的cellClass，代替数组的addObject方法

 @param item 任意类型item
 @param cellClass 所对应的TableViewCell的Class
 */
- (void)addItem:(id<NSObject>)item cellClass:(Class)cellClass;
//返回item对应的CellClass
- (Class)cellClassForItem:(id<NSObject>)item;
//返回indexPath对应的CellClass
- (Class)cellClassIndexPath:(NSIndexPath *)indexPath;
//返回indexPath对应的Item
- (id)itemForIndexPath:(NSIndexPath *)indexPath;
@end
