//
//  UserPhotoViewModel.swift
//  GoraStudioTestTAsk
//
//  Created by Кирилл Тарасов on 07.10.2021.
//

import Foundation
import UIKit

class UserPhotoViewModel {
    
    private let photo: Photo
    private let imageURL: URL
    
    init(photoModel photo: Photo) {
        self.photo = photo
        self.imageURL = URL(string: photo.url)!
    }
    
    public var title: String {
        return photo.title
    }
    
    public var url: URL {
        return imageURL
    }
}
