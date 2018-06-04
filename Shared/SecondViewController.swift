//
//  SecondViewController.swift
//  iOS
//
//  Created by VEERENDRA KUMAR AKKI on 15/5/18.
//  Copyright © 2018 MBIENTLAB, INC. All rights reserved.
//

import UIKit
import MetaWear
class SecondViewController: UIViewController {
    var deviceStatus: UILabel!
    var device: MBLMetaWear!
    var dataRecord = false
    var activity = -1 // -1 as unknown activity
    
    @IBAction func smokingActivity(_ sender: UIButton) {
        activity = 0 // 0 labeled for smoking activity
    }
    
    @IBAction func drinkingActivity(_ sender: UIButton) {
        activity = 1 // 1 labeled as drinking
    }
    
    @IBAction func eatingActivity(_ sender: Any) {
        activity = 2 //2 for  eating
    }
    //reading the data
    @IBAction func buttonClick(_ sender: UIButton) {
        self.dataRecord=true
        print("Clicked");
        
        //sampling frequency
        device.accelerometer?.sampleFrequency = 100
        
        //get the current data time to set the file name
        let date=Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy'T'HH:mm:ssZZZZ"
        let fileName=dateFormatter.string(from: date)
        deviceStatus.text="file name \(fileName)";
        
        let DocumentDirURL = try!FileManager.default.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("csv")
        deviceStatus.text = "file name \(fileURL.path)";//file path
        print(fileURL.path)
        var data="";
        
        // collect the data
        device.accelerometer?.dataReadyEvent.startNotificationsAsync(handler: {(obj , error) in if let obj = obj {
            self.deviceStatus.text="Data collecting"
            
            if self.dataRecord == true {
                let currentDateTime = Date().timeIntervalSinceReferenceDate // to fetch the exact date "let someotherDate =Date(timeIntervalSinceReferenceDate:-123456789.0)
                data = data + "\n Time = \(currentDateTime), X= \(obj.x), Y = \(obj.y), Z= \(obj.z),\(self.activity)" //Time = \(currentDateTime)
                
                
                
                
                print ("Time = \(currentDateTime), X= \(obj.x), Y = \(obj.y), Z= \(obj.z),\(self.activity)") //Time = \(currentDateTime)
                //writing to the file
                
            }
            
            }
            do{
                try data.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                //data.append
                //print ("Time = \(currentDateTime), X= \(obj.x), Y = \(obj.y), Z= \(obj.z)") //Time = \(currentDateTime)
            }catch let error as NSError{
                print("Failed writing to file ")
                print(error)
            }
        })
    }
    
    @IBAction func start(_ sender: UIButton)
    {
        self.dataRecord=true
        print("Clicked");
        
        //sampling frequency
        device.accelerometer?.sampleFrequency = 100
        
        //get the current data time to set the file name
        let date=Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy'T'HH:mm:ssZZZZ"
        let fileName=dateFormatter.string(from: date)
        deviceStatus.text="file name \(fileName)";
        
        let DocumentDirURL = try!FileManager.default.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("csv")
        deviceStatus.text = "file name \(fileURL.path)";//file path
        print(fileURL.path)
        var data="";
        
        // collect the data
        device.accelerometer?.dataReadyEvent.startNotificationsAsync(handler: {(obj , error) in if let obj = obj {
            self.deviceStatus.text="Data collecting"
            
            if self.dataRecord == true {
                let currentDateTime = Date().timeIntervalSinceReferenceDate // to fetch the exact date "let someotherDate =Date(timeIntervalSinceReferenceDate:-123456789.0)
                data = data + "\n Time = \(currentDateTime), X= \(obj.x), Y = \(obj.y), Z= \(obj.z),\(self.activity)" //Time = \(currentDateTime)
                
                
                
                
                print ("Time = \(currentDateTime), X= \(obj.x), Y = \(obj.y), Z= \(obj.z),\(self.activity)") //Time = \(currentDateTime)
                //writing to the file
                
            }
            
            }
            do{
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
        self.dataRecord = false
        self.deviceStatus.text="Data collecting stopped "
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
