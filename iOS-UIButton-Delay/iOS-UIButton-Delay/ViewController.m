//
//  ViewController.m
//  iOS-UIButton-Delay
//
//  Created by xk_mac_mini on 2019/9/19.
//  Copyright © 2019 rztime. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = UIColor.orangeColor;
    [button addTarget:self action:@selector(UIControlEventTouchDown:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(UIControlEventTouchDragInside:) forControlEvents:UIControlEventTouchDragInside];
    [button addTarget:self action:@selector(UIControlEventTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(UIControlEventTouchUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
    [button addTarget:self action:@selector(UIControlEventTouchCancel:) forControlEvents:UIControlEventTouchCancel];
    
    [self.view addSubview:button];
}

- (void)UIControlEventTouchDown:(UIButton *)sender {
    NSLog(@"UIControlEventTouchDown");
}
- (void)UIControlEventTouchDragInside:(UIButton *)sender {
    NSLog(@"UIControlEventTouchDragInside");
}
- (void)UIControlEventTouchUpInside:(UIButton *)sender {
    NSLog(@"UIControlEventTouchUpInside");
}
- (void)UIControlEventTouchUpOutside:(UIButton *)sender {
    NSLog(@"UIControlEventTouchUpOutside");
}
- (void)UIControlEventTouchCancel:(UIButton *)sender {
    NSLog(@"UIControlEventTouchCancel");
}

@end
