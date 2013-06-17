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

<table>
  <tr><th colspan="2" style="text-align:center;">Core</th></tr>
  <tr>
    <td><a href="http://afnetworking.github.com/AFNetworking/Classes/AFURLConnectionOperation.html">Show popup without instance</a></td>
    <td>```objective-c
    + (void)customPopViewWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image;
        ```
    </td>
    <td>An <tt>NSOperation</tt> that implements the <tt>NSURLConnection</tt> delegate methods.</td>
  </tr>
</table>

### Show popup without instance:
```objective-c
    + (void)customPopViewWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image;
```

### Custom init method:
```objective-c
    - (DCCustomPopupView *)initWithTitle:(NSString *)title message:(NSString *)message image:(UIImage *)image;
```

### Send this method to instance to show popup:
```objective-c
    - (void)show;
```

### delegate method:
```objective-c
    - (void)customPopupView:(DCCustomPopupView *)popupView clickedButton:(UIButton *)button;
``` 

## Example Usage

```objective-c
- (IBAction)showPopup:(id)sender {
    // Show Popup without init
    [DCCustomPopupView customPopViewWithTitle:titleTextField.text message:subtitleTextView.text image:nil];
}

- (IBAction)show:(id)sender {
    // create instance of DCCustomPopupView
    UIImage *image = [UIImage imageNamed:@"alert_no"]; // image: 50x50px || 100x100px(@2x)
    DCCustomPopupView *customPopupView = [[DCCustomPopupView alloc] initWithTitle:@"Title" message:@"Subtitle Subtitle Subtitle" image:image];
    [customPopupView setDelegate:self];
    [customPopupView setTag:1];
    [customPopupView show];
}

- (void)customPopupView:(DCCustomPopupView *)popupView clickedButton:(UIButton *)button {
    if (popupView.tag == 1) {
        NSLog(@"Button was clicked");
    }
}
```
