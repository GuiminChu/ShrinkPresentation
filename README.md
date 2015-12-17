# ShrinkPresentation
ShrinkPresentation makes it easy to shrink the previous view controller when presenting a new one modally.

## Screenshot

![Screenshot](https://github.com/GuiminChu/ShrinkPresentation/blob/master/Screenshot.gif)

## Requirements

- iOS 8.0+
- Xcode 7

##Integration

####CocoaPods (iOS 8+)
You can use [Cocoapods](http://cocoapods.org/) to install `ShrinkPresentation`by adding it to your `Podfile`:
```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
	pod 'ShrinkPresentation', '~> 0.1.0'
end
```
Note that this requires CocoaPods version 36, and your iOS deployment target to be at least 8.0:

####Manually (iOS 8+)

Clone the repo and add files under Source folder to your project.

## Usage

Make your presented view controller as a subclass of ShrinkViewController, then present it as usual.

```swift
class MenuViewController: ShrinkViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
```

## License

ShrinkPresentation is released under the MIT license. See LICENSE for details.
