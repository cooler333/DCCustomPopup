//
//  DCCustomPopupView.m
//  Superbody
//
//  Created by Дмитрий Утьманов on 3/26/13.
//  Copyright (c) 2013 Artem Poluektov. All rights reserved.
//

#import "DCCustomPopupView.h"
#import <QuartzCore/QuartzCore.h>

// Set visibility duration
static const CGFloat kDuration = 3;
static const CGFloat popUpTextWidth = 200.0;

// Static queue variable
static NSArray *popup;


@interface DCCustomPopupView ()
//
@property (nonatomic, readonly) UILabel *titleLabel;
@property (nonatomic, readonly) UILabel *textLabel;
@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) UIButton *dismissButton;

- (void)fadePopupOut;
+ (void)showPopupInView:(UIView *)parentView;

@end


@implementation DCCustomPopupView

#pragma mark - Public

- (DCCustomPopupView *)initWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image {
    if ((self = [self initWithFrame:CGRectZero])) {
        // Add corner radius
        self.backgroundColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:0.9];
        self.layer.cornerRadius = 5;
        self.autoresizingMask = UIViewAutoresizingNone;
        self.autoresizesSubviews = NO;
        
        if (title && title.length) {
            // Init titleLabel
            _titleLabel = [[UILabel alloc] init];
            _titleLabel.text = title;
            _titleLabel.numberOfLines = 0;
            _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _titleLabel.textAlignment = NSTextAlignmentCenter;
            _titleLabel.minimumScaleFactor = 1.0;
            _titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0f];
            _titleLabel.textColor = [UIColor whiteColor];
            _titleLabel.adjustsFontSizeToFitWidth = NO;
            _titleLabel.backgroundColor = [UIColor clearColor];
            [_titleLabel sizeToFit];
        }
        
        // Init label
        _textLabel = [[UILabel alloc] init];
        _textLabel.text = message;
        _textLabel.numberOfLines = 0;
        _textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.minimumScaleFactor = 1.0;
        _textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.adjustsFontSizeToFitWidth = NO;
        _textLabel.backgroundColor = [UIColor clearColor];
        [_textLabel sizeToFit];
        
        // Init button 
        _dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dismissButton setBackgroundImage:[UIImage imageNamed:@"alert_button_grey"] forState:UIControlStateNormal];
        [_dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_dismissButton setTitle:@"OK" forState:UIControlStateNormal];
        [[_dismissButton titleLabel] setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0f]];
        [_dismissButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat titleHeight = [title sizeWithFont:_titleLabel.font constrainedToSize:CGSizeMake(popUpTextWidth-20, 9999)].height;
        CGRect titleLabelRect = CGRectMake(0, 70, popUpTextWidth, titleHeight);
        
        CGFloat textHeight;
        CGRect textLabelRect;
        CGRect dismissButtonRect;
        if (title && title.length) {
            textHeight = [message sizeWithFont:_textLabel.font constrainedToSize:CGSizeMake(popUpTextWidth-20, 9999)].height;
            textLabelRect = CGRectMake(0, 70+titleHeight+10, popUpTextWidth, textHeight);
            
            dismissButtonRect = CGRectMake(10, titleLabelRect.size.height+textLabelRect.size.height+20+60+10, popUpTextWidth, 44);

        } else {
            textHeight = [message sizeWithFont:_textLabel.font constrainedToSize:CGSizeMake(popUpTextWidth-20, 9999)].height;
            textLabelRect = CGRectMake(0, 70+titleHeight, popUpTextWidth, textHeight);
            
            dismissButtonRect = CGRectMake(10, titleLabelRect.size.height+textLabelRect.size.height+20+60, popUpTextWidth, 44);
        }
        
        // Init and add image
        _imageView = [[UIImageView alloc] init];
        if (image) {
            NSLog(@"init popup with custom image");
            [_imageView setImage:image];
        } else {
            NSLog(@"init popup without custom image");
            [_imageView setImage:[UIImage imageNamed:@"alert_yes"]];
        }
        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
        _imageView.frame = CGRectMake(80, 10, 60, 50);
        [self addSubview:_imageView];

        // add title
        if (title && title.length) {
            [_titleLabel setFrame:CGRectOffset(titleLabelRect, 10, 5)];
            [self addSubview:_titleLabel];
        }
        
        //add label
        _textLabel.frame = CGRectOffset(textLabelRect, 10, 5);
        [self addSubview:_textLabel];
        //add button
        [_dismissButton setFrame:dismissButtonRect];
        [self addSubview:_dismissButton];
        
        CGFloat width = popUpTextWidth + 20;
        CGFloat height;
        if (title && title.length) {
            height = textHeight + titleHeight + 20 + 60 + 44 + 10 + 10;
        } else {
            height = textHeight + titleHeight + 20 + 60 + 44 + 10;
        }
        [self setFrame:CGRectMake([[UIApplication sharedApplication] keyWindow].frame.size.width/2 - width/2, [[UIApplication sharedApplication] keyWindow].frame.size.height/2 - height/2, width, height)];
        self.alpha = 0.0f;
    }
	return self;
}

- (void)show {
    if (popup == nil) {
        popup = [[NSArray alloc] initWithObjects:self, nil];
        [DCCustomPopupView showPopupInView:[[UIApplication sharedApplication] keyWindow]];
    }
}

+ (void)customPopViewWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image {
    // Add new instance to queue
    DCCustomPopupView *view = [[DCCustomPopupView alloc] initWithTitle:title message:message image:image];
    
    if (popup == nil) {
        popup = [[NSArray alloc] initWithObjects:view, nil];
        [DCCustomPopupView showPopupInView:[[UIApplication sharedApplication] keyWindow]];
    }
}

#pragma mark - Private

- (void)buttonClicked {
    [self fadePopupOut];
    if ([self.delegate respondsToSelector:@selector(customPopupView:clickedButton:)]) {
        NSLog(@"Delegate Method For Custom Popup View");
        [_delegate customPopupView:self clickedButton:_dismissButton];
    }
}

- (void)fadePopupOut {
	// Fade in parent view
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.alpha = 0.f;
                     }
                     completion:^(BOOL finished){
                         [self removeFromSuperview];
                         popup = nil;
                     }];
}


+ (void)showPopupInView:(id)parentView {
    [parentView endEditing:YES];
    DCCustomPopupView *view = [popup lastObject];

    // Fade into parent view
    [parentView addSubview:view];
    [UIView animateWithDuration:0.5  delay:0 options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         view.alpha = 1.0;
                     } completion:^(BOOL finished){}];
    
    // Start timer for fade out
//    [view performSelector:@selector(fadePopupOut) withObject:nil afterDelay:kDuration];
}

@end
