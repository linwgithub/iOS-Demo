//
//  ViewController.m
//  10_英雄展示
//
//  Created by 林威 on 16/5/7.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "ViewController.h"
#import "hero.h"

@interface ViewController ()<UITableViewDataSource>

@property(nonatomic, strong)NSArray *heros;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSArray *)heros
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
    
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *heroArray = [NSMutableArray array];
    for (NSDictionary *dict in dictArray) {
        hero *herodata = [hero heroWithDict:dict];
        [heroArray addObject:herodata];
    }
    _heros = heroArray;
    return _heros;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"heroCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    hero *heroData = self.heros[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:heroData.icon];
    cell.textLabel.text = heroData.name;
    
    cell.detailTextLabel.text = heroData.intro;
    return cell;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
