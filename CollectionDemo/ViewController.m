//
//  ViewController.m
//  CollectionDemo
//
//  Created by zhaoml on 2017/3/31.
//  Copyright © 2017年 赵明亮. All rights reserved.
//

#import "ViewController.h"
#import "MLCollectionView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    MLCollectionView *collView = [[MLCollectionView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 80)];
    collView.currentTitle = @"berb";
    collView.dataArray = [@[@"aaaaaa",@"qwerqwer",@"zcxvzc",@"sfh",@"aqwf",@"berb",@"tqwtqw",@"bcvbx",@"htwer",@"qwewer",@"qwer"] mutableCopy];
    [self.view addSubview:collView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
