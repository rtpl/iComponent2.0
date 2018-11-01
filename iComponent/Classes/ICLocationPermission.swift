//
//  ILocationPermission.swift
//  imReporter
//
//  Created by Kritika Middha on 16/03/17.
//  Copyright © 2017 Ranosys. All rights reserved.
//

import UIKit
import CoreLocation

private let cancel                                  = "Cancel"
private let settings                                = "Settings"
private let locationServiceAlertTittle              = "Location Service Disabled"
private let locationServiceAlertMessage: String     = "Your location service is not enabled for the app. \n\nTo enable go Setting >> %@ >> Location, then enable it."

/**
 ILocationPermission class is for get current location of user.
 */

final public class ICLocationPermission: NSObject {
    // MARK: - Variables
    /// Location manager variable.
    var locationManager: CLLocationManager?

    /// Instance variable of "IlocationPermission" class.
    public static let sharedInstance = ICLocationPermission()

    /// Global location mananger clouser.
    var locationManagerClosures: [((_ userLocationArray: NSArray) -> Void)] = []

    // MARK: - Functions
    /**
     initialization and setup of location
     */
   private override init() {
        super.init()

        self.locationManager = CLLocationManager()
        guard let locationManager = self.locationManager else {
            return
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 200
        locationManager.delegate = self
    }

    /**
     Check location manager's service status and authorization status.

     - parameter target: refrence of view controller for ILocationPermissionDelegate delegate object.
     */
    public func getCurrentLocation(alwaysInUse: Bool, target: UIViewController, userLocationClosure: @escaping ((_ userLocationArray: NSArray) -> Void)) {

        if alwaysInUse {
            self.locationManager!.requestAlwaysAuthorization()
        } else {
            self.locationManager!.requestWhenInUseAuthorization()
        }

        self.locationManagerClosures.append(userLocationClosure)

        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .restricted, .denied:
                showAlertForEnableLocations(target: target)

            case .authorizedAlways, .authorizedWhenInUse:
                DispatchQueue.main.async {
                    self.locationManager?.startUpdatingLocation()
                }

            default: break
            }
        } else {
            showAlertForEnableLocations(target: target)
        }
    }

    /**
     Show alert method to show alert when location manager's service status/authorization status is disable.
     
     - parameter target: refrence of view controller to show alert.
     */
    func showAlertForEnableLocations(target: UIViewController) {
        guard let appName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as? String else {
            return
        }
        let alert = UIAlertController.init(title: locationServiceAlertTittle, message: String(format: locationServiceAlertMessage, appName), preferredStyle: .alert)

        let settingsButton = UIAlertAction.init(title: settings, style: .default) { _ -> Void in

            if let urlObj = URL(string: UIApplicationOpenSettingsURLString), UIApplication.shared.canOpenURL(urlObj) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(urlObj, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                }
            }
        }

        let cancelButton = UIAlertAction.init(title: cancel, style: .cancel, handler: nil)

        alert.addAction(settingsButton)
        alert.addAction(cancelButton)
        target.present(alert, animated: true, completion: nil)
    }

    /**
     A method to stop update location.
     */
    public func stopLocation() {
        locationManager?.stopUpdatingLocation()
    }
}

// MARK: - CLLocation Manager Delegates
extension ICLocationPermission: CLLocationManagerDelegate {

    // CLLocation Manager delegates
    /**
     Tells the delegate that new location data is available.
     
     - parameter manager: The location manager object that generated the update event..
     - parameter locations: An array of CLLocation objects containing the location data. This array always contains at least one object representing the current location.
     */
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let tempClosures = self.locationManagerClosures
        for closure in tempClosures {
            closure(locations as NSArray)
        }
        self.locationManagerClosures = []
    }

    /**
     Tells the delegate that the authorization status for the application changed.
     
     - parameter manager: The location manager object that generated the update event..
     - parameter locations: The new authorization status for the application.
     */
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {

        case .restricted, .denied, .notDetermined:
            self.stopLocation()

        case .authorizedAlways, .authorizedWhenInUse: break

        }
    }

    /**
     Tells the delegate that the location manager was unable to retrieve a location value.
     
     - parameter manager: The location manager object that generated the update event..
     - parameter locations: The error object containing the reason the location or heading could not be retrieved.
     */
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.stopLocation()
    }
}
