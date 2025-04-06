//
//  UserDefaults+Extension.swift
//  PostsTask
//
//  Created by Jameel Shehadeh on 06/04/2025.
//

import Foundation

extension UserDefaults {
    
    func setCodableValue<T: Codable>(_ data: T?, forKey defaultName: String) {
      let encoded = try? JSONEncoder().encode(data)
      set(encoded, forKey: defaultName)
    }
    
    func getCodableValue<T : Codable>(dataType: T.Type, key: String) -> T? {
      guard let userDefaultData = data(forKey: key) else { return nil }
      return try? JSONDecoder().decode(T.self, from: userDefaultData)
    }
    
}
