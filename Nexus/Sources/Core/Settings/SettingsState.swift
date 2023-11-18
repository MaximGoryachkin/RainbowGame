//
//  SettingsState.swift
//
//
//  Created by Илья Шаповалов on 18.11.2023.
//

import Foundation
import Redux
import SwiftUI

public struct SettingsState: Reducer, Equatable {
    var backgroundColors: [Color]
    var symbolColors: [Color]
    var colors: [String]
    
    init(
        backgroundColors: [Color] = .init(),
        symbolColors: [Color] = .init(),
        colors: [String] = .init()
    ) {
        self.backgroundColors = backgroundColors
        self.symbolColors = symbolColors
        self.colors = colors
    }
    
    public mutating func reduce(_ action: Action) {
        switch action {
        case let action as SettingsActions.UpdateBackgrounds:
            backgroundColors = action.colors
            
        case let action as SettingsActions.UpdateColors:
            colors = action.colors
            
        case let action as SettingsActions.UpdateSymbolColors:
            symbolColors = action.colors
            
        default: return
        }
    }
}
