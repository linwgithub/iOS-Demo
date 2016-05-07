//
//  ViewController.m
//  10_英雄展示
//
//  Created by 林威 on 16/5/7.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "ViewController.h"
#import "hero.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@property(nonatomic, strong)NSArray *heros;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSArray *)heros
{
    if (_heros == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *heroArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            hero *herodata = [hero heroWithDict:dict];
            [heroArray addObject:herodata];
        }
        _heros = heroArray;
    }
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    hero *heroData = self.heros[indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"数据展示" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert textFieldAtIndex:0].text = heroData.name;
    [alert show];
    alert.tag = indexPath.row;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0)
        return;
    NSLog(@"change data");
    //1、取出修改的数据
    NSString *name = [alertView textFieldAtIndex:0].text;
    //2、取出数据源
    int row = alertView.tag;
    hero *heroData = self.heros[row];
    NSLog(@"name:%@",name);
    //3、修改数据源
    heroData.name = name;
    NSLog(@"name:%@",heroData.name);
    
    //4、刷新列表
    //4.1全部属性
//    [self.table reloadData];
    //4.2部分刷新
//    NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
//    [self.table reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationAutomatic];
////
    NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
    [self.table reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationBottom];
}

@end
