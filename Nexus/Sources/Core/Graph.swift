//
//  Graph.swift
//  
//
//  Created by Илья Шаповалов on 13.11.2023.
//

import Foundation
import Redux

@dynamicMemberLookup
public struct Graph: Equatable {
    private let state: GameState
    let dispatch: (Action) -> Void
    
    //MARK: - init(_:)
    init(
        _ state: GameState,
        dispatch: @escaping (Action) -> Void
    ) {
        self.state = state
        self.dispatch = dispatch
    }
    
    public static func == (lhs: Graph, rhs: Graph) -> Bool {
        lhs.state == rhs.state
    }
    
    subscript<T>(dynamicMember keyPath: KeyPath<GameState, T>) -> T {
        state[keyPath: keyPath]
    }
}
