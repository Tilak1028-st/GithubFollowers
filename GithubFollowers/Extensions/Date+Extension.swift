//
//  Date+Extension.swift
//  GithubFollowers
//
//  Created by Tilak Shakya on 07/07/24.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
