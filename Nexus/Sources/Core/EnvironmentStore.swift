//
//  EnvironmentStore.swift
//
//
//  Created by Илья Шаповалов on 13.11.2023.
//

import Foundation
import Redux

public final class EnvironmentStore: ObservableObject {
    //MARK: - Private properties
    private let store: Store<GameState>
    private let queue: DispatchQueue = .init(
        label: "EnvironmentStore",
        qos: .userInteractive
    )
    
    //MARK: - Public properties
    private(set) lazy var asObserver: Observer<GameState> = .init(
        queue: queue
    ) { [weak self] state in
        guard let self else { return .dead }
        graph = .init(state, dispatch: store.dispatch)
        return .active
    }
    
    @Published public private(set) var graph: Graph
    
    //MARK: - init(_:)
    public init(_ store: Store<GameState>) {
        self.store = store
        self.graph = .init(
            self.store.state,
            dispatch: self.store.dispatch
        )
    }
}
