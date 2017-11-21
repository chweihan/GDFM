//
//  GDTabBar.h
//  GDFM
//
//  Created by 陈伟涵 on 2017/9/6.
//  Copyright © 2017年 cweihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDTabBar : UITabBar

@property (nonatomic, copy) void(^middleClickBlock)(BOOL isPlaying);

@end
