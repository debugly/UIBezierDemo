//
//  ArcHeaderViewController.m
//  BezierPathDemo
//
//  Created by xuqianlong on 16/8/31.
//  Copyright © 2016年 Debugly. All rights reserved.
//

#import "ArcHeaderViewController.h"
#import "UIView+QuadCurve.h"

@implementation ArcHeaderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect headerRect = self.view.bounds;
    headerRect.size.height = 240;
    
    UIView *headerView = [[UIView alloc]initWithFrame:headerRect];
    [self.view addSubview:headerView];

    UIImageView *bgView = [[UIImageView alloc]initWithFrame:headerView.bounds];
    bgView.image = [UIImage imageNamed:@"Snip20160831"];
    bgView.contentMode = UIViewContentModeScaleAspectFill;
    bgView.clipsToBounds = YES;
    [headerView addSubview:bgView];
    
    UIVisualEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:effect];
    effectView.frame = headerView.bounds;
    [headerView addSubview:effectView];
    
    CGRect achorRect = CGRectMake((effectView.bounds.size.width - 50)/2.0, (effectView.bounds.size.height - 50)/2.0, 50, 50);
    UIImageView *achorView = [[UIImageView alloc]initWithFrame:achorRect];
    achorView.image = [UIImage imageNamed:@"Snip20160831"];
    achorView.contentMode = UIViewContentModeScaleAspectFill;
    [effectView.contentView addSubview:achorView];
    
    CGFloat upOffset = 80;
    
    [headerView ql_applyBottomQuadCurve:upOffset ctrlOffset:upOffset];
    
    CGRect botomRect = self.view.bounds;
    botomRect.origin.y = headerRect.size.height - upOffset;
    botomRect.size.height -= botomRect.origin.y;
    
    UIView *botomView = [[UIView alloc]initWithFrame:botomRect];
    [self.view insertSubview:botomView atIndex:0];
    botomView.backgroundColor = [UIColor blackColor];

}

@end
