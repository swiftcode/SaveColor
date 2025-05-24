//
//  ItemView.swift
//  SaveColor
//
//  Created by Michael Campbell on 5/23/25.
//

import SwiftUI

struct ItemView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Binding var isPresentingItemView: Bool
    
    @State private var item = Item.emptyItem
    @State private var selectedColor: Color = .accentColor
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Item name", text: $item.name)
                ColorPicker("Select a color", selection: $selectedColor)
            }
            .toolbar {
                Button("Save") {
                    let components = selectedColor.components
                    let _ = print("components: \(selectedColor.components)")
                    item.red = components.red
                    item.green = components.green
                    item.blue = components.blue
                    item.alpha = components.alpha
                    
                    modelContext.insert(item)
                    isPresentingItemView = false
                }
            }
        }
        .navigationTitle("Items")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ItemView(isPresentingItemView: .constant(true))
}
