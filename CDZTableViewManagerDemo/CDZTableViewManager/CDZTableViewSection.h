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

- (void)addItem:(id<NSObject>)item cellClass:(Class)cellClass;
- (Class)cellClassForItem:(id<NSObject>)item;
- (Class)cellClassIndexPath:(NSIndexPath *)indexPath;
- (id)itemForIndexPath:(NSIndexPath *)indexPath;
@end
