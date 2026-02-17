//
//  DateExtension.swift
//  HIITFit
//
//  Created by Damian Ogórek on 16/02/2026.
//

import Foundation

extension Date {
    var dateMonthYearFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM yyyy"
        return formatter.string(from: self)
    }

    var nameOfDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }

    /// The function uses the passed date format and generates a string
    /// - parameters:
    ///     - value: Provided by user custom date format like "dd MM yyyy"
    func formatted(from value: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = value
        return formatter.string(from: self)
    }

    func isSameDay(from day: Date) -> Bool {
        return self.dateMonthYearFormat == day.dateMonthYearFormat
    }
}
