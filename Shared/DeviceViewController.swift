//
//  DeviceViewController.swift
//  SwiftStarter
//
//  Created by Stephen Schiffli on 10/20/15.
//  Copyright © 2015 MbientLab Inc. All rights reserved.
//
import UIKit
import MetaWear


class DeviceViewController: UIViewController {
    
    //all the activity buttons
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button6: UIButton!
    var operation:Int? //decides the operation i.e data collection or user experiment
    
    var activity = -1 // default activity is unknown
    
    @IBOutlet weak var recLabel: UILabel!
    @IBOutlet weak var partiLabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var T1: UITextField!
    @IBOutlet weak var T3: UITextField!
    @IBOutlet weak var T2: UITextField!
    
    
    
    @IBOutlet weak var deviceStatus: UILabel!
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // close the keyboard when users tap one the screen
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target:self,action:#selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        //get the mode from the source view controller
        if let mode = operation {
            
            print("mode in device view controler:\(mode)")
            if mode == 0 {
                // mode ==0 user mode hide all the data collection related buttons labels and textfiels 
                button1.isHidden=true
                button2.isHidden=true
                button3.isHidden=true
                button4.isHidden=true
                button5.isHidden=true
                button6.isHidden=true
                button7.isHidden=true
                button8.isHidden=true
                recLabel.isHidden=true
                partiLabel.isHidden=true
                expLabel.isHidden=true
                T1.isHidden=true
                T2.isHidden=true
                T3.isHidden=true
            
            }
        }
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    @IBAction func unknownPressed(_ sender: UIButton) {
        //button1.isHidden=true
        button1.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        activity = -1 // assign activity variable to 1 i.e. drinking
        //chnage the color of the other buttons
        button3.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button2.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button4.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button5.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button6.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button7.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button8.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
    }
    @IBAction func button2Pressed(_ sender: UIButton) {
        button2.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        activity = 1 // assign activity variable to 0 i.e. smoking
        button3.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button1.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button4.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button5.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button6.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button7.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button8.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
    }
    
    @IBAction func button3Pressed(_ sender: UIButton) {
        button3.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        activity = 0// drinking activity
        button1.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button2.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button4.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button5.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button6.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button7.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button8.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
    }
    
    @IBAction func button4Pressed(_ sender: UIButton) {
        button4.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        activity = 2 // assign 2 to activity states eating
        button3.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button2.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button1.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button5.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button6.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button7.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button8.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
    }
    
    @IBAction func button5Pressed(_ sender: UIButton) {
        button5.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        activity = 3 // assign 3 to activity states phone call
        button3.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button2.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button1.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button4.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button6.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button7.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button8.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
    }
    
    @IBAction func button6Pressed(_ sender: UIButton) {
        button6.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        activity = 4 // assign 4 to activity states Brudshing
        button3.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button2.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button1.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button4.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button5.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button7.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button8.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
    }
    
    @IBAction func button7Pressed(_ sender: UIButton) {
        button7.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        activity = 5 // assign 5 to activity states scratching head
        button3.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button2.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button1.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button4.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button5.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button6.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button8.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
    }
    
    @IBAction func button8Pressed(_ sender: UIButton) {
        button8.backgroundColor = UIColorFromRGB(rgbValue: 0xA2CF64)
        activity = 6 // assign 6 to activity states Yawning
        button3.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button2.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button1.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button4.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button5.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button6.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        button7.backgroundColor = UIColorFromRGB(rgbValue: 0xfd7454)
        
    }
    var device: MBLMetaWear!
    var dataRecord = false
    
   
    //reading the data
    @IBAction func buttonClick(_ sender: UIButton) {
        
        self.dataRecord=true
        print("Clicked");
        
        //sampling frequency
        device.accelerometer?.sampleFrequency = 50
        let text1=T1.text
        let text2=T2.text
        let text3=T3.text
        //get the current data time to set the file name
        let date=Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy'T'HH:mm:ssZZZZ"
        let fileName=text1!+text2!+text3!+dateFormatter.string(from: date)
        //let fileName = text1
        
        deviceStatus.text="file name \(fileName)";
        
        let DocumentDirURL = try!FileManager.default.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("csv")
        deviceStatus.text = "file name \(fileURL.path)";//file path
        print(fileURL.path)
        var data="";
        
        // collect the data
        device.accelerometer?.dataReadyEvent.startNotificationsAsync(handler: {(obj , error) in if let obj = obj {
            self.deviceStatus.text="Data recording"
            if self.dataRecord == false {
                self.deviceStatus.text="Data recording stopped"
            }
            if self.dataRecord == true {
                let currentDateTime = Date().timeIntervalSinceReferenceDate // to fetch the exact date "let someotherDate =Date(timeIntervalSinceReferenceDate:-123456789.0)
                data = data + "\(currentDateTime),\(obj.x),\(obj.y),\(obj.z),\(self.activity)\n"
                
           
                
                
            print ("Time = \(currentDateTime), X= \(obj.x), Y = \(obj.y), Z= \(obj.z), activity = \(self.activity)") //Time = \(currentDateTime)
                
                
                
            }
            
            }
            do{ //writing to the file
                try data.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                //data.append
                //print ("Time = \(currentDateTime), X= \(obj.x), Y = \(obj.y), Z= \(obj.z)") //Time = \(currentDateTime)
            }catch let error as NSError{
                print("Failed writing to file ")
                print(error)
            }
    })
    }

    //stop reading
    @IBAction func stopRecord(_ sender: UIButton) {
          self.deviceStatus.text="Data collecting stopped "
        self.dataRecord = false
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        
        deviceStatus.text = "Connecting"
        device.connectAsync().success { _ in
            self.deviceStatus.text = "Connected"
            print("We are connected")
            self.device.led?.flashColorAsync(UIColor.green, withIntensity: 1.0, numberOfFlashes: 3)
            if let configuration = self.device.configuration as? DeviceConfiguration {
                self.deviceStatus.text = "Downloading"
                configuration.temperatureFilter?.downloadLogAndStopLoggingAsync(false).success { array in
                    self.deviceStatus.text = "Connected"
                    array.forEach { print ($0) }
                    }.failure { error in
                        self.deviceStatus.text = error.localizedDescription
                }
            }
            }.failure { error in
                self.deviceStatus.text = error.localizedDescription
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        device.led?.flashColorAsync(UIColor.red, withIntensity: 1.0, numberOfFlashes: 3)
        device.disconnectAsync()
    }
}
