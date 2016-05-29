//
//  HexagonImageView.h
//  BezierPathDemo
//
//  Created by xuqianlong on 16/5/29.
//  Copyright © 2016年 Debugly. All rights reserved.
//

@import UIKit;

//不能继承UIImageView，然后重写他的drawRect方法；

//http://stackoverflow.com/questions/2612152/drawrect-not-being-called-in-my-subclass-of-uiimageview
//The UIImageView class is optimized to draw its images to the display. UIImageView will not call drawRect: in a subclass. If your subclass needs custom drawing code, it is recommended you use UIView as the base class.

@interface HexagonImageView : UIView

@property (nonatomic, strong) UIImage *image;

@end
