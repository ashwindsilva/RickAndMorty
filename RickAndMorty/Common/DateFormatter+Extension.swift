//
//  DateFormatter+Extension.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 07/02/24.
//

import Foundation

extension DateFormatter {
    static let iso8601WithFractionsFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter
    }()
}
