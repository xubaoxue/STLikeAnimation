//
//  STLikeAnimation.h
//  STLikeAnimation
//
//  Created by 徐保学 on 2019/3/9.
//  Copyright © 2019 徐保学. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface STLikeAnimation : NSObject

/**  获取单例对象*/
+ (instancetype)shareInstance;

/**  系统touch来触发的动画*/
- (void)createAnimationWithTouch:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

/**  点击来触发的动画*/
- (void)createAnimationWithTap:(UITapGestureRecognizer *)tap;



@end
