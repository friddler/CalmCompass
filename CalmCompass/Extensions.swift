//
//  Extensions.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-25.
//

import Foundation

//lazy initialization, it will not be initialized until used. This extension can be reused and we can also customize it if we want to display the time differently.

extension DateComponentsFormatter {
    static let abbreviated: DateComponentsFormatter = {
        print("initializing datecomponentsfromage")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        
        return formatter
        
        /* this formatter shortens the time intervals by displaying units.
         We are using this because we want to display concise representation of time.
         */
    }()
    
    static let positional: DateComponentsFormatter = {
        print("initializing positional")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
        
        /*
         This created a formatted for displaying time intervals in minutes and seconds.
         */
    }()
}
