//
//  ViewController.m
//  CDZTableViewManagerDemo
//
//  Created by Nemocdz on 2017/5/14.
//  Copyright © 2017年 Nemocdz. All rights reserved.
//

#import "ViewController.h"
#import "CDZTableViewSection.h"
#import "CDZTableViewManager.h"
#import "TestACell.h"
#import "TestBCell.h"
#import "TestItem.h"

@interface ViewController ()<CDZTableViewManagerDelegate>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) CDZTableViewManager *tableViewManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewManager.sections = [self sections];
    [self.view addSubview:self.tableView];
}


- (NSMutableArray <CDZTableViewSection *>*)sections{
    NSMutableArray <CDZTableViewSection *> *sections = [NSMutableArray array];
    CDZTableViewSection *firstSection = [[CDZTableViewSection alloc]init];
    

    
    NSString *itemA = @"itemA";
    [firstSection addItem:itemA cellClass:[TestACell class]];
    
    NSDictionary *itemB = @{@"title" : @"itemB"};
    [firstSection addItem:itemB cellClass:[TestACell class]];
    
    
    TestItem *itemC = [[TestItem alloc]init];
    itemC.title = @"itemC";
    itemC.tapBlock = ^(TestItem *item) {
        NSLog(@"%@ tap",item.title);
    };
    [firstSection addItem:itemC cellClass:[TestBCell class]];

    
    TestItem *itemD = [[TestItem alloc]init];
    itemD.title = @"itemD";
    itemD.tapBlock = ^(TestItem *item) {
        NSLog(@"%@ tap",item.title);
    };
    [firstSection addItem:itemD cellClass:[TestBCell class]];

    
    
    [sections addObject:firstSection];
    return sections;
}

- (void)tableView:(UITableView *)tableView didSelectItem:(id)item atIndexPath:(NSIndexPath *)indexPath{
    if ([item isMemberOfClass:[TestItem class]]) {
        TestItem *cellItem = (TestItem *)item;
        if (cellItem.tapBlock) {
            cellItem.tapBlock(cellItem);
        }
    }
}

- (void)receiveCellMessage:(id)message atIndexPath:(NSIndexPath *)indexPath item:(id)item{
    if ([[self.tableViewManager tableView:self.tableViewManager.tableView cellForItem:item] isMemberOfClass:[TestACell class]]) {
        NSLog(@"%@",message);
    }
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tableView;
}

- (CDZTableViewManager *)tableViewManager{
    if (!_tableViewManager) {
        _tableViewManager = [[CDZTableViewManager alloc]initWithTableView:self.tableView delegate:self];
    }
    return _tableViewManager;
}

@end
