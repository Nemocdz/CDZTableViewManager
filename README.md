# CDZTableViewManager
This is manager for tableView with static tableview cell.

## Installation

### Manual

Add "CDZTableViewManager" files to your project

### CocoaPods

Add ``pod 'CDZTableViewManager'`` in your Podfile

## Usage

```objective-c
#import "CDZTableViewSection.h"
#import "CDZTableViewManager.h"
```

First,Init  the manager. 

```objective-c
- (CDZTableViewManager *)tableViewManager{
    if (!_tableViewManager) {
        _tableViewManager = [[CDZTableViewManager alloc]initWithTableView:self.tableView delegate:self];
    }
    return _tableViewManager;
}
```

And Than,config and add sections.

```objective-c
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
```

``self.tableViewManager.sections = [self sections];``

If you want, do something at delegate.

```objective-c
#pragma mark - CDZTableViewManagerDelegate
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

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex{
    return 100;
}
```

## Articles

[iOS中通用的TableView和CollectionView DataSource和Cell](http://www.jianshu.com/p/1f7304634600)

[iOS打造一个静态Cell通用的TableViewManager](http://www.jianshu.com/p/eef40354104c)

## Requirements

iOS 8.0 Above

## Contact

- Open a issue
- QQ：757765420
- Email：nemocdz@gmail.com
- Weibo：[@Nemocdz](http://weibo.com/nemocdz)

## License

CDZTableViewManager is available under the MIT license. See the LICENSE file for more info.