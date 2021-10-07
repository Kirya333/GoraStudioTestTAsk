//
//  URLBuild.swift
//  GoraStudioTestTAsk
//
//  Created by Кирилл Тарасов on 06.10.2021.
//

import Foundation

class URLBuilder {
    
    private var components: URLComponents
    
    init() {
        self.components = URLComponents()
    }
    
    func set(scheme: String) -> URLBuilder {
        self.components.scheme = scheme
        return self
    }
    
    func set(host: String) -> URLBuilder {
        self.components.host = host
        return self
    }
    
    func set(path: String) -> URLBuilder {
        var path = path
        if !path.hasPrefix("/") {
            path = "/" + path
        }
        self.components.path = path
        return self
    }
    
    func addQueryItem(name: String, value: String?) -> URLBuilder {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        
        let queryItem = URLQueryItem(name: name, value: value)
        self.components.queryItems?.append(queryItem)
        return self
    }
    
    func build() -> URL? {
        return self.components.url
    }
}
