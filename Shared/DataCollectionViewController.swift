//
//  DataCollectionViewController.swift
//  iOS
//
//  Created by VEERENDRA KUMAR AKKI on 15/5/18.
//  Copyright © 2018 MBIENTLAB, INC. All rights reserved.
//

import UIKit

class DataCollectionViewController: UIViewController {

    var activity = -1
    @IBOutlet weak var button1: UIButton!//unknown
    @IBOutlet weak var button2: UIButton!//Drinking
    @IBOutlet weak var button3: UIButton!//Eating
    @IBOutlet weak var button4: UIButton!//Smoking
    //let color = UIColor(RED:255,GREEN:115,BLUE:78)
    // when user clicks the unknown activity button
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    @IBAction func unknownButton(_ sender: UIButton)
    {
        button1.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        activity = -1 // assign activity variable to 1 i.e. drinking
        button3.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button2.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button4.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
    }
    
    //when the user press the drinking button
    @IBAction func drinkingButton(_ sender: UIButton)
    {
        button2.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        activity = 1 // assign activity variable to 1 i.e. drinking
        button3.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button1.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button4.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
    }
    
    //When user presses eating
    @IBAction func eattingButton(_ sender: UIButton)
    {
        button3.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        activity = 2 // eating activity
        button1.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button2.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button4.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
    }
    
    @IBAction func smokingButton(_ sender: UIButton)
    {
        button4.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        activity = 0 // assign 0 to activity states smoking
        button3.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button2.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button1.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //prepare a segue for data transfer
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("inside destination prepare\(activity)")
        //let destination = segue.destination as? ScanTableViewController
        if segue.identifier == "segue1"{
            print("inside destination \(activity)")
   //var destination1 = segue.destination as! UINavigationController
        let target = segue.destination as! MainTableViewController
            target.activityNumber = activity
        }
        
        //destination.activityNumber = activity
       // print("dest\(destination.activityNumber)")
        
    }
    
    // when user press begin button
    @IBAction func beginPressed(_ sender: UIButton)
    {
        print("begin pressed ")
    performSegue(withIdentifier: "segue1", sender: self)
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
