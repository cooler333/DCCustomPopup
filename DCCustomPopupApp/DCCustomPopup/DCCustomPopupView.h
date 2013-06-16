//
//  DCCustomPopupView.h
//  Superbody
//
//  Created by Дмитрий Утьманов on 3/26/13.
//  Copyright (c) 2013 Artem Poluektov. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DCCustomPopupViewDelegate;


@interface DCCustomPopupView : UIView {
    UILabel *_titleLabel;
    UILabel *_textLabel;
    UIImageView *_imageView;
    UIButton *_dismissButton;
}

@property id <DCCustomPopupViewDelegate> delegate;

+ (void)customPopViewWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image;
- (DCCustomPopupView *)initWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image;
- (void)show;

@end


@protocol DCCustomPopupViewDelegate <NSObject>

@required

- (void)customPopupView:(DCCustomPopupView *)popupView clickedButton:(UIButton *)button;

@end