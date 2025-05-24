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
    @State private var errorDeletingItem: Bool = false
    
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
                    }
                }
                .onDelete(perform: deleteItem)
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
    
    fileprivate func deleteItem(_ indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(items[index])
            
            do {
                try modelContext.save()
            } catch {
                errorDeletingItem = true
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self)
}
