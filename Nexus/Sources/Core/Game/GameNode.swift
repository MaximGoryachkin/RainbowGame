//
//  GameNode.swift
//  
//
//  Created by Шаповалов Илья on 14.11.2023.
//

import Foundation

extension Graph {
    var game: GameNode { .init(graph: self) }
}

struct GameNode {
    private let graph: Graph
    
    var timeAmount: Double {
        get { graph.state.timeAmount }
        nonmutating set { graph.dispatch(GameActions.SetTimeAmount(newValue)) }
    }
    
    init(graph: Graph) {
        self.graph = graph
    }
}
