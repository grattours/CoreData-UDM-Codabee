//
//  AppDelegate.swift
//  Codata
//
//  Created by Luc Derosne on 28/11/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//


import Foundation


extension Date {
    
    func toString() -> String {
        let formatter = DateFormatter()
        let calendar = Calendar.current
        
        if calendar.isDateInToday(self) {
            formatter.timeStyle = .short
            formatter.dateStyle = .none
        } else {
            formatter.dateStyle = .medium
            formatter.timeStyle = .none

        }
        
        return formatter.string(from: self)
    }
    
}
