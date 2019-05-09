//
//  APIManager.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

/// Enum с одним кейсом состоящим из базового url и пути
///
/// - Current: кейсом состоящим из базового url и пути
enum RequestType: FinalURLPoint {
    
    case current(term: String, settings: Settings)
    
    var baseURL: URL {
        return URL(string: "https://itunes.apple.com/search?")!
    }
    
    var path: String {
        
        switch self {
        
        case .current(let term, let settings):
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
    
    /// конфигурация сессии
    let sessionConfiguration: URLSessionConfiguration
    /// Сессия строящаяся по конфигурации
    lazy var session: URLSession = {
        return URLSession(configuration: self.sessionConfiguration)
    } ()
    
    /// инициализация конфигурации
    ///
    /// - Parameter sessionConfiguration: принимает конфигурацию
    init(sessionConfiguration: URLSessionConfiguration) {
        self.sessionConfiguration = sessionConfiguration
    }
    
    /// Получение результата
    ///
    /// - Parameters:
    ///   - term: то, что ищем
    ///   - settings: Settings, по которым ищем
    ///   - completionHandler: completionHandler
    func fetchResultWith(term: String, settings: Settings, completionHandler: @escaping (APIResult<FoundedItem>) -> Void) {
        
        let request = RequestType.current(term: term, settings: settings).request
        
        fetch(request: request, parse: { (json) -> [FoundedItem]? in
            if let dictionary = json[AllConstants.results] as? [[String: AnyObject]] {
                var founded: [FoundedItem] = []
                for item in dictionary {
                    if settings.kindOfDevice == Device.ipad.lowercased() && FoundedItem(JSON: (item))?.kindOfDevice.lowercased() == Device.ipad.lowercased() {
                        founded.append(FoundedItem(JSON: (item))!)
                    } else if settings.kindOfDevice.lowercased() != Device.ipad.lowercased() {
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
