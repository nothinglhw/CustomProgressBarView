//
//  ViewController.m
//  customProgressBar
//
//  Created by nothinglhw on 14-7-23.
//  Copyright (c) 2014年 nothinglhw. All rights reserved.
//

#import "ViewController.h"
#import "CustomProgressBarView.h"

@interface ViewController ()
{
    CustomProgressBarView *_progress;
}


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _progress = [[CustomProgressBarView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    [self.view addSubview:_progress];
    _progress.trackColor = [UIColor blackColor];
    _progress.progressColor = [UIColor orangeColor];
   // progress.progress=.7;
    [NSTimer scheduledTimerWithTimeInterval:.3 target:self selector:@selector(function:) userInfo:nil repeats:YES];
  
    _progress.progressWidth = 10;
}


-(void)function:(NSTimer *)timer
{
    static CGFloat progress=0;
    progress+=100;
    [_progress setProgress:progress animated:YES];
}



@end
