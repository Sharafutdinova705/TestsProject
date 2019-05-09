//
//  FoundedItem.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

struct FoundedItem {
    
    var titleLabel: String
    var authorLabel: String
    var descriptionLabel: String
    var priceLabel: String
    var itemImageView: String
    var typeOfMedia: String
    var kindOfDevice: String
    var url: String
    
    init(titleLabel: String, authorLabel: String, descriptionLabel: String, priceLabel: String, itemImageView: String, typeOfMedia: String, kindOfDevice: String, limit: Int, url: String) {
        self.titleLabel = titleLabel
        self.authorLabel = authorLabel
        self.descriptionLabel = descriptionLabel
        self.priceLabel = priceLabel
        self.itemImageView = itemImageView
        self.typeOfMedia = typeOfMedia
        self.kindOfDevice = kindOfDevice
        self.url = url
    }
}

extension FoundedItem: JSONDecodable {
    
    /// Инициализация с помощью json
    ///
    /// - Parameter JSON: json в виде словаря
    init?(JSON: [String:AnyObject]) {
        
        if let titleLabel = JSON[AllConstants.trackName] as? String {
            self.titleLabel = titleLabel
        } else {
            self.titleLabel = AllConstants.empty
        }
        
        if let authorLabel = JSON[AllConstants.artistName] as? String  {
            self.authorLabel = authorLabel
        } else {
            self.authorLabel = AllConstants.empty
        }
        
        if let descriptionLabel = JSON[AllConstants.description] as? String  {
            self.descriptionLabel = descriptionLabel
        } else {
            self.descriptionLabel = AllConstants.empty
        }
        
        if let priceLabel = JSON[AllConstants.formattedPricet] as? String  {
            self.priceLabel = priceLabel
        } else if let price = JSON[AllConstants.price] as? String {
            self.priceLabel = price
        } else {
            self.priceLabel = AllConstants.empty
        }
        
        if let itemImageView = JSON[AllConstants.artworkUrl60] as? String  {
            self.itemImageView = itemImageView
        } else {
            self.itemImageView = AllConstants.empty
        }
        
        if let typeOfMedia = JSON[AllConstants.wrapperType] as? String  {
            self.typeOfMedia = typeOfMedia
        } else {
            self.typeOfMedia = AllConstants.empty
        }
        
        if let url = JSON[AllConstants.trackViewUrl] as? String  {
            self.url = url
        } else {
            self.url = AllConstants.empty
        }
        
        var kindOfDevice = AllConstants.empty
        
        if JSON[AllConstants.wrapperType] as? String == TypeOfMedia.software && JSON[AllConstants.supportedDevices] as? [String] != nil {
            
            if let supportedDevices = JSON[AllConstants.supportedDevices] as? [String] {
                for device in supportedDevices {
                    
                    if device.lowercased().contains(Device.ipad.lowercased()) && device.lowercased().contains(Device.iphone.lowercased()) {
                        kindOfDevice = Device.all
                    } else if device.lowercased().contains(Device.ipad.lowercased()) && !device.lowercased().contains(Device.iphone.lowercased()) {
                        kindOfDevice = Device.ipad
                    } else if !device.lowercased().contains(Device.ipad.lowercased()) && device.lowercased().contains(Device.iphone.lowercased()) {
                        kindOfDevice = Device.iphone
                    }
                }
            }
        }
        self.kindOfDevice = kindOfDevice
    }
}
