//
//  GDMiddleView.m
//  GDFM
//
//  Created by 陈伟涵 on 2017/9/6.
//  Copyright © 2017年 cweihan. All rights reserved.
//

#import "GDMiddleView.h"
#import "CALayer+PauseAimate.h"

@interface GDMiddleView()

@property (weak, nonatomic) IBOutlet UIImageView *middleImageView;

@property (weak, nonatomic) IBOutlet UIButton *playBtn;

@end

@implementation GDMiddleView

static GDMiddleView *_shareInstance;

+ (instancetype)shareInstance {
    if (_shareInstance == nil) {
        _shareInstance = [GDMiddleView middleView];
    }
    return _shareInstance;
}

+ (instancetype)middleView {
    GDMiddleView *middleView = [[[NSBundle mainBundle] loadNibNamed:@"GDMiddleView" owner:nil options:nil] firstObject];
    return middleView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.middleImageView.layer.masksToBounds = YES;
    self.middleImg = self.middleImageView.image;
    
    [self.middleImageView.layer removeAnimationForKey:@"playAnnimation"];
    CABasicAnimation *basicAnimation = [[CABasicAnimation alloc] init];
    basicAnimation.keyPath = @"transform.rotation.z";
    basicAnimation.fromValue = @0;
    basicAnimation.toValue = @(M_PI * 2);
    basicAnimation.duration = 30;
    basicAnimation.repeatCount = MAXFLOAT;
    basicAnimation.removedOnCompletion = NO;
    [self.middleImageView.layer addAnimation:basicAnimation forKey:@"playAnnimation"];
    
    [self.middleImageView.layer pauseAnimate];
    
    
    [self.playBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 监听播放状态的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isPlayerPlay:) name:@"playState" object:nil];
    
    // 监听播放图片的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setPlayImage:) name:@"playImage" object:nil];
}


- (void)isPlayerPlay:(NSNotification *)notification {
    BOOL isPlay = [notification.object boolValue];
    self.isPlaying = isPlay;
}

- (void)setPlayImage:(NSNotification *)notification {
    UIImage *image = notification.object;
    self.middleImg = image;

}

- (void)btnClick:(UIButton *)btn {
    if (self.middleClickBlock) {
        self.middleClickBlock(self.isPlaying);
    }
}

- (void)setIsPlaying:(BOOL)isPlaying {
    if (_isPlaying == isPlaying) {
        return;
    }
    _isPlaying = isPlaying;
    if (isPlaying) {
        [self.playBtn setImage:nil forState:UIControlStateNormal];
        [self.middleImageView.layer resumeAnimate];
        
    }else {
        
        UIImage *image = [UIImage imageNamed:@"tabbar_np_play"];
        [self.playBtn setImage:image forState:UIControlStateNormal];
        
        [self.middleImageView.layer pauseAnimate];
    }
}

- (void)setMiddleImg:(UIImage *)middleImg {
    _middleImg = middleImg;
    self.middleImageView.image = middleImg;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.middleImageView.layer.cornerRadius = self.middleImageView.frame.size.width * 0.5;

}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
