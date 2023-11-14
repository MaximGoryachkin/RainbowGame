//
//  Graph.swift
//  
//
//  Created by Илья Шаповалов on 13.11.2023.
//

import Foundation
import Redux

struct Graph {
    let state: GameState
    let dispatch: (Action) -> Void
    
    //MARK: - init(_:)
    init(
        _ state: GameState,
        dispatch: @escaping (Action) -> Void
    ) {
        self.state = state
        self.dispatch = dispatch
    }
}
