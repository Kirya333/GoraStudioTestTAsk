//
//  ExtensionStringLocalize.swift
//  GoraStudioTestTAsk
//
//  Created by Кирилл Тарасов on 07.10.2021.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

}
