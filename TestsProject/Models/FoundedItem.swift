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
    init?(JSON: [String:AnyObject]) {
        
        if let titleLabel = JSON["trackName"] as? String {
            self.titleLabel = titleLabel
        } else {
            self.titleLabel = ""
        }
        
        if let authorLabel = JSON["artistName"] as? String  {
            self.authorLabel = authorLabel
        } else {
            self.authorLabel = ""
        }
        
        if let descriptionLabel = JSON["description"] as? String  {
            self.descriptionLabel = descriptionLabel
        } else {
            self.descriptionLabel = ""
        }
        
        if let priceLabel = JSON["formattedPricet"] as? String  {
            self.priceLabel = priceLabel
        } else if let price = JSON["price"] as? String {
            self.priceLabel = price
        } else {
            self.priceLabel = ""
        }
        
        if let itemImageView = JSON["artworkUrl60"] as? String  {
            self.itemImageView = itemImageView
        } else {
            self.itemImageView = ""
        }
        
        if let typeOfMedia = JSON["wrapperType"] as? String  {
            self.typeOfMedia = typeOfMedia
        } else {
            self.typeOfMedia = ""
        }
        
        if let url = JSON["trackViewUrl"] as? String  {
            self.url = url
        } else {
            self.url = ""
        }
        
        var kindOfDevice = ""
        
        if JSON["wrapperType"] as? String == "software" && JSON["supportedDevices"] as? [String] != nil {
            
            if let supportedDevices = JSON["supportedDevices"] as? [String] {
                for device in supportedDevices {
                    
                    if device.lowercased().contains("ipad") && device.lowercased().contains("iphone") {
                        kindOfDevice = "all"
                    } else if device.lowercased().contains("ipad") && !device.lowercased().contains("iphone") {
                        kindOfDevice = "iPad"
                    } else if !device.lowercased().contains("ipad") && device.lowercased().contains("iphone") {
                        kindOfDevice = "iPhone"
                    }
                }
            }
        }
        self.kindOfDevice = kindOfDevice
    }
}
