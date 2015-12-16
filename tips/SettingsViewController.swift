//
//  SettingsViewController.swift
//  tips
//
//  Created by christopher soria on 12/3/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var segControl: UISegmentedControl!
    var lowestTip: Float!
    var midTip: Float!
    var highestTip: Float!
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var defaultField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        // Do any additional setup after loading the view.
        


        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        

        lowestTip = userDefaults.floatForKey("lowest_tip");
        midTip = userDefaults.floatForKey("mid_tip");
        highestTip = userDefaults.floatForKey("highest_tip");
        
        segControl.setTitle("\(lowestTip)%", forSegmentAtIndex: 0)
        segControl.setTitle("\(midTip)%", forSegmentAtIndex: 1)
        segControl.setTitle("\(highestTip)%", forSegmentAtIndex: 2)
        userDefaults.synchronize()
        
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        userDefaults.setFloat(lowestTip, forKey: "lowest_tip")
        userDefaults.setFloat(midTip, forKey: "mid_tip")
        userDefaults.setFloat(highestTip, forKey: "highest_tip")
        userDefaults.synchronize()
        
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func segControlTapped(sender: AnyObject) {
    print(segControl.selectedSegmentIndex)
        print(defaultField.text)
        if segControl.selectedSegmentIndex == 0 {
            defaultField.text = "\(lowestTip)"
        }
        if segControl.selectedSegmentIndex == 1 {
            defaultField.text = "\(midTip)"
        }
        if segControl.selectedSegmentIndex == 2 {
            defaultField.text = "\(highestTip)"
        }
        

    }
    
    @IBAction func defaultInputTyped(sender: AnyObject){
        print(defaultField.text)
        if segControl.selectedSegmentIndex == 0 {
            lowestTip = NSString(string: defaultField.text!).floatValue
        }
        if segControl.selectedSegmentIndex == 1 {
            midTip = NSString(string: defaultField.text!).floatValue
        }
        if segControl.selectedSegmentIndex == 2 {
            highestTip = NSString(string: defaultField.text!).floatValue
        }


        segControl.setTitle(defaultField.text, forSegmentAtIndex: segControl.selectedSegmentIndex)
        
        

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
