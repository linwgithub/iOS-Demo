//
//  TableViewController.m
//  12-微博cell
//
//  Created by 林威 on 16/5/10.
//  Copyright © 2016年 林威. All rights reserved.
//

#import "TableViewController.h"
#import "Status.h"
#import "StatusFrame.h"
#import "TableViewCell.h"

@interface TableViewController ()

@property(nonatomic, strong)NSArray *statusFrames;

@end

@implementation TableViewController

- (NSArray *)statusFrames
{
    if (_statusFrames == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil];
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *statusesFromesArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            Status *status = [Status statusWithDict:dict];
            
            StatusFrame *statusFrame = [[StatusFrame alloc]init];
            statusFrame.status = status;
            [statusesFromesArray addObject:statusFrame];
        }
        _statusFrames = statusesFromesArray;
    }
    
    return _statusFrames;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.statusFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView];
    
    cell.statusFrame = self.statusFrames[indexPath.row];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusFrame *statusFrame = self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;

}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
