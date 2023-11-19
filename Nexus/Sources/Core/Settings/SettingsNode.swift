//
//  SettingsNode.swift
//
//
//  Created by Илья Шаповалов on 19.11.2023.
//

import Foundation
import SwiftUI

public extension Graph {
    var settings: SettingsNode { .init(graph: self) }
}

public struct SettingsNode {
    let graph: Graph
    
    public var selectedColors: [String] {
        get { graph.settingsState.colors }
        nonmutating set { graph.dispatch(SettingsActions.UpdateColors(colors: newValue)) }
    }
    
    public var symbolColors: [Color] {
        get { graph.settingsState.symbolColors }
        nonmutating set { graph.dispatch(SettingsActions.UpdateSymbolColors(newValue)) }
    }
    
    public var backgroundColors: [Color] {
        get { graph.settingsState.backgroundColors }
        nonmutating set { graph.dispatch(SettingsActions.UpdateBackgrounds(newValue)) }
    }
}
