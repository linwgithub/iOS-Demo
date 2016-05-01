//
//  ViewController.m
//  图片浏览器
//
//  Created by linw on 16/4/20.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)NSArray *imageData;
@property (assign, nonatomic)int index;

@property (weak, nonatomic) IBOutlet UILabel *indexLabel;

@property (weak, nonatomic) IBOutlet UIImageView *showImg;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UIButton *previewButton;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation ViewController

- (void)dataChange
{
    static NSString *iconStr = @"icon";
    static NSString *desStr = @"desc";
    self.indexLabel.text = [NSString stringWithFormat:@"%d/%lu",self.index,(unsigned long)self.imageData.count];
    
    NSDictionary *dictionary = self.imageData[self.index - 1];
    
    UIImage *image = [UIImage imageNamed:dictionary[iconStr]];
    [self.showImg setImage:image];
    
    self.contentLabel.text = dictionary[desStr];
    
    self.previewButton.enabled = (self.index != 1);
    self.nextButton.enabled = (self.index != self.imageData.count);
    
}
- (NSArray *)imageData
{
    if (_imageData == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        
        NSString *path = [bundle pathForResource:@"imageData" ofType:@"plist"];
        _imageData = [NSArray arrayWithContentsOfFile:path];
        
    }
    
    return _imageData;
}


- (IBAction)showNextImg:(id)sender {
    if (self.index < self.imageData.count) {
        self.index +=1;
        [self dataChange];
    }
    
}

- (IBAction)showPreviewImg:(id)sender {
    if (self.index > 1) {
        self.index -=1;
        [self dataChange];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.index = 1;
    [self dataChange];
    // Do any additional setup after loading the view, typically from a nib.
}

@end
