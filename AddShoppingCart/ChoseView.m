//
//  ChoseView.m
//  AddShoppingCart
//
//  Created by Superman on 2018/7/16.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "ChoseView.h"

@implementation ChoseView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //半透明视图
        _alphaiView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _alphaiView.backgroundColor = [UIColor blackColor];
        _alphaiView.alpha = 0.2;
        [self addSubview:_alphaiView];
        //装载商品信息的视图
        _whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.frame.size.width, self.frame.size.height-200)];
        _whiteView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_whiteView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [_whiteView addGestureRecognizer:tap];
        
        //商品图片
        _img = [[UIImageView alloc] initWithFrame:CGRectMake(10, -20, 100, 100)];
        _img.image = [UIImage imageNamed:@"1.jpg"];
        _img.backgroundColor = [UIColor yellowColor];
        _img.layer.cornerRadius = 4;
        _img.layer.borderColor = [UIColor whiteColor].CGColor;
        _img.layer.borderWidth = 5;
        [_img.layer setMasksToBounds:YES];
        [_whiteView addSubview:_img];
        
        _bt_cancle= [UIButton buttonWithType:UIButtonTypeCustom];
        _bt_cancle.frame = CGRectMake(_whiteView.frame.size.width-40, 10,30, 30);
        [_bt_cancle setBackgroundImage:[UIImage imageNamed:@"close@3x"] forState:0];
        [_whiteView addSubview:_bt_cancle];
        
        //商品价格
        _lb_price = [[UILabel alloc] initWithFrame:CGRectMake(_img.frame.origin.x+_img.frame.size.width+20, 10, _whiteView.frame.size.width-(_img.frame.origin.x+_img.frame.size.width+40+40), 20)];
        _lb_price.textColor = [UIColor redColor];
        _lb_price.font = [UIFont systemFontOfSize:14];
        [_whiteView addSubview:_lb_price];
        //商品库存
        _lb_stock = [[UILabel alloc] initWithFrame:CGRectMake(_img.frame.origin.x+_img.frame.size.width+20, _lb_price.frame.origin.y+_lb_price.frame.size.height, _whiteView.frame.size.width-(_img.frame.origin.x+_img.frame.size.width+40+40), 20)];
        _lb_stock.textColor = [UIColor blackColor];
        _lb_stock.font = [UIFont systemFontOfSize:14];
        [_whiteView addSubview:_lb_stock];
        //用户所选择商品的尺码和颜色
        _lb_detail = [[UILabel alloc] initWithFrame:CGRectMake(_img.frame.origin.x+_img.frame.size.width+20, _lb_stock.frame.origin.y+_lb_stock.frame.size.height, _whiteView.frame.size.width-(_img.frame.origin.x+_img.frame.size.width+40+40), 40)];
        _lb_detail.numberOfLines = 2;
        _lb_detail.textColor = [UIColor blackColor];
        _lb_detail.font = [UIFont systemFontOfSize:14];
        [_whiteView addSubview:_lb_detail];
        //分界线
        _lb_line = [[UILabel alloc] initWithFrame:CGRectMake(0, _img.frame.origin.y+_img.frame.size.height+20, _whiteView.frame.size.width, 0.5)];
        _lb_line.backgroundColor = [UIColor lightGrayColor];
        [_whiteView addSubview:_lb_line];
        
        //确定按钮
        _bt_sure= [UIButton buttonWithType:UIButtonTypeCustom];
        _bt_sure.frame = CGRectMake(0, _whiteView.frame.size.height-50,_whiteView.frame.size.width, 50);
        [_bt_sure setBackgroundColor:[UIColor redColor]];
        [_bt_sure setTitleColor:[UIColor whiteColor] forState:0];
        _bt_sure.titleLabel.font = [UIFont systemFontOfSize:20];
        [_bt_sure setTitle:@"确定" forState:0];
        [_whiteView addSubview:_bt_sure];
        
        //有的商品尺码和颜色分类特别多 所以用UIScrollView 分类过多显示不全的时候可滑动查看
        _mainscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _lb_line.frame.origin.y+_lb_line.frame.size.height, _whiteView.frame.size.width, _bt_sure.frame.origin.y-(_lb_line.frame.origin.y+_lb_line.frame.size.height))];
        _mainscrollview.showsHorizontalScrollIndicator = NO;
        _mainscrollview.showsVerticalScrollIndicator = NO;
        [_whiteView addSubview:_mainscrollview];
        //购买数量的视图
        _countView = [[BuyCountView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
        [_mainscrollview addSubview:_countView];
        
        [_countView.bt_add addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
        _countView.tf_count.delegate = self;
        [_countView.bt_reduce addTarget:self action:@selector(reduce) forControlEvents:UIControlEventTouchUpInside];
        

    }
    return self;
}
-(void)add
{
    int count =[_countView.tf_count.text intValue];
    if (count < self.stock) {
        _countView.tf_count.text = [NSString stringWithFormat:@"%d",count+1];
    }else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数量超出范围" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.tag = 100;
        [alert show];
    }
}
-(void)reduce
{
    int count =[_countView.tf_count.text intValue];
    if (count > 1) {
        _countView.tf_count.text = [NSString stringWithFormat:@"%d",count-1];
    }else
    {
        //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数量超出范围" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        //        alert.tag = 100;
        //        [alert show];
    }
}
#pragma mark-tf
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _mainscrollview.contentOffset = CGPointMake(0, _countView.frame.origin.y);
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    int count =[_countView.tf_count.text intValue];
    if (count > self.stock) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数量超出范围" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.tag = 100;
        [alert show];
        _countView.tf_count.text = [NSString stringWithFormat:@"%d",self.stock];
        [self tap];
    }
}
-(void)tap
{
    _mainscrollview.contentOffset = CGPointMake(0, 0);
    [_countView.tf_count resignFirstResponder];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
