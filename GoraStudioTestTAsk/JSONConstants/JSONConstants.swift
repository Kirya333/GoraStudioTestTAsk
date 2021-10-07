//
//  JSONConstants.swift
//  GoraStudioTestTAsk
//
//  Created by Кирилл Тарасов on 06.10.2021.
//

import Foundation

enum APIHost: String {
    case standart = "jsonplaceholder.typicode.com"
}

enum APIScheme: String {
    case http = "http"
    case https = "https"
}

enum APIPath: String {
    case albums = "albums"
    case users = "users"
    case photos = "photos"
}

enum ViewControllerTitle: String {
    case users = "UsersTitle"
    case photos = "PhotosTitle"
}
