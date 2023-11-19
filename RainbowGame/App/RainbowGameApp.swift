//
//  RainbowGameApp.swift
//  RainbowGame
//
//  Created by Максим Горячкин on 12.11.2023.
//

import SwiftUI
import Core
import Redux
import OSLog

@main
struct RainbowGameApp: App {
    private let settingsModel = SettingsModel()
    private let store: Store<AppState>
    private let timerDriver: TimerDriver
    private let soundDriver: SoundDriver
    private let questionDriver: QuestionDriver
    
    //MARK: - body
    var body: some Scene {
        WindowGroup {
            StoreProvider(store: store) {
                ContentView()
                    .environmentObject(settingsModel)
            }
        }
    }
    
    //MARK: - init(_:)
    init() {
        store = Store(
            initial: AppState()
        ) { state, action in
            os_log(.debug, "Store:\t%@", String(describing: action))
            state.reduce(action)
        }
        timerDriver = .init(store: store)
        soundDriver = .init(store: store)
        questionDriver = .init(store: store)
        
        store.subscribe(timerDriver.asObserver)
        store.subscribe(soundDriver.asObserver)
        store.subscribe(questionDriver.asObserver)
    }
}
