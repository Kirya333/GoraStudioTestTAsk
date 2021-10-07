//
//  UsersListDataSource.swift
//  GoraStudioTestTAsk
//
//  Created by Кирилл Тарасов on 07.10.2021.
//

import Foundation
import UIKit

class UsersListDataSource: NSObject, UITableViewDataSource {
    
    var users: [User]
    
    init(users: [User]) {
        self.users = users
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.name
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
