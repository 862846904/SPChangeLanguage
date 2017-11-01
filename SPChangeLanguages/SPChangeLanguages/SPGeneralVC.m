//
//  SPGeneralVC.m
//  SPChangeLanguages
//
//  Created by 刘鹏 on 2017/10/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SPGeneralVC.h"
#import "SPGeneralCell.h"
#import "SPLanguageVC.h"

@interface SPGeneralVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *table_view;

@end

@implementation SPGeneralVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = GET_VALUE(GENERAL_TITLE);
    self.view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.table_view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *temp = [SPLanguageManager sharedLanguageManager].general_list[section];
    return temp.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [SPLanguageManager sharedLanguageManager].general_list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SPGeneralCell *cell = [SPGeneralCell generalWithTableView:tableView indexPath:indexPath];
    NSArray *temp = [SPLanguageManager sharedLanguageManager].general_list[indexPath.section];
    cell.title = temp[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 14.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 14.0f)];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0 && indexPath.section == 0) {
        
        SPLanguageVC *vc = [[SPLanguageVC alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [self presentViewController:nav animated:YES completion:nil];
    }
}

#pragma mark -- 懒加载
- (UITableView *)table_view {
    
    if (!_table_view) {
        
        _table_view = [[UITableView alloc] initWithFrame:self.view.bounds];
        _table_view.delegate = self;
        _table_view.dataSource = self;
    }
    return _table_view;
}

@end
