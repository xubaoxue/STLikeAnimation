//
//  ViewController.m
//  STLikeAnimation
//
//  Created by 徐保学 on 2019/3/9.
//  Copyright © 2019 徐保学. All rights reserved.
//

#define HYIPhoneX                   ((([[UIScreen mainScreen] nativeBounds].size.height == 2436) || ([[UIScreen mainScreen] nativeBounds].size.height == 2688) || ([[UIScreen mainScreen] nativeBounds].size.height == 1792) ) ? YES : NO)

#define kStatusBarHeight            (((HYIPhoneX))?44:20)

#import "ViewController.h"
#import "STLikeAnimation.h"

@interface ViewController ()

@property(nonatomic,strong)UITapGestureRecognizer       *doubleTap;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.8];
    
    //添加双击动画
    self.doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubletapCellSwipes:)];
    self.doubleTap.numberOfTapsRequired = 2;
    self.doubleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:self.doubleTap];
}

#pragma mark ==================== 点赞相关
////单击屏幕任何位置动画
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [[STLikeAnimation shareInstance] createAnimationWithTouch:touches withEvent:event];
//}


//双击屏幕任何位置动画
- (void)doubletapCellSwipes:(UITapGestureRecognizer *)gestureRecognizer
{
    [[STLikeAnimation shareInstance] createAnimationWithTap:gestureRecognizer];
}


@end
