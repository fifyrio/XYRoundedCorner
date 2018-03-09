//
//  ViewController.m
//  Demo
//
//  Created by wuw on 16/6/15.
//  Copyright © 2016年 fifyrio. All rights reserved.
//

#import "ViewController.h"
#import "XYRoundedCorner.h"

#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ScreenW [UIScreen mainScreen].bounds.size.width


@interface ViewController ()

@property (nonatomic, strong) UIButton *feedBtn_1;

@property (nonatomic, strong) UIButton *feedBtn_2;
@end

@implementation ViewController
#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"Demo";
    
    [self setUpViews];
}
#pragma mark - Initialize
- (void)setUpViews{
    for (NSInteger i = 0; i < 2; i ++) {
        UIButton *feedBtn = [[UIButton alloc] initWithFrame:CGRectMake(20 + (40 + 100) * i, 100, 100, 40)];
        [feedBtn xy_setXYRadius:XYRadiusMake(10, 10, 10, 10) size:CGSizeMake(100, 40) borderColor:[UIColor grayColor] borderWidth:1 backgroundColor:[UIColor grayColor] forState:UIControlStateNormal];
        [feedBtn xy_setXYRadius:XYRadiusMake(10, 10, 10, 10) size:CGSizeMake(100, 40) borderColor:[UIColor cyanColor] borderWidth:1 backgroundColor:[UIColor cyanColor] forState:UIControlStateSelected];
        [self.view addSubview:feedBtn];
        
        if (i == 0) {
            _feedBtn_1 = feedBtn;
        }else{
            _feedBtn_2 = feedBtn;
        }
    }
    
}


- (IBAction)onclickSet:(id)sender {
    static int i = 0;
    if (i % 2) {
        _feedBtn_1.selected = YES;
        _feedBtn_2.selected = NO;
    }else{
        _feedBtn_1.selected = NO;
        _feedBtn_2.selected = NO;
    }
    i ++;
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
