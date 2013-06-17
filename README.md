DCCustomPopup
=============

##Example

### Without Popup
<p align="center" >
  <img src="https://dl.dropboxusercontent.com/u/52966385/GitHub/DCCustomPopup/iOS%20Simulator%20Screen%20shot%2016.06.2013%2C%2020.40.25.png" alt="AFNetworking" title="AFNetworking">
</p>

### Default Popup
<p align="center" >
  <img src="https://dl.dropboxusercontent.com/u/52966385/GitHub/DCCustomPopup/iOS%20Simulator%20Screen%20shot%2016.06.2013%2C%2020.40.28.png" alt="AFNetworking" title="AFNetworking">
</p>

### Popup with custom imag
<p align="center" >
  <img src="https://dl.dropboxusercontent.com/u/52966385/GitHub/DCCustomPopup/iOS%20Simulator%20Screen%20shot%2016.06.2013%2C%2020.40.40.png" alt="AFNetworking" title="AFNetworking">
</p>

## Reference

### show popup without instance:
```objective-c
+ (void)customPopViewWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image;
```

### custom init method:
```objective-c
- (DCCustomPopupView *)initWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image;
```

### send this method to instance to show popup:
```objective-c
- (void)show;
```

### delegate method:
```objective-c
- (void)customPopupView:(DCCustomPopupView *)popupView clickedButton:(UIButton *)button;
```
## Example Usage

### 
