//
//  ChoseView.h
//  AddShoppingCart
//
//  Created by Superman on 2018/7/16.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TypeView.h"
#import "BuyCountView.h"


@interface ChoseView : UIView<UITextFieldDelegate,UIAlertViewDelegate>

@property(nonatomic, retain)UIView *alphaiView;
@property(nonatomic, retain)UIView *whiteView;

@property(nonatomic, retain)UIImageView *img;

@property(nonatomic, retain)UILabel *lb_price;
@property(nonatomic, retain)UILabel *lb_stock;
@property(nonatomic, retain)UILabel *lb_detail;
@property(nonatomic, retain)UILabel *lb_line;

@property(nonatomic, retain)UIScrollView *mainscrollview;

@property(nonatomic, retain)TypeView *sizeView;
@property(nonatomic, retain)TypeView *colorView;
@property(nonatomic, retain)BuyCountView *countView;

@property(nonatomic, retain)UIButton *bt_sure;
@property(nonatomic, retain)UIButton *bt_cancle;

@property(nonatomic) int stock;
@end
