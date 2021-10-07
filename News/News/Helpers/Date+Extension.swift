//
//  Date+Extension.swift
//  News
//
//  Created by Kerim Njuhovic on 7. 10. 2021..
//

import Foundation

extension Date {
    
    var customFormatted: String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.dateStyle = .medium
                
        return  formatter.string(from: self)
    }
    
}
