//
//  AppState.swift
//
//
//  Created by Илья Шаповалов on 18.11.2023.
//

import Foundation
import Redux

public struct AppState: Reducer, Equatable {
    public var gameState: GameState
    var settingsState: SettingsState
    
    public init(
        gameState: GameState = .init(),
        settingsState: SettingsState = .init()
    ) {
        self.gameState = gameState
        self.settingsState = settingsState
    }
    
    mutating public func reduce(_ action: Action) {
        gameState.reduce(action)
        settingsState.reduce(action)
    }
}
