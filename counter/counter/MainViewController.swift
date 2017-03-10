//
//  MainViewController.swift
//  counter
//
//  Created by Takashi Wickes on 3/9/17.
//  Copyright © 2017 takashiw. All rights reserved.
//

import UIKit
import MapKit

class MainViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var count: Int?

    @IBOutlet weak var unlockCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        //        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        unlockCountRefresh()
    }
    
    func unlockCountRefresh(){
        count = UserDefaults.standard.integer(forKey: "unlockCount")
        unlockCountLabel.text = String(describing: count!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
