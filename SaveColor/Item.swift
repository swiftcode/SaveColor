//
//  Item.swift
//  SaveColor
//
//  Created by Michael Campbell on 5/23/25.
//

import SwiftUI

struct Item {
    var id: UUID
    var name: String
    
    var red: Double = 0.0
    var green: Double = 0.0
    var blue: Double = 0.0
    var alpha: Double = 1.0
    
    var color: Color {
        Color(red: red, green: green, blue: blue, opacity: alpha)
    }
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}

extension Item {
    static var emptyIten: Item {
        Item(id: UUID(), name: "")
    }
}

extension Color {
    var components: (red: Double, green: Double, blue: Double, alpha: Double) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        #if canImport(UIKIT)
        let uiColor = UIColor(self)
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (Double(red), Double(green), Double(blue), Double(alpha))
        #else
        return (0.0, 0.0, 0.0, 0.0)
        #endif
    }
}

