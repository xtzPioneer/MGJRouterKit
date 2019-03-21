//
//  TXWebViewController.m
//  MGJRouterDemo
//
//  Created by xtz_pioneer on 2019/3/20.
//  Copyright © 2019 zhangxiong. All rights reserved.
//

#import "TXWebViewController.h"
#import <WebKit/WebKit.h>

/** 监听标题Key */
NSString *const titleKey=@"title";
/** 监听进度Key */
NSString *const estimatedProgressKey=@"estimatedProgress";

@interface TXWebViewController ()<WKUIDelegate,WKNavigationDelegate>
/** webView */
@property (nonatomic,weak)WKWebView *webView;
/** 进度 */
@property (nonatomic,weak)UIProgressView *progressView;
/** 参数 */
@property (nonatomic,strong)NSDictionary *parameters;
@end

@implementation TXWebViewController

/** 路由参数 */
- (void)routeWithParameters:(NSDictionary*)parameters{
    self.parameters=parameters;
}

/** viewDidLoad */
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialization];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}

/** 初始化视图 */
- (void)initialization{
    /*webView*/
    WKWebView *webView=[[WKWebView alloc]init];
    webView.UIDelegate =self;
    webView.navigationDelegate=self;
    NSURL *url=[NSURL URLWithString:self.parameters[MGJRouterParameterUserInfo][@"url"]];
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:5];
    [webView loadRequest:request];
    //添加观察者(进度、标题)
    [webView addObserver:self forKeyPath:titleKey options:NSKeyValueObservingOptionNew context:NULL];
    [webView addObserver:self forKeyPath:estimatedProgressKey options:NSKeyValueObservingOptionNew context:NULL];
    /*progressView*/
    UIProgressView *progressView=[[UIProgressView alloc]init];
    progressView.progress=0;
    progressView.tintColor=[UIColor greenColor];
    /*添加视图*/
    [self.view addSubview:webView];
    [self.view addSubview:progressView];
    /*赋值*/
    self.webView=webView;
    self.progressView=progressView;
}

/** 布局视图 */
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    CGFloat viewW=self.view.frame.size.width;
    CGFloat viewH=self.view.frame.size.height;
    /*webView*/
    CGFloat webViewX=0;
    CGFloat webViewY=self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height;
    CGFloat webViewW=viewW;
    CGFloat webViewH=viewH-webViewY;
    self.webView.frame=CGRectMake(webViewX,webViewY,webViewW,webViewH);
    /*progressView*/
    CGFloat progressViewX=0;
    CGFloat progressViewY=webViewY;
    CGFloat progressViewH=1;
    CGFloat progressViewW=viewW;
    self.progressView.frame=CGRectMake(progressViewX, progressViewY, progressViewW, progressViewH);
}

/** 页面开始加载时调用 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}

/** 当内容开始返回时调用 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}

/** 页面加载完成之后调用 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
}

/** 页面加载失败时调用 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
}

/*
 // 接收到服务器跳转请求之后调用
 - (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
 }
 */

/*
 // 在收到响应后，决定是否跳转
 - (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
 TXLog(@"url:%@",navigationResponse.response.URL.absoluteString);
 // 允许跳转
 decisionHandler(WKNavigationResponsePolicyAllow);
 // 不允许跳转
 //decisionHandler(WKNavigationResponsePolicyCancel);
 }
 // 在发送请求之前，决定是否跳转
 - (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
 NSLog(@"url:%@",navigationAction.request.URL.absoluteString);
 // 允许跳转
 decisionHandler(WKNavigationActionPolicyAllow);
 // 不允许跳转
 //decisionHandler(WKNavigationActionPolicyCancel);
 }
 */

/*
 // 创建一个新的WebView
 - (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures{
 return [[WKWebView alloc]init];
 }
 // 输入框
 - (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler{
 completionHandler(@"http");
 }
 // 确认框
 - (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler{
 NSLog(@"message:%@",message);
 completionHandler(YES);
 }
 */

/** 警告框 */
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    NSLog(@"message:%@",message);
    UIAlertController *controller=[UIAlertController alertControllerWithTitle:@"友情提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *act1=[UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [controller addAction:act1];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:controller animated:YES completion:nil];
    });
    completionHandler();
}

/** 监听加载进度 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:estimatedProgressKey]) {
        if (object==self.webView) {
            [self.progressView setAlpha:1.0f];
            [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
            if(self.webView.estimatedProgress >= 1.0f) {
                [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    [self.progressView setAlpha:0.0f];
                } completion:^(BOOL finished) {
                    [self.progressView setProgress:0.0f animated:NO];
                }];
            }
        }
        else{
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }else if ([keyPath isEqualToString:titleKey]){
        if (object==self.webView) {
            self.title = self.webView.title;
        }else{
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
}

/** dealloc */
- (void)dealloc {
    /*移除监听*/
    [self.webView removeObserver:self forKeyPath:titleKey];
    [self.webView removeObserver:self forKeyPath:estimatedProgressKey];
    self.webView.navigationDelegate=nil;
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** 将要进入 */
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

/** 将要离开 */
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
