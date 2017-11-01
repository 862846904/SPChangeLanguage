//
//  SPLanguageVC.m
//  SPChangeLanguages
//
//  Created by 刘鹏 on 2017/10/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SPLanguageVC.h"
#import "SPLanguageCell.h"
#import "SPLanguage.h"
#import "SPLanguageManager.h"

@interface SPLanguageVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *table_view;

@property (nonatomic, strong) SPLanguage *currentSelLanguage;

@end

@implementation SPLanguageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = GET_VALUE(LANGUAGE_TITLE);
    
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.table_view];
    
    UIBarButtonItem *cancel_item = [[UIBarButtonItem alloc] initWithTitle:GET_VALUE(CANCEL) style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction:)];
    UIBarButtonItem *complete_item = [[UIBarButtonItem alloc] initWithTitle:GET_VALUE(DONE) style:UIBarButtonItemStylePlain target:self action:@selector(completeAction:)];
    
    self.navigationItem.leftBarButtonItem = cancel_item;
    self.navigationItem.rightBarButtonItem = complete_item;
}

#pragma mark -- action
- (void)cancelAction:(UIBarButtonItem *)item {
    [self dismissViewControllerAnimated:YES completion:nil];
    [[SPLanguageManager sharedLanguageManager] cancelChangesLanguage];
}

- (void)completeAction:(UIBarButtonItem *)item {
    [self dismissViewControllerAnimated:YES completion:nil];
    [[SPLanguageManager sharedLanguageManager] doneChangesLanguage:self.currentSelLanguage];
}

#pragma mark -- tableview delegate
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [SPLanguageManager sharedLanguageManager].language_list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio {
    return [SPLanguageManager sharedLanguageManager].language_list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SPLanguageCell *cell = [SPLanguageCell languageWithTableView:tableView indexPath:indexPath];
    SPLanguage *language = [SPLanguageManager sharedLanguageManager].language_list[indexPath.row];
    cell.language = language;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    for (SPLanguage *language in [SPLanguageManager sharedLanguageManager].language_list) {
        language.is_select = NO;
    }
    SPLanguage *language = [SPLanguageManager sharedLanguageManager].language_list[indexPath.row];
    language.is_select = YES;
    self.currentSelLanguage = language;
    [tableView reloadData];
}

#pragma mark -- 懒加载
- (UITableView *)table_view {
    
    if (!_table_view) {
        _table_view = [[UITableView alloc] init];
        _table_view.delegate = self;
        _table_view.dataSource = self;
        _table_view.frame = self.view.bounds;
    }
    return _table_view;
}

@end
