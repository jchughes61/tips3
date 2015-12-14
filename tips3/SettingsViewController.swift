//
//  SettingsViewController.swift
//  Tip Jar
//
//  Created by Jacob Hughes on 12/13/15.
//  Copyright © 2015 Jacob Hughes. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var TipPercentageControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ValueChanged(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(TipPercentageControl.selectedSegmentIndex, forKey: "DefaultSetting")
        defaults.synchronize()
    }

    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        TipPercentageControl.selectedSegmentIndex = defaults.integerForKey("DefaultSetting")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}