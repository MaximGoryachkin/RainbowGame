//
//  AppState.swift
//
//
//  Created by Илья Шаповалов on 18.11.2023.
//

import Foundation
import Redux

public struct AppState: Reducer, Equatable {
    var game: GameState
    var settings: SettingsState
    
    init(
        game: GameState = .init(),
        settings: SettingsState = .init()
    ) {
        self.game = game
        self.settings = settings
    }
    
    mutating public func reduce(_ action: Action) {
        game.reduce(action)
        settings.reduce(action)
    }
}
