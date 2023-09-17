//
//  DateFormatter.swift
//  Venatio
//
//  Created by user236913 on 9/17/23.
//

import Foundation

func formatDateToMedium(dateFormat: String, date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
    let formattedDate = dateFormatter.date(from: date)
    dateFormatter.dateStyle = .medium
    let dateString = dateFormatter.string(from: formattedDate ?? Date())
    return dateString
}
