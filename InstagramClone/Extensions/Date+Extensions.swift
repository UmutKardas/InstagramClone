//
//  String+Extensions.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 28.08.2024.
//

import Foundation

extension Date {
    func formattedDate(inputFormat: String = "yyyy-MM-dd", outputFormat: String = "MMM d, yyyy") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat

        let dateString = dateFormatter.string(from: self)

        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = outputFormat
            return dateFormatter.string(from: date)
        } else {
            return nil
        }
    }
}
