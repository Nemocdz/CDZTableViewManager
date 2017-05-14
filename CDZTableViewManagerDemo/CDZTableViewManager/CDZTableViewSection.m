//
//  ONEMMTableViewSection.m
//  Pods
//
//  Created by Nemocdz on 17/5/14.
//
//

#import "CDZTableViewSection.h"

@interface CDZTableViewSection()
@property (nonatomic, strong) NSMutableDictionary *sectionCellDic;
@end
@implementation CDZTableViewSection
- (instancetype)init {
    if (self = [super init]) {
        _headerTitle = @"";
        _items = [NSMutableArray array];
    }
    return self;
}

- (void)addItem:(id<NSObject>)item cellClass:(Class)cellClass{
    if (!item) {
        return;
    }
    [_items addObject:item];
    if (!cellClass) {
        return;
    }
    NSString *itemHash = [NSString stringWithFormat:@"%tu",item.hash];
    [self.sectionCellDic setObject:cellClass forKey:itemHash];
}

- (NSMutableDictionary *)sectionCellDic{
    if (!_sectionCellDic) {
        _sectionCellDic = [NSMutableDictionary dictionary];
    }
    return _sectionCellDic;
}

- (Class)cellClassIndexPath:(NSIndexPath *)indexPath{
    return [self cellClassForItem:[self itemForIndexPath:indexPath]];
}

- (Class)cellClassForItem:(id<NSObject>)item{
    NSString *itemHash = [NSString stringWithFormat:@"%tu",item.hash];
    Class cellClass = [self.sectionCellDic objectForKey:itemHash];
    return cellClass;
}

- (id)itemForIndexPath:(NSIndexPath *)indexPath{
    if (self.items.count > indexPath.row) {
        return self.items[indexPath.row];
    }
    return nil;
}

@end
