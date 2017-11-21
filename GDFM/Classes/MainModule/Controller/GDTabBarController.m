//
//  GDTabBarController.m
//  GDFM
//
//  Created by 陈伟涵 on 2017/9/6.
//  Copyright © 2017年 cweihan. All rights reserved.
//

#import "GDTabBarController.h"
#import "GDTabBar.h"
#import "GDNavigationController.h"
#import "UIImage+GDImage.h"
#import "GDMiddleView.h"

@interface GDTabBarController ()

@end

@implementation GDTabBarController


+ (instancetype)shareInstance {
    static GDTabBarController *tabBarC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabBarC = [[GDTabBarController alloc] init];
    });
    return tabBarC;
}

+ (instancetype)tabBarControllerWithAddChildVCsBlock: (void(^)(GDTabBarController *tabBarC))addVCBlock {
    
    GDTabBarController *tabbarVC = [[GDTabBarController alloc] init];
    if (addVCBlock) {
        addVCBlock(tabbarVC);
    }
    
    return tabbarVC;
}


-(void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置tabbar
    [self setUpTabbar];
    
}

- (void)setUpTabbar {
    [self setValue:[[GDTabBar alloc] init] forKey:@"tabBar"];
}

/**
 *  根据参数, 创建并添加对应的子控制器
 *
 *  @param vc                需要添加的控制器(会自动包装导航控制器)
 *  @param isRequired             标题
 *  @param normalImageName   一般图片名称
 *  @param selectedImageName 选中图片名称
 */
- (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    
    if (isRequired) {
        GDNavigationController *nav = [[GDNavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage originImageWithName:normalImageName] selectedImage:[UIImage originImageWithName:selectedImageName]];
        
        [self addChildViewController:nav];
    }else {
        [self addChildViewController:vc];
    }
    
}

//- (void)setSelectedIndex:(NSUInteger)selectedIndex {
//    [super setSelectedIndex:selectedIndex];
//    
//    UIViewController *vc = self.childViewControllers[selectedIndex];
//    if (vc.view.tag == 666) {
//        vc.view.tag = 888;
//        
//        GDMiddleView *middleView = [GDMiddleView middleView];
//        middleView.middleClickBlock = [GDMiddleView shareInstance].middleClickBlock;
//        middleView.isPlaying = [GDMiddleView shareInstance].isPlaying;
//        middleView.middleImg = [GDMiddleView shareInstance].middleImg;
//        
//        CGRect frame = middleView.frame;
//        frame.size.width = 65;
//        frame.size.height = 65;
//        CGSize screenSize = [UIScreen mainScreen].bounds.size;
//        frame.origin.x = (screenSize.width - 65) * 0.5;
//        frame.origin.y = screenSize.height - 65;
//        middleView.frame = frame;
//        [vc.view addSubview:middleView];
//    }
//}




@end
