//
//  ViewController.m
//  11-团购
//
//  Created by 林威 on 16/5/8.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "ViewController.h"
#import "Tg.h"
#import "TgCell.h"

@interface ViewController ()<UITableViewDataSource>

@property(nonatomic, strong)NSMutableArray *tgs;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.rowHeight = 80;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

-(NSArray *)tgs
{
    if (_tgs == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"tgs.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tgArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            Tg *tg = [Tg tgWithDict:dict];
            [tgArray addObject:tg];
        }
        _tgs = tgArray;
    }
    return _tgs;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TgCell *cell = [TgCell tgCellWithTableView:self.tableView];
    cell.tg = self.tgs[indexPath.row];
    return cell;
}

@end
