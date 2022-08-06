//
//  iosMyinstaApp.swift
//  iosMyinsta
//
//  Created by Doniyor on 06/08/22.
//

import SwiftUI

@main
struct iosMyinstaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
