//
//  SettingsActions.swift
//
//
//  Created by Илья Шаповалов on 18.11.2023.
//

import Foundation
import Redux
import SwiftUI

public enum SettingsActions {
    struct UpdateBackgrounds: Action {
        let colors: [Color]
        init(_ colors: [Color]) { self.colors = colors }
    }
    
    struct UpdateSymbolColors: Action {
        let colors: [Color]
        init(_ colors: [Color]) { self.colors = colors }
    }
    
    struct UpdateColors: Action {
        let colors: [String]
        init(colors: [String]) { self.colors = colors }
    }
}
