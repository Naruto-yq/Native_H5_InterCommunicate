//
//  HomeViewController.m
//  Native_H5_InterCommunicate
//
//  Created by 余钦 on 16/3/22.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UIWebViewDelegate, HomeJsExport>
@property(nonatomic, weak)UIWebView *webView;
@property(nonatomic, strong) JSContext *context;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupSubviews];
}

- (void)SetupSubviews
{
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    self.webView = webView;
    self.webView.delegate = self;
    NSString *path = [[[NSBundle mainBundle]bundlePath] stringByAppendingPathComponent:@"/www/Application/home.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    [self.webView loadRequest:request];
}


#pragma mark ---- UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    self.context.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue)
    {
        //打印异常
        context.exception = exceptionValue;
        NSLog(@"%@", exceptionValue);
    };
    
    self.context[@"native"] = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- JSExport Methods
- (void)pushViewController:(NSString *)ControlerName title:(NSString *)title
{
    Class nextVcClass = NSClassFromString(ControlerName);
    id nextVc = [[nextVcClass alloc]init];
    ((UIViewController *)nextVc).title = title;
    [self.navigationController pushViewController:nextVc animated:YES];
}

- (void)showAlertController
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"注意" message:@"我是在H5中被调用的！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];

}
@end
