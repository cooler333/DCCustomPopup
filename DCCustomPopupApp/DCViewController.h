//
//  DCViewController.h
//  DCCustomPopupApp
//
//  Created by cooler on 16.06.13.
//  Copyright (c) 2013 Dmitry Utmanov. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "DCCustomPopupView.h"


@interface DCViewController : UIViewController {
    
    DCCustomPopupView *customPopupView;
    
    __weak IBOutlet UITextField *titleTextField;
    __weak IBOutlet UITextView *subtitleTextView;
    
}

- (IBAction)showPopup:(id)sender;

@end
