//
//  ONEMMTableViewManager.m
//  Pods
//
//  Created by Nemocdz on 17/5/14.
//
//

#import "CDZTableViewManager.h"
#import "CDZTableViewSection.h"

@implementation CDZTableViewManager

- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<CDZTableViewManagerDelegate>)objectDelegate{
    self = [super init];
    if (self){
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _sections = [NSMutableArray array];
        _delegate = objectDelegate;
        self.tableView = tableView;
    }
    return self;
}


- (id)tableView:(UITableView *)tableView itemForRowAtIndexPath:(NSIndexPath *)indexPath{
    CDZTableViewSection *sectionObject = [self tableView:tableView sectionObjectForRowAtIndexPath:indexPath];
    id item = [sectionObject itemForIndexPath:indexPath];
    if (item) {
        return item;
    }
    return nil;
}

- (CDZTableViewSection *)tableView:(UITableView *)tableView sectionObjectForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.sections.count > indexPath.section) {
        return self.sections[indexPath.section];
    }
    return nil;
}

- (Class)tableView:(UITableView *)tableView cellClassForRowAtIndexPath:(NSIndexPath *)indexPath{
    CDZTableViewSection *sectionObject = [self tableView:tableView sectionObjectForRowAtIndexPath:indexPath];
    Class cellClass = [sectionObject cellClassIndexPath:indexPath];
    if (!cellClass) {
        cellClass = [UITableViewCell class];
    }
    return cellClass;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForItem:(id)item{
    NSIndexPath *indexPath = [self tableView:tableView indexPathForItem:item];
    if (indexPath) {
        return [tableView cellForRowAtIndexPath:indexPath];
    }
    return nil;
}

- (NSIndexPath *)tableView:(UITableView *)tableView indexPathForItem:(id)item{
    __block NSIndexPath *indexPath;
    [self.sections enumerateObjectsUsingBlock:^(CDZTableViewSection * _Nonnull sectionObj, NSUInteger section, BOOL * _Nonnull stop) {
        NSInteger row = [sectionObj.items indexOfObject:item];
        if (row != NSNotFound) {
            indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            *stop = YES;
            return;
        }
    }];
    return indexPath;
}

- (void)didTriggleCell:(UITableViewCell *)cell message:(id)message{
    if ([self.delegate respondsToSelector:@selector(receiveCellMessage:atIndexPath:item:)]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        id item = [self tableView:self.tableView itemForRowAtIndexPath:indexPath];
        [self.delegate receiveCellMessage:message atIndexPath:indexPath item:item];
    }
}


#pragma mark - Table DataSource & Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Class cellClass = [self tableView:tableView cellClassForRowAtIndexPath:indexPath];
    UITableViewCell<CDZTableViewCell> *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass)];
    if (!cell) {
        cell = [[cellClass alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(cellClass)];
    }
    if ([cell respondsToSelector:@selector(setCDZCellDelegate:)]){
        [cell setCDZCellDelegate:self];
    }
    if ([cell respondsToSelector:@selector(configWithItem:)]) {
        [cell configWithItem:[self tableView:tableView itemForRowAtIndexPath:indexPath]];
    }
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.sections.count > section) {
        return self.sections[section].items.count;
    }
    return 0;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sections ? self.sections.count : 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        return [self.delegate tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    Class cellClass = [self tableView:tableView cellClassForRowAtIndexPath:indexPath];
    id item = [self tableView:tableView itemForRowAtIndexPath:indexPath];
    return (cellClass == [UITableViewCell class])?44.f:[cellClass tableView:tableView rowHeightForItem:item];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex{
    if ([self.delegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)]) {
        return [self.delegate tableView:tableView heightForHeaderInSection:sectionIndex];
    }
    if (self.sections.count > sectionIndex) {
        CDZTableViewSection *section = self.sections[sectionIndex];
        if (section.headerView){
            return CGRectGetHeight(section.headerView.frame);
        }
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex{
    if ([self.delegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
        return [self.delegate tableView:tableView viewForHeaderInSection:sectionIndex];
    }
    if (self.sections.count > sectionIndex) {
        CDZTableViewSection *section = self.sections[sectionIndex];
        return section.headerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)sectionIndex{
    if ([self.delegate respondsToSelector:@selector(tableView:heightForFooterInSection:)]) {
        return [self.delegate tableView:tableView heightForFooterInSection:sectionIndex];
    }
    if (self.sections.count > sectionIndex) {
        CDZTableViewSection *section = self.sections[sectionIndex];
        if (section.footerView){
            return CGRectGetHeight(section.footerView.frame);
        }
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)sectionIndex{
    if ([self.delegate respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
        return [self.delegate tableView:tableView viewForFooterInSection:sectionIndex];
    }
    if (self.sections.count > sectionIndex) {
        CDZTableViewSection *section = self.sections[sectionIndex];
        return section.headerView;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(tableView:willDisplayCell:forRowAtIndexPath:)]) {
        [self.delegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
    CDZTableViewSection *section = [self tableView:tableView sectionObjectForRowAtIndexPath:indexPath];
    if (indexPath.row == section.items.count - 1){
        cell.separatorInset = UIEdgeInsetsMake(0,  CGRectGetWidth([UIScreen mainScreen].bounds), 0, 0);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(tableView:didSelectItem:atIndexPath:)]) {
        id item = [self tableView:tableView itemForRowAtIndexPath:indexPath];
        [self.delegate tableView:tableView didSelectItem:item atIndexPath:indexPath];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    else if ([self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.delegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}


@end
