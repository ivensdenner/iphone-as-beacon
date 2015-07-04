//
//  ViewController.swift
//  Exercicio02-iPhoneAsBeacon
//
//  Created by Ivens Denner on 02/07/15.
//  Copyright (c) 2015 Ivens Denner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var minorTextField: UITextField!
    
    // MARK: -
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "modalSegue"
        {
            if let destinationVC = segue.destinationViewController as? AdvertiserViewController {
                if majorTextField.text != "" {
                    destinationVC.major = majorTextField.text.toInt()!
                } else {
                    destinationVC.major = 0
                }
                
                if minorTextField.text != "" {
                    destinationVC.minor = minorTextField.text.toInt()!
                } else {
                    destinationVC.minor = 0
                }
            }
        }
    }
    
}
