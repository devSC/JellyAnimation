//
//  ViewController.m
//  JellyAnimation
//
//  Created by Wilson-Yuan on 16/1/31.
//  Copyright © 2016年 Wilson-Yuan. All rights reserved.
//

#import "ViewController.h"
#import "JellyView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet JellyView *jelly;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)play:(id)sender {
    CGFloat from = CGRectGetHeight(self.view.bounds) - CGRectGetHeight(self.jelly.bounds) / 2;
    CGFloat to = 100;
    
    self.jelly.center = CGPointMake(self.jelly.center.x, from);
    
    [self.jelly startAnimationFrom:from to:to];
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.85 initialSpringVelocity:0 options:0 animations:^{
        self.jelly.center = CGPointMake(self.jelly.center.x, to);
    } completion:^(BOOL finished) {
        [self.jelly completeAnimation];
//        self.animating = NO;
    }];

}

@end
