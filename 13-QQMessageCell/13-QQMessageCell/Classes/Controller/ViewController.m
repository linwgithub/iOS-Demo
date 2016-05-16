//
//  ViewController.m
//  13-QQMessageCell
//
//  Created by 林威 on 16/5/16.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "ViewController.h"
#import "QQMessage.h"
#import "QQMessageFrame.h"
#import "QQMessageCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *messageFrameArray;
@end

@implementation ViewController

- (NSMutableArray *)messageFrameArray
{
    if (_messageFrameArray == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil];
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *mfArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray) {
            QQMessage *message = [QQMessage qqmessageWithDict:dict];
            
            QQMessageFrame *mf = [[QQMessageFrame alloc]init];
            QQMessageFrame *lastmf = [mfArray lastObject];
            QQMessage *lastmessage = lastmf.message;
            message.isHideTime = [lastmessage.time isEqualToString:message.time];
            
            mf.message = message;
            
            [mfArray addObject:mf];
        }
        _messageFrameArray = mfArray;
    }
    
    return _messageFrameArray;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageFrameArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QQMessageCell *cell = [QQMessageCell cellWithTableView:tableView];
    cell.messageFrame = self.messageFrameArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QQMessageFrame *mf = self.messageFrameArray[indexPath.row];
    return mf.cellHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 去除分割线
    self.tableView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO; // 不允许选中
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
