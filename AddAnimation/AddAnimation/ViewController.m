//
//  ViewController.m
//  AddAnimation
//
//  Created by admin on 17/1/7.
//  Copyright © 2017年 admin. All rights reserved.
//
#import "ViewController.h"
#define screenW   [UIScreen mainScreen].bounds.size.width
#define screenH   [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property (nonatomic,retain)UIView *demoView;
@property (nonatomic,retain)UIView *shopView;
@end

@implementation ViewController
- (IBAction)addShop:(id)sender {
    
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    [aPath moveToPoint:CGPointMake(screenW-100, screenH-100)];
    //贝塞尔曲线学习网址  http://www.cnblogs.com/moyunmo/p/3600091.html
    [aPath addQuadCurveToPoint:CGPointMake(100, screenH-80) controlPoint:CGPointMake(screenW-150, screenH-200)];
    [aPath stroke];
    anima1.path = aPath.CGPath;
    anima1.duration = 0.5;
    anima1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    anima1.delegate = self;
    [_demoView.layer addAnimation:anima1 forKey:@"pathAnimation"];
    
    
}
#pragma mark 开始动画
-(void)animationDidStart:(CAAnimation *)anim{
    
    NSLog(@"开始动画");
}
#pragma mark 结束动画
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.toValue = [NSNumber numberWithFloat:1.5];
    animation.duration = 0.5;
    [_shopView.layer addAnimation:animation forKey:@"scaleAnnimation"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _demoView = [[UIView alloc] initWithFrame:CGRectMake(screenW-100, screenH-100, 20, 20)];
    _demoView.backgroundColor = [UIColor redColor];
    _demoView.layer.cornerRadius = 10;
    _demoView.layer.masksToBounds = YES;
    [self.view addSubview:_demoView];
    
    _shopView = [[UIView alloc] initWithFrame:CGRectMake(60, screenH-100, 80, 100)];
    [self.view addSubview:_shopView];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 10, 30, 30)];
    imageView.image = [UIImage imageNamed:@"d5eace7a1d0d79538d0d2c4bdf7c78a6.jpg"];
    [_shopView addSubview:imageView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, 80, 30)];
    label.text = @"购物车";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    [_shopView addSubview:label];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
