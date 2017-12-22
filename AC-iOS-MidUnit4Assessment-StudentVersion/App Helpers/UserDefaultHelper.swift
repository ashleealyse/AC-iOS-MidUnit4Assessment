//
//  UserDefaultHelper.swift
//  AC-iOS-MidUnit4Assessment-StudentVersion
//
//  Created by Ashlee Krammer on 12/22/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct UserDefaultHelper {
    static let manager = UserDefaultHelper()
    private init() {}

    let Key = "storeID"

    func getRecentGame() -> String? {
        return UserDefaults.standard.string(forKey: Key)
    }
    func setRecentGame(to history: String) {
        UserDefaults.standard.setValue(history, forKey: Key)
    }
}

