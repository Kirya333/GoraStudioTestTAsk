//
//  PhotosListDataSource.swift
//  GoraStudioTestTAsk
//
//  Created by Кирилл Тарасов on 07.10.2021.
//

import Foundation
import UIKit

class PhotosListDataSource: NSObject, UITableViewDataSource {
    
    var photos: [Photo]
    
    init(photos: [Photo]) {
        self.photos = photos
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserPhotoTableViewCell.identifier, for: indexPath) as? UserPhotoTableViewCell else {
            fatalError("The dequeued cell is not an instance of UserPhotoTableViewCell.")
        }
        
        let photo = photos[indexPath.row]
        cell.configure(with: photo)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
