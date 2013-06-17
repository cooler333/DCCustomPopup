DCCustomPopup
=============

## Example

### View without Popup
<p align="left" >
  <img src="https://dl.dropboxusercontent.com/u/52966385/GitHub/DCCustomPopup/iOS%20Simulator%20Screen%20shot%2016.06.2013%2C%2020.40.25.png" alt="AFNetworking" title="AFNetworking">
</p>

### Show Default Popup
<p align="left" >
  <img src="https://dl.dropboxusercontent.com/u/52966385/GitHub/DCCustomPopup/iOS%20Simulator%20Screen%20shot%2016.06.2013%2C%2020.40.28.png" alt="AFNetworking" title="AFNetworking">
</p>

### Show Popup with custom image
<p align="left" >
  <img src="https://dl.dropboxusercontent.com/u/52966385/GitHub/DCCustomPopup/iOS%20Simulator%20Screen%20shot%2016.06.2013%2C%2020.40.40.png" alt="AFNetworking" title="AFNetworking">
</p>

## Reference

### Show popup without instance:
```objective-c
    + (void)customPopViewWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image;
```
```objective-c
    [DCCustomPopupView customPopViewWithTitle:titleTextField.text message:subtitleTextView.text image:nil];
```

### Custom init method:
```objective-c
    - (DCCustomPopupView *)initWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image;
```
```objective-c
    UIImage *image = [UIImage imageNamed:@"alert_no"];
    customPopupView = [[DCCustomPopupView alloc] initWithTitle:@"Title" message:@"Subtitle Subtitle Subtitle" image:image];
    [customPopupView setDelegate:self];
    [customPopupView setTag:1];
    [customPopupView show];
```

### Send this method to instance to show popup:
```objective-c
    - (void)show;
```

### delegate method:
```objective-c
    - (void)customPopupView:(DCCustomPopupView *)popupView clickedButton:(UIButton *)button;
``` 
