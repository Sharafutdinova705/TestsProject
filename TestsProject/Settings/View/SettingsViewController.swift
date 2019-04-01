//
//  SettingsViewController.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, SettingsViewInput {
    
    var output: SettingsViewOutput!
    @IBOutlet weak var typeOfMediaSegmentedControl: UISegmentedControl!
    @IBOutlet weak var countOfResultTextField: UITextField!
    @IBOutlet weak var kindOfDeviceSegmentedControl: UISegmentedControl!
    var settings: Settings = Settings(typeOfMedia: "", countOfResult: 0, kindOfDevice: "")
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.obtainSettings()
    }
    
    func updateSettingsInVC(settings: Settings) {
        self.settings = settings
        
        switch settings.typeOfMedia {
        case "music":
            typeOfMediaSegmentedControl.selectedSegmentIndex = 0
        case "movie":
            typeOfMediaSegmentedControl.selectedSegmentIndex = 1
        case "tvShow":
            typeOfMediaSegmentedControl.selectedSegmentIndex = 2
        case "podcast":
            typeOfMediaSegmentedControl.selectedSegmentIndex = 3
        case "audiobook":
            typeOfMediaSegmentedControl.selectedSegmentIndex = 4
        case "software":
            typeOfMediaSegmentedControl.selectedSegmentIndex = 5
        default:
            typeOfMediaSegmentedControl.selectedSegmentIndex = 0
        }
        
        countOfResultTextField.text = String(settings.countOfResult)
        
        switch settings.kindOfDevice {
        case "iphone":
            kindOfDeviceSegmentedControl.selectedSegmentIndex = 0
        case "ipad":
            kindOfDeviceSegmentedControl.selectedSegmentIndex = 1
        default:
            kindOfDeviceSegmentedControl.selectedSegmentIndex = 0
        }
    }
    
    func updateSettings() {
        
        updateTypeOfMedia()
        updateLimit()
        updateDeviceKind()
    }
    
    func updateTypeOfMedia() {
        
        switch typeOfMediaSegmentedControl.selectedSegmentIndex {
        case 0:
            settings.typeOfMedia = "music"
        case 1:
            settings.typeOfMedia = "movie"
        case 2:
            settings.typeOfMedia = "tvShow"
        case 3:
            settings.typeOfMedia = "podcast"
        case 4:
            settings.typeOfMedia = "audiobook"
        case 5:
            settings.typeOfMedia = "software"
        default:
            settings.typeOfMedia = "music"
        }
    }
    
    func updateLimit() {
        
        if Int(countOfResultTextField.text!) != nil {
            
            if Int(countOfResultTextField.text!)! > 200 {
                settings.countOfResult = 200
            } else if Int(countOfResultTextField.text!)! < 1 {
                settings.countOfResult = 1
            } else {
                settings.countOfResult = Int(countOfResultTextField.text!)!
            }
        }
    }
    
    func updateDeviceKind() {
        
        switch kindOfDeviceSegmentedControl.selectedSegmentIndex {
        case 0:
            settings.kindOfDevice = "iphone"
        case 1:
            settings.kindOfDevice = "ipad"
        default:
            settings.kindOfDevice = "iphone"
        }
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveSettingsAction(_ sender: Any) {
        
        updateSettings()
        output.saveSettings(settings: settings)
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - SettingsViewInput
    
    
}
