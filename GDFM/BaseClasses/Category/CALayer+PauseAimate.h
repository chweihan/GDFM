//
//  CALayer+PauseAimate.h
//  GDFM
//
//  Created by 陈伟涵 on 2017/9/6.
//  Copyright © 2017年 cweihan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (PauseAimate)


/**
 暂停动画
 */
- (void)pauseAnimate;


/**
 回复动画
 */
- (void)resumeAnimate;


@end
