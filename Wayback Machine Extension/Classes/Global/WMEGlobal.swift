//
//  WMEGlobal.swift
//  Wayback Machine Extension
//
//  Created by admin on 7/7/19.
//

import Foundation

struct WMWaybackCount {
    var count: Int = 0
    var firstDate: Date?
    var lastDate: Date?
}

class WMEGlobal: NSObject {
    static let shared = WMEGlobal()

    var savePageEnabled = true
    var siteMapEnabled = true
    var urlCountEnabled = true
    var urlCountCache = [String: WMWaybackCount]()  // TODO: limit size of cache?
    var urlCountLastURL: String?

    func saveUserData(userData: [String: Any?]) {
        let encodedObject = NSKeyedArchiver.archivedData(withRootObject: userData)
        UserDefaults.standard.set(encodedObject, forKey: "UserData")
        UserDefaults.standard.synchronize()
    }
    
    func getUserData() -> [String: Any?]? {
        if let encodedData = UserDefaults.standard.data(forKey: "UserData") {
            let obj = NSKeyedUnarchiver.unarchiveObject(with: encodedData)
            return obj as? [String: Any?]
        } else {
            return nil
        }
    }
    
    func isLoggedIn() -> Bool {
        if let userData = self.getUserData(),
            let isLoggedin = userData["logged-in"] as? Bool,
            isLoggedin == true {
            return true
        }
        return false
    }
}
