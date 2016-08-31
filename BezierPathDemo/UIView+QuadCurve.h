//
//  UIView+QuadCurve.h
//  BezierPathDemo
//
//  Created by xuqianlong on 16/8/31.
//  Copyright © 2016年 Debugly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (QuadCurve)

/**
 *  @brief 当前 view 的底部削出来一个口朝上的圆弧
 *  @param upOffset   圆弧和矩形交界处距离原 view 底部的偏移量
 *  @param ctrlOffset 画圆弧的时候需要一个控制点，不能太大，否则会导致露底
 */
- (void)ql_applyBottomQuadCurve:(CGFloat)upOffset
                     ctrlOffset:(CGFloat)ctrlOffset;

@end
