//
//  ViewController.m
//  05九宫格
//
//  Created by linw on 16/4/23.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"
#import "MyApp.h"
#import "MyAppView.h"

@interface ViewController ()

/**
 *  app数组
 */
@property(nonatomic, strong)NSArray *apps;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //行数
    int toatalcolums = 3;
    //大小
    int appw = 85;
    int apph = 95;
    //间距
    float marginx = (self.view.bounds.size.width - appw * toatalcolums) / (toatalcolums + 1);
    
    float marginy = 15;
    
    for (int index = 0; index < self.apps.count; index++) {
        
        
        
        //计算行数、列数
        int row = index / toatalcolums;//行
        int col = index % toatalcolums;//列
        
        //计算xy
        float x = marginx + col * (marginx + appw);
        float y = marginx + row * (marginy + apph);
        
        MyAppView *appView = [MyAppView appViewWithAppData:self.apps[index]];
        appView.frame = CGRectMake(x, y, 85, 90);
//        UIView *appView = [[UIView alloc]init];
//        appView.backgroundColor = [UIColor grayColor];
//        
//        appView.frame = CGRectMake(x, y, appw, apph);
//        
//        MyApp *data = self.apps[index];
//        //添加图标
//        UIImageView *appImg = [[UIImageView alloc]init];
//        //计算大小位置
//        int imgw = 45;
//        int imgh = 45;
//        float imgx = (appw - imgw) / 2;
//        float imgy = 5;
//        appImg.frame = CGRectMake(imgx, imgy, imgw, imgh);
//        appImg.image = [UIImage imageNamed:data.icon];
//        [appView addSubview:appImg];
//        
//        //添加标题
//        UILabel *label = [[UILabel alloc]init];
//        //计算辩题位置大小
//        float labelw = appw;
//        float labelh = 20;
//        float labelx = 0;
//        float labely = imgh + imgy;
//        label.frame = CGRectMake(labelx, labely, labelw, labelh);
//        label.text = data.name;
//        label.font = [UIFont systemFontOfSize:13];
//        
//        label.textAlignment = NSTextAlignmentCenter;
//        
//        [appView addSubview:label];
//        
//        //添加下载按钮
//        UIButton *downloadButton = [[UIButton alloc]init];
//        //位置大小
//        float btnx = 12;
//        float btny = labely + labelh;
//        float btnw = appw - 2 * btnx;
//        float btnh = 20;
//        downloadButton.frame = CGRectMake(btnx, btny, btnw, btnh);
//        
//        downloadButton.backgroundColor = [UIColor greenColor];
//        
//        [downloadButton setTitle:@"下载" forState:UIControlStateNormal];
//        downloadButton.titleLabel.textAlignment = NSTextAlignmentCenter;
//        downloadButton.titleLabel.font = [UIFont systemFontOfSize:13];
//        downloadButton.titleLabel.textColor = [UIColor whiteColor];
//        
//        [appView addSubview:downloadButton];
        
        [self.view addSubview:appView];
    }
}

- (NSArray *)apps
{
    if (_apps == nil) {
        
        //1、获取plist文件路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        //2、从路径中获取plist中的字典
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        //3、创建接受数据模型的可变数组
        NSMutableArray *apparray = [NSMutableArray array];
        
        //4、依次取出字典，循环存储到数据模型中
        for (NSDictionary *dataDictionary in array) {
            //新建单条数据模型
            MyApp *app = [MyApp myAppWithDict:dataDictionary];
            //添加到可变数组中
            [apparray addObject:app];
        }
        //5、将数据模型数组赋值到成员变量中
        _apps = apparray;
    }
    
    return _apps;
}
@end
