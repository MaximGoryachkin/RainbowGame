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
    var symbolColors: [Color]
    var colors: [String]
    
    public init(
        symbolColors: [Color] = .init(),
        colors: [String] = .init()
    ) {
        self.symbolColors = symbolColors
        self.colors = colors
    }
    
    public mutating func reduce(_ action: Action) {
        switch action {
        case let action as SettingsActions.UpdateColors:
            colors = action.colors
            
        case let action as SettingsActions.UpdateSymbolColors:
            symbolColors = action.colors
            
        default: return
        }
    }
}
