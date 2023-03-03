//
//  sdkdemo_macApp.swift
//  sdkdemo-mac
//
//  Created by wesley on 2023/3/2.
//

import SwiftUI

@main
struct sdkdemo_macApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
                MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.windowStyle(HiddenTitleBarWindowStyle())
    }
}
