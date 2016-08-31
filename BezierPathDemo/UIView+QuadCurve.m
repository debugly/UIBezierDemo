//
//  UIView+QuadCurve.m
//  BezierPathDemo
//
//  Created by xuqianlong on 16/8/31.
//  Copyright © 2016年 Debugly. All rights reserved.
//

#import "UIView+QuadCurve.h"

@implementation UIView (QuadCurve)

- (void)ql_applyBottomQuadCurve:(CGFloat)upOffset
                     ctrlOffset:(CGFloat)ctrlOffset
{
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    CGFloat x = self.bounds.origin.x;
    CGFloat y = self.bounds.origin.y;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 0;
    
    [bezierPath moveToPoint:self.bounds.origin];
    [bezierPath addLineToPoint:CGPointMake(width, y)];
    [bezierPath addLineToPoint:CGPointMake(width, y + height - upOffset)];
    
    [bezierPath addQuadCurveToPoint:CGPointMake(x ,y + height - upOffset)
                       controlPoint:CGPointMake(width/2.0, y + height - upOffset + ctrlOffset)];
    
    [bezierPath addLineToPoint:CGPointMake(x, y + height - upOffset)];
    [bezierPath closePath];
    
    CAShapeLayer * curveLayer = [CAShapeLayer layer];
    curveLayer.lineWidth = 0;
    curveLayer.path = [bezierPath CGPath];

    self.layer.mask = curveLayer;
}

@end
