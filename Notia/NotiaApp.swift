//
//  NotiaApp.swift
//  Notia
//
//  Created by Inyene Etoedia on 07/01/2023.
//

import SwiftUI

@main
struct NotiaApp: App {
    let coreDataManager = CoreDataViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(coreDataManager)
        }
    }
}
