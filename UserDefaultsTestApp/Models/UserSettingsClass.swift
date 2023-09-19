//
//  UserSetting.swift
//  UserDefaultsTestApp
//
//  Created by Марк Фокша on 19.09.2023.
//

import Foundation

class UserSettings: NSCoder, NSCoding {
    var isAuthorized = false
    
    private enum UserSettingsKey {
        static let isAuthorized = "isAuthorized"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(isAuthorized, forKey: UserSettingsKey.isAuthorized)
    }
    
    init(isAuthorized: Bool) {
        self.isAuthorized = isAuthorized
    }
    
    required init?(coder: NSCoder) {
        isAuthorized = coder.decodeBool(forKey: UserSettingsKey.isAuthorized )
    }
}

class UserClassManager {
    static func setData() {
        let settings = UserSettings(isAuthorized: true)
        
        let settingsData = try? NSKeyedArchiver.archivedData(withRootObject: settings, requiringSecureCoding: false)
        userDefaults.set(settingsData, forKey: UserDefaultsKeys.userSettings)
    }
    
    static func unarchiveData() {
        if let userSettingsData = userDefaults.object(forKey: UserDefaultsKeys.userSettings) as? Data,
           let userSettings = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userSettingsData) as? UserSettings {
            print("UserSettingsClass: \(userSettings)")
        }
    }
}

