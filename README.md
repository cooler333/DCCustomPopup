DCCustomPopup
=============

Example
-------------

*Without Popup*<br>
![Alt-текст](https://dl.dropboxusercontent.com/u/52966385/GitHub/DCCustomPopup/iOS%20Simulator%20Screen%20shot%2016.06.2013%2C%2020.40.25.png "Какой-то Текст")

Default Popup<br>
![Alt-текст](https://dl.dropboxusercontent.com/u/52966385/GitHub/DCCustomPopup/iOS%20Simulator%20Screen%20shot%2016.06.2013%2C%2020.40.28.png "Какой-то Текст")

Popup with custom image <br>
![Alt-текст](https://dl.dropboxusercontent.com/u/52966385/GitHub/DCCustomPopup/iOS%20Simulator%20Screen%20shot%2016.06.2013%2C%2020.40.40.png "Какой-то Текст")

Reference
------------

//////////////////////////////////////////<br>
**show popup without instance:**
```objective-c
+ (void)customPopViewWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image;
```
//////////////////////////////////////////<br>
**custom init method:**
```objective-c
- (DCCustomPopupView *)initWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image;
```
//////////////////////////////////////////<br>
**send this method to instance to show popup:**
```objective-c
- (void)show;
```
//////////////////////////////////////////<br>
**delegate method:**
```objective-c
- (void)customPopupView:(DCCustomPopupView *)popupView clickedButton:(UIButton *)button;
```
