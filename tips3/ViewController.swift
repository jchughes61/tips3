//
//  ViewController.swift
//  tips3
//
//  Created by Jacob Hughes on 12/9/15.
//  Copyright © 2015 Jacob Hughes. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField:
        UITextField!
    @IBOutlet weak var tipLabel:
        UILabel!
    @IBOutlet weak var totalLabel:
        UILabel!
    
    @IBOutlet weak var twoPeople: UILabel!
    @IBOutlet weak var threePeople: UILabel!
    @IBOutlet weak var fourPeople: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Made the keyboard pop up at beginning
        billField.becomeFirstResponder()
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        twoPeople.text = "$0.00"
        threePeople.text = "$0.00"
        fourPeople.text = "$0.00"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let lastEdit: NSDate? = defaults.objectForKey("LastUsed") as! NSDate?
        
        if lastEdit != nil
        {
            let timeInterval: NSTimeInterval = NSDate().timeIntervalSinceDate(lastEdit!)
            if timeInterval <= 600 {
                billField.text = defaults.objectForKey("billAmount") as? String
                onEditingChanged(self)
            }
        else {
            billField.text = ""
            onEditingChanged(self)
        }
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        @IBAction func onEditingChanged(sender: AnyObject) {
        
            let defaults = NSUserDefaults.standardUserDefaults()
            
            let tipPercentages = [0.18, 0.20, 0.22]
            let LastUsed = NSDate()
            
            defaults.setObject(LastUsed, forKey: "Dates")
            defaults.setObject(billField.text, forKey: "billAmount")
            
            let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
            
            let billAmount = NSString(string: billField.text!).doubleValue
            
            let tip = billAmount * tipPercentage
            let total = billAmount + tip
            
            let twoPeople1 = (total/2)
            let threePeople1 = (total/3)
            let fourPeople1 = (total/4)
            
            // Localized the Currency
            let formatter = NSNumberFormatter()
            formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
            formatter.locale = NSLocale.currentLocale()
            
            tipLabel.text = formatter.stringFromNumber(tip)
            totalLabel.text = formatter.stringFromNumber(total)
            twoPeople.text = formatter.stringFromNumber(twoPeople1)
            threePeople.text = formatter.stringFromNumber(threePeople1)
            fourPeople.text = formatter.stringFromNumber(fourPeople1)
            
            
            //tipLabel.text = String(format: "$%.2f", tip)
            //totalLabel.text = String(format: "$%.2f", total)
            
            
            
    }

    @IBAction func onTap(sender: AnyObject)
    {
        view.endEditing(true)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("DefaultSetting")
        onEditingChanged(self)
        
        
        let ColorScheme = defaults.integerForKey("Color")
        
        if ColorScheme == 0
        {
            self.view.backgroundColor = UIColor.greenColor()
        }
        else
        {
            self.view.backgroundColor = UIColor.yellowColor()
        }
    }
    
}
    
    
    


