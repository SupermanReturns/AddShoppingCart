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

@property(nonatomic, strong)UIView *alphaiView;
@property(nonatomic, strong)UIView *whiteView;

@property(nonatomic, strong)UIImageView *img;

@property(nonatomic, strong)UILabel *lb_price;
@property(nonatomic, strong)UILabel *lb_stock;
@property(nonatomic, strong)UILabel *lb_detail;
@property(nonatomic, strong)UILabel *lb_line;

@property(nonatomic, strong)UIScrollView *mainscrollview;

@property(nonatomic, strong)TypeView *sizeView;
@property(nonatomic, strong)TypeView *colorView;
@property(nonatomic, strong)BuyCountView *countView;

@property(nonatomic, strong)UIButton *bt_sure;
@property(nonatomic, strong)UIButton *bt_cancle;

@property(nonatomic) int stock;
@end
