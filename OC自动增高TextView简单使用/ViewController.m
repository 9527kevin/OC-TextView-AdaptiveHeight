//
//  ViewController.m
//  OC自动增高TextView简单使用
//
//  Created by 邓泽淼 on 16/5/4.
//  Copyright © 2016年 DZM. All rights reserved.
//

#import "ViewController.h"
#import "DZMInputView.h"

@interface ViewController ()<UITextViewDelegate>

@property (nonatomic,strong) DZMInputView *inputview;

@property (weak, nonatomic) IBOutlet DZMInputView *xibInputView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.inputview = [[DZMInputView alloc] init];
    self.inputview.textView.tag = 0;
    self.inputview.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.inputview];
    self.inputview.textView.delegate = self;
    self.inputview.frame = CGRectMake(10, 100, 100, [self.inputview height]);
    
    
    self.xibInputView.inset = UIEdgeInsetsMake(5, 50, 5, 5);
    self.xibInputView.textView.delegate = self;
    self.xibInputView.textView.tag = 1;
}

// 实现textView的代理进行边输入边变化
- (void)textViewDidChange:(UITextView *)textView
{
    __weak ViewController *weakSelf = self;
    [UIView animateWithDuration:self.inputview.animationDuration animations:^{
        
        if (textView.tag == 0) { // 代码
            
            weakSelf.inputview.frame = CGRectMake(weakSelf.inputview.frame.origin.x, weakSelf.inputview.frame.origin.y, weakSelf.inputview.frame.size.width, [weakSelf.inputview height]);
            
        }else{ // XIB
            
            weakSelf.xibInputView.frame = CGRectMake(weakSelf.xibInputView.frame.origin.x, weakSelf.xibInputView.frame.origin.y, weakSelf.xibInputView.frame.size.width, [weakSelf.xibInputView height]);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
