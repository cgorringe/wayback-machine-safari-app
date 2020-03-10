//
//  WMNumberExtensions.swift
//  Wayback Machine Extension
//
//  Created by Carl on 3/9/20.
//

import Foundation

extension Int {

    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    /// Returns comma-formatted string in style depending on current locale.
    func withCommas() -> String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }

}
