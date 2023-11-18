//
//  SettingsNode.swift
//
//
//  Created by Илья Шаповалов on 19.11.2023.
//

import Foundation

extension Graph {
    var settings: SettingsNode { .init(graph: self) }
}

struct SettingsNode {
    let graph: Graph
}
