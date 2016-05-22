//
//  FlagsViewController.m
//  15-UIPickerView-点菜系统
//
//  Created by 林威 on 16/5/22.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "FlagsViewController.h"
#import "Flags.h"
#import "FlagView.h"

@interface FlagsViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *countryPicker;

@property (weak, nonatomic) IBOutlet UILabel *countryLabel;

@property (nonatomic, strong)NSArray *flags;

@end

@implementation FlagsViewController

- (NSArray *)flags
{
    if (_flags == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil]];
        
        NSMutableArray *flagArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            Flags *flag = [Flags flagWithDict:dict];
            [flagArray addObject:flag];
        }
        
        _flags = flagArray;
        NSLog(@"flag:%@",_flags);
    }
    return _flags;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.countryPicker.delegate = self;
    self.countryPicker.dataSource = self;
    [self pickerView:nil didSelectRow:0 inComponent:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 数据源方法
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

    return self.flags.count;
}


#pragma mark 代理方法
/**
 *  返回每一项的视图
 */
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    FlagView *flagView = [FlagView flaViewWithResuingView:view];
    
    flagView.flag = self.flags[row];

    return flagView;
}

/**
 *  返回每一项的高度
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return [FlagView flagViewHight];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.countryLabel.text = [self.flags[row] name];
}
@end
