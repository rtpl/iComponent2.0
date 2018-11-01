//
//  ICToastView.swift
//  iComponents
//
//  New Version 2.0
//  Created by Mradul Mathur on 28/03/17.
//  Copyright © 2017 Ranosys. All rights reserved.
//

import Foundation
import UIKit

// Class is created to show toastview instead of alert...
public extension UIViewController {

    /**
     Call this function for showing toastview with dynamic time constraint.
     - Parameters:
     - message: Pass your alert message in String.
     - withDuration: Parameter use to manage time interval for toast view.
     
     ### Usage Example: ###
     ````
     showToast(message : "Process completed!!!", withDuration:5.0)
     ````
     */
    public func showToast(message : String, withDuration:CGFloat) {
        let font = UIFont.systemFont(ofSize: 16.0)
        let labelWidth = self.view.frame.size.width - 40
        let labelTextHeight = self.getLabelHeight(text: message, font: font, width: labelWidth)
        let labelTextWidth = self.getLabelWidth(text: message, font: font, width: labelWidth)
        let toastLabel = UILabel(frame: CGRect(x: (self.view.frame.size.width - labelTextWidth)/2 , y: self.view.frame.size.height - labelTextHeight - 40, width: labelTextWidth, height: labelTextHeight + 10))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.numberOfLines = 0
        toastLabel.textAlignment = .center
        toastLabel.font = font
        toastLabel.alpha = 1.0
        toastLabel.text = message
        toastLabel.layer.cornerRadius = 15
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: TimeInterval(withDuration), delay: 0.2, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    /**
     Call this function to get message actual height.
     - Parameters:
     - text: Pass String.
     - font: Pass required font.
     - width: Pass required width.
     
     ### Usage Example: ###
     ````
     let labelTextHeight = self.getLabelHeight(text: "This is an message string", font: UIFont.systemFont(ofSize: 16.0), width: self.view.frame.size.width - 40)
     ````
     */
    public func getLabelHeight(text:String, font:UIFont, width:CGFloat) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width , height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height > 100 ? 100 : label.frame.height
    }

    //Code snippet to get message actual width
    /**
     Call this function to get message actual width.
     - Parameters:
     - text: Pass String.
     - font: Pass required font.
     - width: Pass required width.
     
     ### Usage Example: ###
     ````
     let labelTextWidth = self.getLabelWidth(text: "This is an message string", font: UIFont.systemFont(ofSize: 16.0), width: self.view.frame.size.width - 40)
     ````
     */
    public func getLabelWidth(text:String, font:UIFont, width:CGFloat) -> CGFloat {
        let dummyLabel = UILabel.init()
        dummyLabel.text = text
        return dummyLabel.intrinsicContentSize.width > width ? width : dummyLabel.intrinsicContentSize.width + 10
    }
}
