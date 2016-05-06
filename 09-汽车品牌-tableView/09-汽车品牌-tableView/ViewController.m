//
//  ViewController.m
//  09-汽车品牌-tableView
//
//  Created by linw on 16/5/4.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "CarGroup.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *groups;

@end

@implementation ViewController

//加载数据
- (NSArray *)groups
{
    if (_groups == nil) {
    
        NSString *path = [[NSBundle mainBundle]pathForResource:@"cars_total" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *groupsArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            CarGroup *group = [CarGroup carGroupWithDict:dict];
            [groupsArray addObject:group];
        }
        _groups = groupsArray;
    }
    return _groups;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

//返回每个分组的条目数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CarGroup *group = self.groups[section];
    return group.cars.count;
}

//实现每个条目额细节
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1、定义标示
    static NSString *ID = @"carId";
    
    //2、从缓存池中取出可循环利用cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //3、缓存池中没有可循环利用的cell时，重新创建cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    //4、设置数据
    //4.1取出数据
    CarGroup *group = self.groups[indexPath.section];
    Car *car = group.cars[indexPath.row];
    //4.2设置数据
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    return cell;
}


@end
