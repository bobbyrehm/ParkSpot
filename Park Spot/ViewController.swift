//
//  ViewController.swift
//  Park Spot
//
//  Created by Robert Rehm on 7/9/15.
//  Copyright (c) 2015 Rehmix. All rights reserved.
//

import UIKit

let SPOT_KEY = "PARKING_SPOT_KEY"

class ViewController: UIViewController {
    
    let spots: [String] = ["Stairway 2", "Stairway 3", "Parking Garage"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let alertController = UIAlertController(title: "Park Spot", message: "Previous Spot: \(getPreviousSpot())", preferredStyle: UIAlertControllerStyle.Alert)
        for spot in spots {
            let action = UIAlertAction(title: spot, style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction) -> Void in
                self.setSpot(spot)
            })
            alertController.addAction(action)
        }
        let closeAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel) { (action: UIAlertAction) -> Void in
            abort()
        }
        alertController.addAction(closeAction)
        self.presentViewController(alertController, animated: true, completion: nil);
    }
    
    func setSpot(spot: String) {
        NSUserDefaults.standardUserDefaults().setValue(spot, forKey: SPOT_KEY)
        abort()
    }
    
    func getPreviousSpot() -> String {
        if let previousSpot = NSUserDefaults.standardUserDefaults().valueForKey(SPOT_KEY) as? String {
            return previousSpot
        } else {
            return "None"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

