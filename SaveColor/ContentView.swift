//
//  ContentView.swift
//  SaveColor
//
//  Created by Michael Campbell on 5/23/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Item.name) private var items: [Item]
    @State private var isPresentedItemView: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items, id: \.self) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Circle()
                            .stroke(.black, lineWidth: 2)
                            .fill(item.color)
                            .frame(width: 30.0, height: 30.0)
                        
                        let _ = print("item.color:-> \(item.color)")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresentedItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentedItemView) {
                ItemView(isPresentingItemView: $isPresentedItemView)
            }
            .navigationTitle("Colors")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self)
}
