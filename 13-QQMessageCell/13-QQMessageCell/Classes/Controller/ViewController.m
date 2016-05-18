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

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *textLable;

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
    
    // 2.监听键盘的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    //    // 3.设置文本框左边显示的view
    //    self.textLable.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 0)];
    //    // 永远显示
    //    self.textLable.leftViewMode = UITextFieldViewModeAlways;
    //    self.textLable.delegate = self;
    
    
}

- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    //设置窗口颜色
    [self.view.window setBackgroundColor:[UIColor whiteColor]];
    
    //获取键盘动画的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    //获取键盘动画后的frame
    CGRect transRect = [note.userInfo[UIKeyboardFrameEndUserInfoKey]CGRectValue];
    
    //计算键盘移动的Y
    CGFloat transframeY = transRect.origin.y - self.view.bounds.size.height;
    
    //启动动画
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, transframeY);
    }];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
@end
