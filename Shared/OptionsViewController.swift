//
//  OptionsViewController.swift
//  iOS
//
//  Created by VEERENDRA KUMAR AKKI on 21/5/18.
//  Copyright © 2018 MBIENTLAB, INC. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {
    
    
    @IBOutlet weak var dataCollection_button1: UIButton!
    @IBOutlet weak var userExperiment_button2: UIButton!
    var mode=0
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    @IBAction func dataCollectionPressed(_ sender: UIButton) {
        
        mode=1 //mode 1 indicates the data collection operation
        
        //change the color of the button to green when pressed other wise same as of the default color
        dataCollection_button1.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        userExperiment_button2.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        
    }
    
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        print("user experiment pressed ")
        performSegue(withIdentifier: "segue2", sender: self)
    }
    @IBAction func userExperimentPressed(_ sender: UIButton) {
        mode=0 // user experiment operation
        //change the color of the button to green when pressed
        userExperiment_button2.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        dataCollection_button1.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //prepare a segue for data transfer
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("inside destination prepare\(mode)")
        //let destination = segue.destination as? ScanTableViewController
        if segue.identifier == "segue2"{
            print("inside destination \(mode)")
            //var destination1 = segue.destination as! UINavigationController
            let target = segue.destination as! MainTableViewController
            target.intOperation = mode
        }
        
        //destination.activityNumber = activity
        // print("dest\(destination.activityNumber)")
        
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
