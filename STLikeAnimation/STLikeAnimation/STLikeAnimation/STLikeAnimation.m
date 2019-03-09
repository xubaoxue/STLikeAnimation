//
//  STLikeAnimation.m
//  STLikeAnimation
//
//  Created by 徐保学 on 2019/3/9.
//  Copyright © 2019 徐保学. All rights reserved.
//
#import "STLikeAnimation.h"

//---------------------------------------------私有定制·配置区
/** ❤️的名字*/
NSString *const st_heartImgName = @"like";
/** ❤️图片的宽度*/
const CGFloat st_heartImgWidth = 80;
/** ❤️图片的高度*/
const CGFloat st_heartImgHeight = 80;
//---------------------------------------------私有定制·配置区


@interface STLikeAnimation ()


@end

@implementation STLikeAnimation

#pragma mark -
#pragma mark - 🎱 shareInstance 多线程单例
+ (instancetype)shareInstance {
    static STLikeAnimation *selfInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        selfInstance = [[self alloc] init];
    });
    
    return selfInstance;
}

/**  系统touch来触发的动画*/
#pragma mark -
#pragma mark - 🎱 createAnimationWithTounch: withEvent:
- (void)createAnimationWithTouch:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSSet *allTouches = [event allTouches];
    UITouch *touch = [allTouches anyObject];
    CGPoint point = [touch locationInView:[touch view]];
    UIImage *img = [UIImage imageNamed:st_heartImgName];
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, st_heartImgWidth, st_heartImgHeight)];
    imgV.image = img;
    imgV.contentMode = UIViewContentModeScaleAspectFill;
    imgV.center = point;
    
    /**  左右随机显示*/
    int leftOrRight = arc4random()%2;
    leftOrRight = leftOrRight ? leftOrRight : -1;
    imgV.transform = CGAffineTransformRotate(imgV.transform,M_PI / 9 * leftOrRight);
    [[touch view] addSubview:imgV];
    
    /** 出现的时候回弹一下*/
    __block UIImageView *blockImgV = imgV;
    __block UIImage *blockImg = img;
    [UIView animateWithDuration:0.1 animations:^{
        blockImgV.transform = CGAffineTransformScale(blockImgV.transform, 1.2, 1.2);
    } completion:^(BOOL finished) {
        blockImgV.transform = CGAffineTransformScale(blockImgV.transform, 0.8, 0.8);
        /** 向上飘，放大，透明*/
        [self performSelector:@selector(animationToTop:) withObject:@[blockImgV,blockImg] afterDelay:0.3];
    }];
}


/**  点击来触发的动画*/
#pragma mark -
#pragma mark - 🎱 createAnimationWithTap:
- (void)createAnimationWithTap:(UITapGestureRecognizer *)tap {
    CGPoint point = [tap locationInView:[tap view]];
    UIImage *img = [UIImage imageNamed:st_heartImgName];
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, st_heartImgWidth, st_heartImgHeight)];
    imgV.image = img;
    imgV.contentMode = UIViewContentModeScaleAspectFill;
    imgV.center = point;
    [[tap view] addSubview:imgV];
    
    /**  左右随机显示*/
    int leftOrRight = arc4random()%2;
    leftOrRight = leftOrRight ? leftOrRight : -1;
    imgV.transform = CGAffineTransformRotate(imgV.transform,M_PI / 9 * leftOrRight);
    
    /** 出现的时候回弹一下*/
    __block UIImageView *blockImgV = imgV;
    __block UIImage *blockImg = img;
    [UIView animateWithDuration:0.1 animations:^{
        blockImgV.transform = CGAffineTransformScale(blockImgV.transform, 1.2, 1.2);
    } completion:^(BOOL finished) {
        blockImgV.transform = CGAffineTransformScale(blockImgV.transform, 0.8, 0.8);
        /** 向上飘，放大，透明*/
        [self performSelector:@selector(animationToTop:) withObject:@[blockImgV,blockImg] afterDelay:0.3];
    }];
    
}

#pragma mark -
#pragma mark - 🎱 animationToTop
- (void)animationToTop:(NSArray *)imgObjects {
    if (imgObjects && imgObjects.count > 0) {
        __block UIImageView *imageV = (UIImageView *)imgObjects[0];
        __block UIImage *img = (UIImage *)imgObjects[1];
        [UIView animateWithDuration:1.0 animations:^{
            imageV.frame = CGRectMake(imageV.frame.origin.x, imageV.frame.origin.y - 100, imageV.frame.size.width, imageV.frame.size.height);
            imageV.transform = CGAffineTransformScale(imageV.transform, 1.8, 1.8);
            imageV.alpha = 0.0;
        } completion:^(BOOL finished) {
            imageV = nil;
            img = nil;
        }];
    }
}

@end
