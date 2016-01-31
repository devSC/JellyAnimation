//
//  JellyView.m
//  JellyAnimation
//
//  Created by Wilson-Yuan on 16/1/31.
//  Copyright © 2016年 Wilson-Yuan. All rights reserved.
//

#import "JellyView.h"

@interface JellyView ()

@property (strong, nonatomic) CADisplayLink *displyLink;
@property (nonatomic) CGFloat from;
@property (nonatomic) CGFloat to;


@end

@implementation JellyView

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
    
    CGFloat progress = 1 - (layer.position.y - self.to) / (self.from - self.to);
    
    CGFloat height = CGRectGetHeight(rect);
    CGFloat deltaHeight = height / 2 * (0.5 - fabs(progress - 0.5));
    NSLog(@"delta:%f", deltaHeight);

    CGPoint topLeft = CGPointMake(0, deltaHeight);
    CGPoint topRight = CGPointMake(CGRectGetWidth(rect), deltaHeight);
    CGPoint bottomLeft = CGPointMake(0, height);
    CGPoint bottomRight = CGPointMake(CGRectGetWidth(rect), height);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [[UIColor redColor] setFill];
    
    [path moveToPoint:topLeft];
    [path addQuadCurveToPoint:topRight controlPoint:CGPointMake(CGRectGetMidX(rect), 0)];
    [path addLineToPoint:bottomRight];
    [path addQuadCurveToPoint:bottomLeft controlPoint:CGPointMake(CGRectGetMidX(rect), height - deltaHeight)];
    [path closePath];
    [path fill];
    
}

@end
