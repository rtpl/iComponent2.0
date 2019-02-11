# ICDataDetector
This library class is used to detect dates, urls and phone number from a passed data value. Data value passed can be of any type like String, array or dictionary etc.

## Uses of library class
You can understand the impoortance of this library by below example:

 Suppose you have a string which consists one or more than one dates with different date formats and you have to get those dates in Date format, then how will you do that? For this you have to use dateformatter. But in dateformatter there is one restriction that you have to specify a date format and pass date in that specified format. If you know formats of dates then also you will have to create multiple date formatter to get Date object and suppose in any case value is getting from server and date format is unknown then how wil you get date object? In that case you can use do this by using this class.
 With this you can detect dates, urls and Phone numbers all.
 ## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

You should have macOS and xcode to build an iOS app. Then you have to install cocoapods in your system and then add this pod in your podfile.
1. [XCode 8.0+](https://itunes.apple.com/us/app/xcode/id497799835?mt=12)
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
pod 'iComponent', :git => 'https://github.com/rtpl/iComponent2.0.git', :branch => 'ICDataDetector'
```

run command to install pod 
```
pod install
```
Now close the xcode project and open prj.xcworkspace instead.


## How to use ICDataDetector

1. After insalling the cocoapod into your project for using this class import *iComponent* in viewcontroller:
```
import iComponent
```

2. Create ICDataDetector objects:
```
var dataDetector = ICDataDetector(detectValue: value)
//value can be any type like string, array or dictionay
```

3. Then for detecting dates, urls or phone number call below functions:

````
let detectedUrl = dataDetector.detectUrl()        //To detect urls
let detecteDates = dataDetector.detectDates()     //To detect dates.
let detectPhoneNumbers = dataDetector.detectPhoneNumbers()    //To detect phone numbers
````

## Author

Created by - Piyush Naredi
