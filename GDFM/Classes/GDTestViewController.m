//
//  GDTestViewController.m
//  GDFM
//
//  Created by 陈伟涵 on 2017/9/6.
//  Copyright © 2017年 cweihan. All rights reserved.
//

#import "GDTestViewController.h"

@interface GDTestViewController ()

@end

@implementation GDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.tag = 666;
    self.view.backgroundColor = [UIColor redColor];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    NSLog(@"摸到我了");
    static BOOL isPlay = NO;
    isPlay = !isPlay;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playState" object:@(isPlay)];
    UIImage *image = [UIImage imageNamed:@"zxy_icon"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playImage" object:image];
        
    
    
}

@end
