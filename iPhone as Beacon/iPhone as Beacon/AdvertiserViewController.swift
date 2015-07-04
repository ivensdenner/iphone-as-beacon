//
//  AdvertiserViewController.swift
//  Exercicio02-iPhoneAsBeacon
//
//  Created by Ivens Denner on 02/07/15.
//  Copyright (c) 2015 Ivens Denner. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreLocation

class AdvertiserViewController: UIViewController, CBPeripheralManagerDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var proximityUUIDLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var minorLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: -
    
    
    let proximityUUID = NSUUID(UUIDString: "489FC4C2-F996-4CB3-A252-ECD29B39DC61")
    var major = 0
    var minor = 0
    var beaconRegion = CLBeaconRegion()
    var peripheralManager = CBPeripheralManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Create the beacon region.
        self.beaconRegion = CLBeaconRegion(proximityUUID: proximityUUID, major: CLBeaconMajorValue(major), minor: CLBeaconMinorValue(minor), identifier: "denner")
        // Create the peripheral
        peripheralManager = CBPeripheralManager(delegate: self, queue:nil)
        
        proximityUUIDLabel.text = proximityUUID?.UUIDString
        majorLabel.text = "\(major)"
        minorLabel.text = "\(minor)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        switch peripheral.state {
        case .PoweredOn:
            println("Peripheral device powered on")
            // Create a dictionary of advertisement data.
            let beaconPeripheralData = self.beaconRegion.peripheralDataWithMeasuredPower(nil)
            // Start advertising your beacon's data.
            peripheralManager.startAdvertising(beaconPeripheralData as [NSObject : AnyObject])
            
            self.activityIndicator.hidden = false
            self.activityIndicator.startAnimating()
        default:
            println("Peripheral device isn't powered on")
            self.activityIndicator.hidden = true
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        if peripheralManager.state == .PoweredOn {
            peripheralManager.stopAdvertising()
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
