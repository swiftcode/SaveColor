//
//  Item.swift
//  SaveColor
//
//  Created by Michael Campbell on 5/23/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
