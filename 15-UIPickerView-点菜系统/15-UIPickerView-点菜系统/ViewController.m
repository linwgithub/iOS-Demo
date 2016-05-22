//
//  ViewController.m
//  15-UIPickerView-点菜系统
//
//  Created by 林威 on 16/5/22.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (weak, nonatomic) IBOutlet UILabel *maindeal;
@property (weak, nonatomic) IBOutlet UILabel *fruit;

@property (weak, nonatomic) IBOutlet UILabel *drink;

@property (strong, nonatomic) NSArray *footsArray;

@end

@implementation ViewController

/**
 *  随机选中
 */
- (IBAction)random:(id)sender {
    for (int component = 0; component < self.footsArray.count; component++) {
        //获取每一列的数量
        NSInteger count = [self.footsArray[component] count];

        //获取原来选中的项
        NSInteger oldRow = [self.pickerView selectedRowInComponent:component];
        //设置新的选中项
        int row = arc4random()%count;
        while (row == oldRow) {
            //设置随机数
            row = arc4random() % count;
        }
        
        //使pickerView选中这一项
        [self.pickerView selectRow:row inComponent:component animated:YES];
        //label显示这一项
        [self pickerView:nil didSelectRow:row inComponent:component];
    }
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSArray *)footsArray
{
    if (_footsArray == nil) {
        _footsArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"foods.plist" ofType:nil]];
    }
    return _footsArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置默认选中每一项的第一个
    for (int i = 0; i < self.footsArray.count; i++) {
        [self pickerView:nil didSelectRow:0 inComponent:i];
    }
}

#pragma mark 实现数据源方法
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.footsArray.count;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *foods = self.footsArray[component];
    return foods.count;
}

#pragma mark 代理方法
/**
 *  返回每一项的内容
 */
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *foods = self.footsArray[component];
    return  foods[row];
}

/**
 *  选中某一项
 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        self.fruit.text = self.footsArray[component][row];
    }else if(component == 1){
        self.maindeal.text = self.footsArray[component][row];
    }else if(component == 2){
        self.drink.text = self.footsArray[component][row];
    }
}
@end
