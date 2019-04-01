//
//  APIManager.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

enum RequestType: FinalURLPoint {
    
    case Current(term: String, settings: Settings)
    
    var baseURL: URL {
        return URL(string: "https://itunes.apple.com/search?")!
    }
    
    var path: String {
        
        switch self {
        
        case .Current(let term, let settings):
            let editedterm = term.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!.lowercased()
            return "term=\(editedterm)&media=\(settings.typeOfMedia)&limit=\(settings.countOfResult)"
        }
    }
    
    var request: URLRequest {
        
        let url = URL(string: baseURL.absoluteString + path)
        return URLRequest(url: url!)
    }
}

class APIManager: APIManagerProtocol {
    
    let sessionConfiguration: URLSessionConfiguration
    lazy var session: URLSession = {
        return URLSession(configuration: self.sessionConfiguration)
    } ()
    
    init(sessionConfiguration: URLSessionConfiguration) {
        self.sessionConfiguration = sessionConfiguration
    }
    
    func fetchResultWith(term: String, settings: Settings, completionHandler: @escaping (APIResult<FoundedItem>) -> Void) {
        
        let request = RequestType.Current(term: term, settings: settings).request
        
        fetch(request: request, parse: { (json) -> [FoundedItem]? in
            if let dictionary = json["results"] as? [[String: AnyObject]] {
                var founded: [FoundedItem] = []
                for item in dictionary {
                    if settings.kindOfDevice == "ipad" && FoundedItem(JSON: (item))?.kindOfDevice.lowercased() == "ipad" {
                        founded.append(FoundedItem(JSON: (item))!)
                    } else if settings.kindOfDevice.lowercased() != "ipad" {
                        founded.append(FoundedItem(JSON: (item))!)
                    }
                }
                return founded
            } else {
                return nil
            }
        }, completionHandler: completionHandler)
    }
}
