//
//  SaveColorApp.swift
//  SaveColor
//
//  Created by Michael Campbell on 5/23/25.
//

import SwiftUI
import SwiftData

@main
struct SaveColorApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Item.self])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        let modelConfigurationICloudOff = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false, cloudKitDatabase: .none)
        let iCloudToken = FileManager.default.ubiquityIdentityToken
        
        if iCloudToken == nil {
            do {
                return try ModelContainer(for: schema, configurations: [modelConfigurationICloudOff])
            } catch {
                fatalError("Could not create model container: \(error)")
            }
        } else {
            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create model container: \(error)")
            }
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
