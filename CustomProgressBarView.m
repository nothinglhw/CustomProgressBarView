//
//  CustomProgressBarView.m
//  customProgressBar
//
//  Created by nothinglhw on 14-7-23.
//  Copyright (c) 2014年 nothinglhw. All rights reserved.
//

#import "CustomProgressBarView.h"
#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式
#define  PROGREESS_WIDTH 80 //圆直径
#define PROGRESS_LINE_WIDTH 4 //弧线的宽度
#define PROCESS_COLOR  ([UIColor grayColor])
#define MAIN_SCREEN_ANIMATION_TIME .3
@interface CustomProgressBarView ()

@end

@implementation CustomProgressBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        _trackLayer = [CAShapeLayer layer];//创建一个track shape layer
//        _trackLayer.frame = self.bounds;
//        [self.layer addSublayer:_trackLayer];
//        _trackLayer.fillColor = [[UIColor clearColor] CGColor];
//        _trackLayer.strokeColor = [_strokeColor CGColor];//指定path的渲染颜色
//        _trackLayer.opacity = 0.25; //背景同学你就甘心做背景吧，不要太明显了，透明度小一点
//        _trackLayer.lineCap = kCALineCapRound;//指定线的边缘是圆的
//        _trackLayer.lineWidth = PROGRESS_LINE_WIDTH;//线的宽度
//        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(40, 40) radius:(PROGREESS_WIDTH-PROGRESS_LINE_WIDTH)/2 startAngle:degreesToRadians(-210) endAngle:degreesToRadians(30) clockwise:YES];//上面说明过了用来构建圆形
//        _trackLayer.path =[path CGPath]; //把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
//        
//        _progressLayer = [CAShapeLayer layer];
//        _progressLayer.frame = self.bounds;
//        _progressLayer.fillColor =  [[UIColor clearColor] CGColor];
//        _progressLayer.strokeColor  = [PROCESS_COLOR CGColor];
//        _progressLayer.lineCap = kCALineCapRound;
//        _progressLayer.lineWidth = PROGRESS_LINE_WIDTH;
//        _progressLayer.path = [path CGPath];
//        _progressLayer.strokeEnd = 0;
//        
//        CALayer *gradientLayer = [CALayer layer];
//        CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
//        gradientLayer1.frame = CGRectMake(0, 0, self.width/2, self.height);
//        [gradientLayer1 setColors:[NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor],(id)[UIColorFromRGB(0xfde802) CGColor], nil]];
//        [gradientLayer1 setLocations:@[@0.5,@0.9,@1 ]];
//        [gradientLayer1 setStartPoint:CGPointMake(0.5, 1)];
//        [gradientLayer1 setEndPoint:CGPointMake(0.5, 0)];
//        [gradientLayer addSublayer:gradientLayer1];
//        
//        CAGradientLayer *gradientLayer2 =  [CAGradientLayer layer];
//        [gradientLayer2 setLocations:@[@0.1,@0.5,@1]];
//        gradientLayer2.frame = CGRectMake(self.width/2, 0, self.width/2, self.height);
//        [gradientLayer2 setColors:[NSArray arrayWithObjects:(id)[UIColorFromRGB(0xfde802) CGColor],(id)[MAIN_BLUE CGColor], nil]];
//        [gradientLayer2 setStartPoint:CGPointMake(0.5, 0)];
//        [gradientLayer2 setEndPoint:CGPointMake(0.5, 1)];
//        [gradientLayer addSublayer:gradientLayer2];
//        
//        [gradientLayer setMask:_progressLayer]; //用progressLayer来截取渐变层
//        [self.layer addSublayer:gradientLayer];
        // Initialization code
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:(self.bounds.size.width - _progressWidth)/ 2 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        
        
        _trackLayer = [CAShapeLayer layer];
        
        _trackLayer.fillColor = nil;
        _trackLayer.frame = self.bounds;
        [self setTrack];
//        _trackLayer.path=[path CGPath];
        [self.layer addSublayer:_trackLayer];
       
        
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.path=[path CGPath];
      
        _progressLayer.fillColor = nil;
        _progressLayer.strokeEnd = 0;
        //起始点
        _progressLayer.lineCap = kCALineCapSquare;
        _progressLayer.frame = self.bounds;
        
        [self.layer addSublayer:_progressLayer];
        
        //默认5
        self.progressWidth = 5;
    }
    return self;
}
- (void)setTrack
{
    _trackPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:(self.bounds.size.width - _progressWidth)/ 2 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
//        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(40, 40) radius:(PROGREESS_WIDTH-PROGRESS_LINE_WIDTH)/2 startAngle:degreesToRadians(-210) endAngle:degreesToRadians(30) clockwise:YES];
    _trackLayer.path = _trackPath.CGPath;
}

- (void)setProgress
{
   
//    [CATransaction begin];
//    [CATransaction setDisableActions:NO];
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
//    [CATransaction setAnimationDuration:MAIN_SCREEN_ANIMATION_TIME];
//  
//    
//    _progressPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:(self.bounds.size.width - _progressWidth)/ 2 startAngle:- M_PI_2 endAngle:(M_PI * 2) * _progress - M_PI_2 clockwise:YES];
//     _progressLayer.path = _progressPath.CGPath;
//    //_progressLayer.strokeEnd = _progress/100.0;
//    [CATransaction commit];
}


- (void)setProgressWidth:(float)progressWidth
{
    _progressWidth = progressWidth;
    _trackLayer.lineWidth = _progressWidth;
    _progressLayer.lineWidth = _progressWidth;
    
//    [self setTrack];
//    [self setProgress];
}

- (void)setTrackColor:(UIColor *)trackColor
{
    _trackLayer.strokeColor = trackColor.CGColor;
}

- (void)setProgressColor:(UIColor *)progressColor
{
    _progressLayer.strokeColor = progressColor.CGColor;
}

- (void)setProgress:(float)progress
{
    _progress = progress;
    _progressLayer.strokeEnd = progress/100.0;
    //[self setProgress];
}

- (void)setProgress:(float)progress animated:(BOOL)animated
{
    [CATransaction begin];
    [CATransaction setDisableActions:!animated];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:MAIN_SCREEN_ANIMATION_TIME];
    _progressLayer.strokeEnd = progress/100.0;
    [CATransaction commit];
    
    _progress=progress;
    //[self setProgress];
}




@end
