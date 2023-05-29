//
//  Extensions.swift
//  CalmCompass
//
//  Created by Frida Nilsson on 2023-05-25.
//

import Foundation

//lazy initialization, it will not be initialized until used.

extension DateComponentsFormatter {
    static let abbreviated: DateComponentsFormatter = {
        print("initializing datecomponentsfromage")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        
        return formatter
    }()
    
    static let positional: DateComponentsFormatter = {
        print("initializing positional")
        let formatter = DateComponentsFormatter()
        
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
    }()
}
