//
//  GDNavBar.m
//  GDFM
//
//  Created by 陈伟涵 on 2017/9/6.
//  Copyright © 2017年 cweihan. All rights reserved.
//

#import "GDNavBar.h"

@implementation GDNavBar

/**
 *  设置全局的导航栏背景图片
 *
 *  @param globalImg 全局导航栏背景图片
 */
+ (void)setGlobalBackGroundImage: (UIImage *)globalImg {
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"GDNavigationController"),nil];
}
/**
 *  设置全局导航栏标题颜色, 和文字大小
 *
 *  @param globalTextColor 全局导航栏标题颜色
 *  @param fontSize        全局导航栏文字大小
 */
+ (void)setGlobalTextColor: (UIColor *)globalTextColor andFontSize: (CGFloat)fontSize {
    if (globalTextColor == nil) {
        return;
    }
    
    if (fontSize < 6 || fontSize > 40) {
        fontSize = 16;
    }
    
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:NSStringFromClass(@"GDNavigationController"), nil];
    
    //设置导航栏颜色
    NSDictionary *titleDic = @{NSForegroundColorAttributeName : globalTextColor,
                               NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    [navBar setTitleTextAttributes:titleDic];
}

@end
