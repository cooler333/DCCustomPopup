//
//  DCViewController.m
//  DCCustomPopupApp
//
//  Created by cooler on 16.06.13.
//  Copyright (c) 2013 Dmitry Utmanov. All rights reserved.
//


#import "DCViewController.h"


@interface DCViewController ()

@end


@implementation DCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(endEditing:)];
    [gestureRecognizer setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:gestureRecognizer];
}

- (IBAction)showPopup:(id)sender {
    [DCCustomPopupView customPopViewWithTitle:titleTextField.text message:subtitleTextView.text image:nil];
}

@end
