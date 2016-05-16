//
//  ViewController.m
//  13-QQcell
//
//  Created by 林威 on 16/5/13.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "ViewController.h"
#import "QQMessage.h"
#import "QQMessageFrame.h"
#import "QQMessageCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *messageFrames;


@end

@implementation ViewController

- (NSMutableArray *)messageFrames
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"message.plist" ofType:nil];
    
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *mfArray = [NSMutableArray array];
    for (NSDictionary *dict in dictArray) {
        QQMessage *message = [QQMessage messageWithDict:dict];
        QQMessageFrame *mf = [[QQMessageFrame alloc]init];
        
        mf.qqmessage = message;
        [mfArray addObject:mf];
    }
    _messageFrames = mfArray ;
    return _messageFrames;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QQMessageCell *cell = [QQMessageCell messageCellWithUITableView:tableView];
    
    cell.messageFrame = self.messageFrames[indexPath.row];
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
