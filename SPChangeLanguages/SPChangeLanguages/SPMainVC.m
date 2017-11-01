//
//  SPMainVC.m
//  SPChangeLanguages
//
//  Created by 刘鹏 on 2017/10/31.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SPMainVC.h"
#import "SPGeneralVC.h"

@interface SPMainVC ()

@end

@implementation SPMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = GET_VALUE(SET_TITLE);
    UIButton *button = [[UIButton alloc] initWithFrame:self.view.bounds];
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:GET_VALUE(SET_TITLE) forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:30.0f];
    [button setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.isGo) {
        self.isGo = NO;
        [self goGeneralVC];
    }
}

- (void)btnAction:(UIButton *)button {
    [self goGeneralVC];
}

- (void)goGeneralVC {
    
    SPGeneralVC *vc = [[SPGeneralVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
