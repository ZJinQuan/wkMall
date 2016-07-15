//
//  LoginViewController.m
//  WkMall
//
//  Created by QUAN on 16/7/12.
//  Copyright © 2016年 QUAN. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //监听键盘高度
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasChange:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyboardWasChange:(NSNotification *)aNotification {
    
    [UIView animateWithDuration:0.3f animations:^{
        
        self.view.y =  -150;
        
    }];
    
}
- (IBAction)clickRegisterBtn:(id)sender {
    
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    registerVC.title = @"注册";
    
    [self.navigationController pushViewController:registerVC animated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    [UIView animateWithDuration:0.3f animations:^{
        
        self.view.y =  64;
        
    }];
}
@end
