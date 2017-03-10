//
//  ViewController.swift
//  counter
//
//  Created by Takashi Wickes on 3/9/17.
//  Copyright © 2017 takashiw. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locking: Bool?
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class DeviceStatus : NSObject {
    
    func locked(){
        print("device locked") // Handle Device Locked events here.
    }
    
    func unlocked(){
        print("device unlocked") //Handle Device Unlocked events here.
    }
}
