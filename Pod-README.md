#Custom Loader

ICLoader is a library created to custom loader. Progress Indicators, spinner, activity indicator or loader, is a good thing. Great for showing users that something is going on in the app, i.e. that downloading process has started.

In most of time we need to get custom loader apart from activity indicator and therefore you have to write a lots of line to customize loader. This component helps you to get loader using app icon and progress percentage via calling only a single function and get it in callback.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You should have macOS and xcode to build an iOS app. Then you have to install cocoapods in your system and then add this pod in your podfile.
1. [XCode 8.0](https://itunes.apple.com/us/app/xcode/id497799835?mt=12)
2. [Cocoapods](https://guides.cocoapods.org/using/getting-started.html)

## Setup

1. In a new terminal window, run `pod install --repo-update` to install and update.
*you can skip this case if you have updated pod in you mac.*

2. Get [Cocoapods](https://cocoapods.org/), 

Create the podfile in your project.
```
pod init
```

Open the pod file from directory and add pods in podfile.
```
pod 'iComponent', :git => 'https://github.com/rtpl/iComponent2.0.git', :branch => 'ICLoader'
```

run command to insatll 
```
pod install
```
Now close the xcode project and open prj.xcworkspace instead.


3. After insalling the cocoapod into your project import *ICLoader*
```
import iComponent
import ICLoader
```

### How to use ICLoader
- After you have completed all the steps of setup write down below code in your ViewController and run the app using either run command[cmd+r] or hit play icon on tool bar.

1.) If you want custom loader with app icon
``` Swift

 let activityIndicator = CustomActivityIndicatorView.init (loaderActivityType: .KMLoaderWithAppIcon, loaderActivityPresentType: .KMPresentOnView, target: self, appImage: #imageLiteral(resourceName: "appicon"), loadingImage: #imageLiteral(resourceName: "loader"), loadingText: "Loading...", textColor: UIColor.green, textFont: UIFont.systemFont(ofSize: 13), strokeColor: UIColor.purple, strokeWidth: 5.0, percent: 0.0)
            activityIndicator.startAnimating()
            
let loaderTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(stopLoader), userInfo: nil, repeats: true)

```


2.) If you want custom loader with progress images
``` Swift
let activityIndicator = CustomActivityIndicatorView.init(loaderActivityType: .KMLoaderWithProgress, loaderActivityPresentType: .KMPresentOnWindow, target: self, appImage: #imageLiteral(resourceName: "appicon"), loadingImage: #imageLiteral(resourceName: "loader"), loadingText: "Loading... \(loadedFileCount) / \(noOfFiles)", textColor: UIColor.red, textFont: UIFont.systemFont(ofSize: 13), strokeColor: UIColor.purple, strokeWidth: 5.0, percent: 0.0)
            activityIndicator.startAnimating()
            
 let loaderTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.increamentSpin), userInfo: nil, repeats: true)
            
```

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

Created by - Kritika Middha

Updated by - Himani Sharma

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc
