//
//  ViewController.swift
//  Example
//
//  Created by Kritika on 1/11/18.
//  Copyright © 2018 ranosys. All rights reserved.
//

import UIKit
import CoreLocation
import iComponent

class ViewController: UIViewController {
    // MARK: - IBActions
    /// local variable of latitude.
    @IBOutlet weak var latitudeLabel: UITextField!
    @IBOutlet weak var longitudeLabel: UITextField!

    // MARK: - View Controller Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "iLocation Permission"
        
        getCurrentLocation()
    }

    // MARK: - IBActions
    @IBAction func getCurrentLocation() {

        ICLocationPermission.sharedInstance.getCurrentLocation(alwaysInUse: true, target: self, userLocationClosure: { [weak self] (userLocationArray: NSArray) in

            guard let location = userLocationArray.lastObject as? CLLocation else {
                return print("Something went wrong")
            }
            self?.showCurrentLocation(cllocation: location)
        })
    }

    // MARK: - Methods
    func showCurrentLocation(cllocation: CLLocation) {
        latitudeLabel.text = "\(cllocation.coordinate.latitude)"
        longitudeLabel.text = "\(cllocation.coordinate.longitude)"
    }
}
