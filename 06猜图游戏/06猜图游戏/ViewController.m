//
//  ViewController.m
//  06猜图游戏
//
//  Created by linw on 16/4/25.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"

@interface ViewController () <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *center_img;

@property (weak, nonatomic) IBOutlet UILabel *noLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *btn_next;

@property (weak, nonatomic) IBOutlet UIButton *sourceBtn;

@property(nonatomic, weak)UIButton *cover;

@property(nonatomic, strong)NSArray *questions;

@property(nonatomic, assign)int index;

@property (weak, nonatomic) IBOutlet UIView *answerView;
@property (weak, nonatomic) IBOutlet UIView *optionView;

@end

@implementation ViewController

/**
 *  设置分数
 */
- (void)showSource:(int)delatSource
{
    int source = [self.sourceBtn titleForState:UIControlStateNormal].intValue;
    
    source += delatSource;
    
    [self.sourceBtn setTitle:[NSString stringWithFormat:@"%d",source] forState:UIControlStateNormal];
}

/**
 *  设置状态栏
 *
 *  @return 状态栏属性
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return  UIStatusBarStyleLightContent;
}

/**
 *  中间的图标
 */
- (IBAction)centerImg:(id)sender
{
    if (self.cover == nil) {
        [self bigImg:nil];
    }else{
        [self smellImg];
    }
    
}

/**
 *  提示按钮
 */
- (IBAction)tip:(id)sender {
    
    self.optionView.userInteractionEnabled = YES;
    //点击所有答案按钮
    for (UIButton *answerBtn in self.answerView.subviews) {
        [self answerClick:answerBtn];
    }
    
    //取出答案
    Question *qusetion = self.questions[self.index];

    //取出答案的第一个字
    NSString *firstAnswer = [qusetion.answer substringToIndex:1];
        NSLog(@"same : %@",qusetion.answer);
        NSLog(@" : %@",firstAnswer);
    for (UIButton *optionBtn in self.optionView.subviews) {
        if ([optionBtn.currentTitle isEqualToString:firstAnswer]) {
            NSLog(@"same : %@",firstAnswer);
            [self optionBtnClick:optionBtn];
            break;
        }
    }
    
    //扣分
    [self showSource:-1000];
}

/**
 *  帮助按钮
 */
- (IBAction)help:(id)sender {
    
    
}

/**
 *  大图按钮
 */
- (IBAction)bigImg:(id)sender
{
    
    //添加阴影
    UIButton *cover = [[UIButton alloc]init];
    cover.frame = self.view.bounds;
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.0;
    [cover addTarget:self action:@selector(smellImg) forControlEvents:UIControlEventTouchDragInside];
    [self.view addSubview:cover];
    self.cover = cover;
    //将重心图片移到最上层
    [self.view bringSubviewToFront:self.center_img];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.cover.alpha = 0.7;
        
        float centerImgW = self.view.bounds.size.width;
        float centerImgH = centerImgW;
        float centerImgY = (self.view.bounds.size.width - centerImgW) / 2;
//        self.center_img.frame = CGRectMake(0, centerImgY, centerImgW, centerImgH);
        NSLog(@"%f,%f,%f,%f",self.view.bounds.size.width,centerImgY, centerImgW, centerImgH);
        
        CGFloat iconW = self.view.frame.size.width;
        CGFloat iconH = iconW;
        CGFloat iconY = (self.view.frame.size.height - iconH) * 0.5;
        self.center_img.frame = CGRectMake(0, iconY, iconW, iconH);
    }];
    
}

/**
 *  缩小图片
 */
- (void)smellImg
{
   [UIView animateWithDuration:0.25 animations:^{
       self.cover.alpha = 0.0;
       self.center_img.frame = CGRectMake(85, 80, 150, 150);
   } completion:^(BOOL finished) {
       [self.cover removeFromSuperview];
       self.cover = nil;
   }];
}

/**
 *  下一题按钮
 */
- (IBAction)next:(id)sender {
    //1、添加索引
    self.index++;
    if (self.index == self.questions.count) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"恭喜您通过了" message:@"后续内容，敬请期待" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    //2、取出模型
    Question *question = self.questions[self.index];
    //3、设置控件数据
    [self setViewData:question];
    //4、添加正确答案
    [self addAnswerBtn:question];
    
    //5、添加待选答案
    [self addOptionsBtn:question];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}

