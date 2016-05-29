//
//  ViewController.m
//  BezierPathDemo
//
//  Created by xuqianlong on 16/5/29.
//  Copyright © 2016年 Debugly. All rights reserved.
//

#import "ViewController.h"
#import "HexagonImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat w = self.view.bounds.size.width;
    HexagonImageView *hexagon = [[HexagonImageView alloc]initWithFrame:CGRectMake(0, 20, w , w)];
   
    hexagon.backgroundColor = [UIColor blueColor];
    hexagon.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    hexagon.layer.borderWidth = 2;//注意：边框是从边界向内延伸的，就是说边框过大，会盖着view上的内容；
    [self.view addSubview:hexagon];
    [hexagon setNeedsDisplay];
    
    //模拟网络图片
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIImage *img = [UIImage imageNamed:@"666.jpeg"];
        hexagon.image = img;
    });
}

@end
