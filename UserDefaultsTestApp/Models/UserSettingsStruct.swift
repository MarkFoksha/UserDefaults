//
//  UserSettingsStruct.swift
//  UserDefaultsTestApp
//
//  Created by Марк Фокша on 19.09.2023.
//

import Foundation

struct UserSettingsStruct: Codable {
    
    var isAuthorized = false
}

struct UserStructManager {
    static func setData() {
        let userSettingsStruct = UserSettingsStruct(isAuthorized: true)
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(userSettingsStruct)
        
        userDefaults.set(jsonData, forKey: UserDefaultsKeys.userSettingsStruct)
    }
    
    static func unarchiveData() {
        if let userSettingsData = userDefaults.object(forKey: UserDefaultsKeys.userSettingsStruct) as? Data {
            let decoder = JSONDecoder()
            
            guard let model = try? decoder.decode(UserSettingsStruct.self, from: userSettingsData) else { return }
            
            print("UserSettingsStruct: \(model)")
        }
    }
}