- (void)addOptionsBtn:(Question *)quetion
{
    //5.1 删除之前添加的所有按钮
    [self.optionView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //6.2 添加新的待选答案按钮
    NSInteger count = quetion.options.count;
    
    for (int i = 0; i < count; i++) {
        //6.2.1 创建按钮
        UIButton *optionBtn = [[UIButton alloc]init];
        
        //6.2.2 设置背景
        [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
        [optionBtn setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighted"] forState:UIControlStateHighlighted];
        
        //6.2.3 设置frame
        //按钮尺寸
        float btnW = 35;
        float btnH = 35;
        //按钮间距
        float btnMargin = 10;
        //view视图的宽度
        float viewW = self.view.frame.size.width;
        //每行的按钮数
        int totalColumns = 7;
        //每行左边的边距
        float leftMargin = (viewW - totalColumns * btnW - (totalColumns - 1) * btnMargin) * 0.5;
        //按钮的列数
        int col = i % totalColumns;
        //按钮的行数
        int row = i / totalColumns;
        //按钮的位置
        float btnX = leftMargin + col * (btnW + btnMargin);
        float btnY = row * (btnH + btnMargin);
        //设置frame
        optionBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        //设置按钮的文字
        [optionBtn setTitle:quetion.options[i] forState:UIControlStateNormal];
        [optionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //添加按钮
        [self.optionView addSubview:optionBtn];
        
        //添加点击响应事件
        [optionBtn addTarget:self action:@selector(optionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)optionBtnClick:(UIButton *)optionBtn
{
    //1、隐藏按钮
    optionBtn.hidden = YES;
    //填入答案
    for (UIButton *answerBtn in self.answerView.subviews) {
        NSString *answerTitle = [answerBtn titleForState:UIControlStateNormal];
        if (answerTitle.length == 0) {
            //取出待选项答案
            NSString *optionTitle = [optionBtn titleForState:UIControlStateNormal];
            //填入答案
            [answerBtn setTitle:optionTitle forState:UIControlStateNormal];
            break;//跳出循环
        }
    }
    //判断答案是否填完
    BOOL full = YES;
    NSMutableString *tempAnswer = [NSMutableString string];
    for (UIButton *answerBtn in self.answerView.subviews) {
        NSString *answerTitle = answerBtn.currentTitle;
        if (answerTitle.length == 0) {
            full = NO;
        }
        
        if (answerTitle) {
            [tempAnswer appendString:answerTitle];
        }
    }
    if (full) {
        self.optionView.userInteractionEnabled = NO;
        Question *question = self.questions[self.index];
        if ([tempAnswer isEqualToString:question.answer]) {
            //答案正确,修改文字颜色 蓝色
            for (UIButton *answerBtn in self.answerView.subviews) {
                [answerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }
            //修改分数
            [self showSource:800];
            //0.5秒后跳转下一题
            [self performSelector:@selector(next:) withObject:nil afterDelay:0.5];
        }else{
            //错误答案，修改文字颜色 红色
            for (UIButton *answerBtn in self.answerView.subviews) {
                [answerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }
        }
        
    }
    
}

- (void)addAnswerBtn:(Question *)question
{
    self.optionView.userInteractionEnabled = YES;
    //4.1 删除之前添加的所有按钮
    [self.answerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSInteger length = question.answer.length;
    //4.2添加新的答案按钮
    for (int i = 0; i < length; i++) {
        //4.2.1 创建按钮
        UIButton *answerBtn = [[UIButton alloc]init];
        [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //4.2.2 设置背景
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        //4.2.3 设置frame
        float viewW = self.view.bounds.size.width;
        
        float btnMargin = 10;
        float btnW = 35;
        float btnH = 35;
        float leftmargin = (viewW - length * btnW - (length - 1) * btnMargin) * 0.5;
        
        float btnX = leftmargin + i * (btnW + btnMargin);
        
        answerBtn.frame = CGRectMake(btnX, 0, btnW, btnH);
        
        //4.2.4 添加按钮
        [self.answerView addSubview:answerBtn];
        
        //4.2.5 添加点击事件
        [answerBtn addTarget:self action:@selector(answerClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

/**
 *  答案按钮点击事件
 */
- (void)answerClick:(UIButton *)answerBtn
{
    self.optionView.userInteractionEnabled = YES;
   //1、显示对应的待选答案按钮
    for (UIButton *optionbtn in self.optionView.subviews) {
        if ([optionbtn.currentTitle isEqualToString:answerBtn.currentTitle] && optionbtn.hidden == YES) {
            optionbtn.hidden = NO;
        }
    }
    //让被点击的答案按钮消失
    [answerBtn setTitle:nil forState:UIControlStateNormal];
    
    //答案按钮文字变黑
    for (UIButton *btn in self.answerView.subviews) {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

/**
 *  设置控件数据
 */
- (void)setViewData:(Question *)question
{
    self.noLabel.text = [NSString stringWithFormat:@"%d/%lu",self.index + 1,(unsigned long)self.questions.count];
    
    self.titleLabel.text = question.title;
    
    [self.center_img setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];
    
    self.btn_next.enabled = (self.index != self.questions.count-1);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.index = -1;
    [self next:nil];
    
}

- (NSArray *)questions
{
    if (_questions == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"questions" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *questionArray = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            Question *question = [Question questionWithDict:dict];
            [questionArray addObject:question];
        }
        _questions = questionArray;
    }
    return _questions;
}

@end
