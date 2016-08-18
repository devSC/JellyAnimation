//
//  ViewController3.m
//  JellyAnimation
//
//  Created by Wilson Yuan on 16/8/18.
//  Copyright © 2016年 Wilson-Yuan. All rights reserved.
//

#import "ViewController3.h"
#import <POP.h>
#import "MaskView.h"

@interface ViewController3 ()

@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) MaskView *maskView;

@property (nonatomic) CGFloat height;
@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *bkview = [[UIView alloc] initWithFrame:self.view.bounds];
    bkview.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_backgroundView = bkview];
    
    
    MaskView *msview = [[MaskView alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    msview.backgroundColor = [UIColor yellowColor];
    msview.layer.cornerRadius = 12;
    msview.clipsToBounds = true;
    msview.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height - 50);
    [self.view addSubview:_maskView = msview];
    
    self.backgroundView.maskView = _maskView;
    
    
    /*
    POPAnimatableProperty *property = [POPAnimatableProperty propertyWithName:@"height" initializer:^(POPMutableAnimatableProperty *prop) {
        prop.readBlock = ^(ViewController3 *controller, CGFloat values[]) {
            values[0] = controller.height;
        };
        
        prop.writeBlock = ^(ViewController3 *controller, const CGFloat values[]) {
            
            controller.height = values[0];
            
            CGRect rect = _maskView.frame;
            rect.size = CGSizeMake(controller.height, controller.height);
            _maskView.frame = rect;
            _maskView.center = self.view.center;
            _maskView.layer.cornerRadius = controller.height / 2;
            _maskView.clipsToBounds = YES;
        };
        
    }];
    
    POPSpringAnimation *ani = [POPSpringAnimation animation];
    ani.fromValue = @(24);
    ani.toValue = @(800);
    ani.property = property;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self pop_addAnimation:ani forKey:@"ss"];
    });
     */
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.maskView startAnimationFrom:24 to:800];
        CGRect rect = self.maskView.frame;
        rect.size = CGSizeMake(800, 800);
        [UIView animateWithDuration:.4 animations:^{
            self.maskView.frame = rect;
            self.maskView.center = self.view.center;
        } completion:^(BOOL finished) {
            [self.maskView completeAnimation];
        }];
    });

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
