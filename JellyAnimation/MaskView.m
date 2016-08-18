//
//  MaskView.m
//  JellyAnimation
//
//  Created by Wilson Yuan on 16/8/18.
//  Copyright © 2016年 Wilson-Yuan. All rights reserved.
//
#import "MaskView.h"

@interface MaskView ()

@property (strong, nonatomic) CADisplayLink *displyLink;
@property (nonatomic) CGFloat from;
@property (nonatomic) CGFloat to;

@end

@implementation MaskView

//- (CALayer *)layer {
//    return [CAShapeLayer layer];
//}


- (void)startAnimationFrom:(CGFloat)from to:(CGFloat)to {
    
    self.from = from;
    self.to = to;
    
    if (!self.displyLink) {
        self.displyLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(ticks:)];
        [self.displyLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
}

- (void)completeAnimation {
    [self.displyLink invalidate];
    self.displyLink = nil;
}

- (void)ticks:(CADisplayLink *)link {
    [self setNeedsDisplay];
}




- (void)drawRect:(CGRect)rect {
    
    CALayer *layer = self.layer.presentationLayer;
    CGFloat radius = layer.frame.size.width / 2;
    if (!layer) {
        radius = CGRectGetWidth(rect) / 2;
    }
    self.layer.cornerRadius = radius;
    [[UIColor redColor] setFill];
//    self.clipsToBounds = true;
    
//    CGFloat progress = 1 - (self.to - layer.cornerRadius) / (self.to - self.from);
//    CGFloat  (0.5 - fabs(progress - 0.5))
    
//    CGFloat height = CGRectGetHeight(rect);
//    CGFloat deltaHeight = height / 2 * (0.5 - fabs(progress - 0.5));
//    NSLog(@"delta:%f", deltaHeight);
//    
//    CGPoint topLeft = CGPointMake(0, deltaHeight);
//    CGPoint topRight = CGPointMake(CGRectGetWidth(rect), deltaHeight);
//    CGPoint bottomLeft = CGPointMake(0, height);
//    CGPoint bottomRight = CGPointMake(CGRectGetWidth(rect), height);
//    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [[UIColor redColor] setFill];
//    
//    [path moveToPoint:topLeft];
//    [path addQuadCurveToPoint:topRight controlPoint:CGPointMake(CGRectGetMidX(rect), 0)];
//    [path addLineToPoint:bottomRight];
//    [path addQuadCurveToPoint:bottomLeft controlPoint:CGPointMake(CGRectGetMidX(rect), height - deltaHeight)];
//    [path closePath];
//    [path fill];
    
}


//- (void)awakeFromNib {
//    CGFloat height = 300.f;
//    UIBezierPath *bendiPath = [UIBezierPath bezierPath];
//    [bendiPath addArcWithCenter:self.center radius:20 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
//    CAShapeLayer *shape = (CAShapeLayer *)self.layer;
//    
//    shape.path = bendiPath.CGPath;
//    shape.strokeColor = [UIColor blackColor].CGColor;
//    shape.lineWidth = 10.f;
//    shape.fillColor = [UIColor redColor].CGColor;
//    shape.position =CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
//    [shape setNeedsDisplay];
    
//    self.backgroundColor = [UIColor yellowColor];
//    self.layer.cornerRadius = 20;
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
