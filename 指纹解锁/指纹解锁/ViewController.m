//
//  ViewController.m
//  指纹解锁
//
//  Created by 李献红 on 16/2/29.
//  Copyright © 2016年 李献红. All rights reserved.
//

#import "ViewController.h"
//#import <LAContext.h>
@import LocalAuthentication;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self zhiwen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self zhiwen];
}

- (void)zhiwen {

    //创建LAContext
     LAContext *ctx = [[LAContext alloc] init];
    // 判断设备是否支持指纹识别
    if ([ctx canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:NULL]) {
        
        NSLog(@"指纹解锁可以使用");
        //这里如果不设置，就会显示输入密码
        ctx.localizedFallbackTitle = @"使用手势密码";
        [ctx evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
            localizedReason:NSLocalizedString(@"解锁该应用", nil)
                      reply:^(BOOL success, NSError *error) {
                          if (success) {
                              NSLog(@"解锁成功，进入主应用");
                          } else {
                              //这里可以不设置，就不会有输入密码按钮
                              if (error.code == kLAErrorUserFallback) {
                                  NSLog(@"点击输入密码");
                                  
                              } else if (error.code == kLAErrorUserCancel) {
                                  NSLog(@"用户点击取消,跳转到手势解锁");
                              } else {
                                  NSLog(@"解锁失败");
                              }
                          }
                          }];
         
       
        
        
        } else {
            
            NSLog(@"---手势解锁");
          //密码验证方法
            
 }
}
@end
