//
//  HexagonImageView.m
//  BezierPathDemo
//
//  Created by xuqianlong on 16/5/29.
//  Copyright © 2016年 Debugly. All rights reserved.
//
//http://stackoverflow.com/questions/18947516/import-vs-import-ios-7

#import "HexagonImageView.h"
@import QuartzCore;
@import Foundation;
@import UIKit;

@implementation HexagonImageView

- (void)setImage:(UIImage *)image
{
    if (_image != image) {
        _image = image;
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
    if(!self.image)return;
    
    const CGFloat width = MIN(rect.size.width, rect.size.height) / 2;
    
    CGFloat maxRadius;//外接圆半径
    UIBezierPath *hexPath = nil;
    {
        hexPath = [UIBezierPath bezierPath];
        hexPath.lineWidth = 6;
        hexPath.lineJoinStyle = kCGLineJoinRound;
        
        // 想到顶点必定在外接圆上，故写每个点的坐标都可以和角度，半径建立起关系；
        {
            const CGFloat radius = width - hexPath.lineWidth/2;
            maxRadius = radius;
            CGFloat angle = 30;
            
            for (int i =1; i <= 6; i++) {
                CGFloat x = cos(angle * M_PI/180) * radius;
                CGFloat y = sin(angle * M_PI/180) * radius;
                
                CGPoint p = CGPointMake(x, y);
                
                if (i == 1) {
                    [hexPath moveToPoint:p];
                }else{
                    [hexPath addLineToPoint:p];
                }
                angle += 60;
            }
            
            [hexPath closePath];
        }
        
        //坐标系平移；这个可省了不少事情，我们专注于计算坐标就好了
        {
            CGAffineTransform transform = CGAffineTransformIdentity;
            
            transform = CGAffineTransformMakeTranslation(rect.size.width/2, rect.size.height/2);
            
            [hexPath applyTransform:transform];
        }
        
        // 要裁剪掉六边形外的区域；
        [hexPath addClip];
    }

    UIBezierPath *circlePath = nil;
    {
        circlePath = [UIBezierPath bezierPath];
        circlePath.lineWidth = 3;
        //半径不得小于 maxRadius / 2 * sqrt(3) ,否则将显示为圆;
        const CGFloat radius = maxRadius - 10;
        
        [circlePath addArcWithCenter:CGPointZero radius:radius startAngle:0 endAngle:2*M_PI clockwise:YES];
        //坐标系平移；这个可省了不少事情，我们专注于计算坐标就好了
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform = CGAffineTransformMakeTranslation(rect.size.width/2, rect.size.height/2);
        [circlePath applyTransform:transform];
        
        //要裁剪掉圆形外的区域；
        [circlePath addClip];
    }
    
    //不单独裁切，而是合并之后再裁切；
//    {
//        [hexPath appendPath:circlePath];
//        
//        [hexPath addClip];
//    }
    
    //注意，必须是先裁剪，再画img，否则裁剪无效；
    [self.image drawInRect:rect];
    
    return;
    
    //观察 stroke 和 fill ；
    {
        [[UIColor redColor]setStroke];
        [[UIColor greenColor]setFill];
        
        [hexPath fillWithBlendMode:kCGBlendModeNormal alpha:0.5];
        [hexPath strokeWithBlendMode:kCGBlendModeNormal alpha:1];
        
        [[UIColor purpleColor]setStroke];
        [[UIColor orangeColor]setFill];

        [circlePath fillWithBlendMode:kCGBlendModeNormal alpha:0.5];
        [circlePath strokeWithBlendMode:kCGBlendModeNormal alpha:1];
    }
}

@end

//手动创建一个正六边形的path，分别计算6个顶点的坐标，然后手动拼接连线；如下：
//    CGFloat y1 = -w;
//    CGFloat x1 = 0;
//
//    [path moveToPoint:CGPointMake(x1,y1)];
//
//    CGFloat x2 = w/2 * sqrt(3);
//    CGFloat y2 = -w/2;
//    [path addLineToPoint:CGPointMake(x2, y2)];
//
//    CGFloat y3 = -y2;
//    CGFloat x3 = x2;
//
//    [path addLineToPoint:CGPointMake(x3, y3)];
//
//    CGFloat y4 = -y1;
//    CGFloat x4 = x1;
//
//    [path addLineToPoint:CGPointMake(x4, y4)];
//
//    CGFloat y5 = y3;
//    CGFloat x5 = -x3;
//
//    [path addLineToPoint:CGPointMake(x5, y5)];
//
//    CGFloat y6 = y2;
//    CGFloat x6 = -x2;
//
//    [path addLineToPoint:CGPointMake(x6, y6)];