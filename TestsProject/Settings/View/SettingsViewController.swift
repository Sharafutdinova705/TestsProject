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
    var settings: Settings = Settings(typeOfMedia: AllConstants.empty, countOfResult: NumberConstants.zero, kindOfDevice: AllConstants.empty)
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.obtainSettings()
    }
    
    func updateSettingsInVC(settings: Settings) {
        
        self.settings = settings
        
        switch settings.typeOfMedia {
        case TypeOfMedia.music:
            typeOfMediaSegmentedControl.selectedSegmentIndex = NumberConstants.zero
        case TypeOfMedia.movie:
            typeOfMediaSegmentedControl.selectedSegmentIndex = NumberConstants.one
        case TypeOfMedia.tvShow:
            typeOfMediaSegmentedControl.selectedSegmentIndex = NumberConstants.two
        case TypeOfMedia.podcast:
            typeOfMediaSegmentedControl.selectedSegmentIndex = NumberConstants.three
        case TypeOfMedia.audiobook:
            typeOfMediaSegmentedControl.selectedSegmentIndex = NumberConstants.four
        case TypeOfMedia.software:
            typeOfMediaSegmentedControl.selectedSegmentIndex = NumberConstants.five
        default:
            typeOfMediaSegmentedControl.selectedSegmentIndex = NumberConstants.zero
        }
        
        countOfResultTextField.text = String(settings.countOfResult)
        
        switch settings.kindOfDevice {
        case Device.iphone.lowercased():
            kindOfDeviceSegmentedControl.selectedSegmentIndex = NumberConstants.zero
        case Device.ipad.lowercased():
            kindOfDeviceSegmentedControl.selectedSegmentIndex = NumberConstants.one
        default:
            kindOfDeviceSegmentedControl.selectedSegmentIndex = NumberConstants.zero
        }
    }
    
    /// обновление настроек
    func updateSettings() {
        
        updateTypeOfMedia()
        updateLimit()
        updateDeviceKind()
    }
    
    /// обновление типа медии
    func updateTypeOfMedia() {
        
        switch typeOfMediaSegmentedControl.selectedSegmentIndex {
        case NumberConstants.zero:
            settings.typeOfMedia = TypeOfMedia.music
        case NumberConstants.one:
            settings.typeOfMedia = TypeOfMedia.movie
        case NumberConstants.two:
            settings.typeOfMedia = TypeOfMedia.tvShow
        case NumberConstants.three:
            settings.typeOfMedia = TypeOfMedia.podcast
        case NumberConstants.four:
            settings.typeOfMedia = TypeOfMedia.audiobook
        case NumberConstants.five:
            settings.typeOfMedia = TypeOfMedia.software
        default:
            settings.typeOfMedia = TypeOfMedia.music
        }
    }
    
    /// обновление лимита
    func updateLimit() {
        
        if Int(countOfResultTextField.text!) != nil {
            
            if Int(countOfResultTextField.text!)! > NumberConstants.twoHundred {
                settings.countOfResult = NumberConstants.twoHundred
            } else if Int(countOfResultTextField.text!)! < NumberConstants.one {
                settings.countOfResult = NumberConstants.one
            } else {
                settings.countOfResult = Int(countOfResultTextField.text!)!
            }
        }
    }
    
    /// обновление типа девайса
    func updateDeviceKind() {
        
        switch kindOfDeviceSegmentedControl.selectedSegmentIndex {
        case NumberConstants.zero:
            settings.kindOfDevice = Device.iphone.lowercased()
        case NumberConstants.one:
            settings.kindOfDevice = Device.ipad.lowercased()
        default:
            settings.kindOfDevice = Device.iphone.lowercased()
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
}
