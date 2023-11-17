//
//  RainbowGameApp.swift
//  RainbowGame
//
//  Created by Максим Горячкин on 12.11.2023.
//

import SwiftUI

@main
struct RainbowGameApp: App {
    private var settingsModel = SettingsModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settingsModel)
        }
    }
}
