//
//  DataDetector.swift
//  DataDetectorDemo
//
//  Created by Piyush Naredi on 30/01/19.
//  Copyright © 2019 Piyush Naredi. All rights reserved.
//

import Foundation

/**This class is used to detect links, dates and phone number from passed value of any type
 
 This class is used to detect dates, urls and phone number from passed string, array or dictionary. It detects respected data from passed value and returns array of detected values.
 For detecting values we have value to be detected by creating insance of it and then have to call following methods to detect respected data:
 
 detectUrls() - To detect urls
 detectDates() - To detect dates
 detectPhoneNumbers() - To detect phone numbers
 */
class ICDataDetector {
    var detectValue: String = ""
    
    /**
    initialization method of DataDetector
     - parameter detectValue: Value to be detected
     
     ### Usage Example: ###
     ````
     DataDetector(detectValue: "")
     DataDetector(detectValue: []])
     DataDetector(detectValue: [[]]])
     ````
 */
    required init(detectValue: Any) {
        self.detectValue = (detectValue as AnyObject).description
    }
    
    ///This function detects urls from passed value and return array of detected urls
    func detectUrls() -> [URL] {
        let detectedLinks = self.performDetection(detectorType: [.link]) as? [URL] ?? []
        return detectedLinks
    }
    
    ///This function detects Dates from passed value and return array of detected dates
    func detectDates() -> [Date] {
        let detectedDates = self.performDetection(detectorType: [.date]) as? [Date] ?? []
        return detectedDates
    }
    
    ///This function detects phone number from passed value and return array of phone numbers
    func detectPhoneNumbers() -> [String] {
        let detectedPhoneNumber = self.performDetection(detectorType: [.phoneNumber]) as? [String] ?? []
        return detectedPhoneNumber
    }
    
    ///This function is to perform detection of passed values
   private func performDetection(detectorType: NSTextCheckingResult.CheckingType) -> [Any] {
        let aDetector = try? NSDataDetector(types: detectorType.rawValue)
        let detectionRange = NSMakeRange(0, detectValue.count)
        let checkingMatches = aDetector?.matches(in: detectValue, options: [], range: detectionRange)
        var detectedValues = [Any]()
        
        if let newMatches = checkingMatches {
            for match in newMatches {
                switch match.resultType {
                case .date:
                    detectedValues.append(match.date!)
                    
                case .link:
                    detectedValues.append(match.url!)
                    
                case .phoneNumber:
                    detectedValues.append(match.phoneNumber!)
                    
                default:
                    print("No matches found")
                }
            }
        } else {
            print("No matches found")
        }
        return detectedValues
    }
}
