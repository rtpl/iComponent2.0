# ICLocation Permission 

In most of time we need to get current location while development and therefore you have to write a lots of line to get location. This component helps you to get location via calling only a single function and get it in callback. 


## Requirenments:

1. [XCode 8.0](https://itunes.apple.com/us/app/xcode/id497799835?mt=12)
2. [Cocoapods](https://guides.cocoapods.org/using/getting-started.html) 1.2.x or higher



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
pod 'ICLocationPermission'
```

run command to insatll 
```
pod install
```
Now close the xcode project and open prj.xcworkspace instead.


3. After insalling the cocoapod into your project import *ICLocationPermission*
```
import ICLocationPermission
import CoreLocation
```

4.  We are trying to access location of device, thus we have to add 2 keys(*NSLocationAlwaysAndWhenInUseUsageDescription*, *NSLocationAlwaysAndWhenInUseUsageDescription*) for privacy in *info.plist* file with there appropriate description.



## A single method

- After you have completed all the steps of setup write down below code in your ViewController and run the app using either run command[cmd+r] or hit play icon on tool bar.

``` Swift

ICLocationPermission.sharedInstance.getCurrentLocation(alwaysInUse: true, target: self, userLocationClosure: { (userLocationArray: NSArray) 

if let cllocation = userLocationArray.lastObject as? CLLocation {
let latitude = cllocation.coordinate.latitude
let longitude = cllocation.coordinate.longitude
}
}

```


## Possible cases

Congrats! you have completed your coding part. While you run the application very first time device alert will show to get permission for either permit to use location or not and there might be some possible cases:

1. If you allow the permission it will give you current location simply.
2. And in case of you don't allow then a alert will show on screen with *Location Service Disable* message and a setting option which will navigate you to app setting page to enable the location.
