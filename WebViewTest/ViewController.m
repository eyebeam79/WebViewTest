//
//  ViewController.m
//  WebViewTest
//
//  Created by Jinho Son on 2014. 1. 7..
//  Copyright (c) 2014년 STD1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@end

@implementation ViewController

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked)
    {
        NSLog(@"링크클릭은금지!");
        return NO;
    }
    
    return YES;
}

// 에러처리
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSString *msg = [error localizedDescription];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"에러" message:msg delegate:nil cancelButtonTitle:@"확인" otherButtonTitles: nil];
    [alert show];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self go:nil];
    
    return YES;
}

- (IBAction)go:(id)sender
{
    if ([self.textField.text length]>3)
    {
        NSURL *url = [NSURL URLWithString:self.textField.text];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
        
        // 키보드감추기
        [self.textField resignFirstResponder];
    }

}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
