//
//  Store.swift
//  
//
//  Created by Илья Шаповалов on 13.11.2023.
//

import Foundation

public protocol Reducer {
    mutating func reduce(_ action: Action)
}

public protocol Action {}

@dynamicMemberLookup
public final class Store<State> {
    public typealias Reducer = (inout State, Action) -> Void
    
    //MARK: - Private properties
    public private(set) var state: State
    public let reducer: Reducer
    let queue: DispatchQueue = .init(label: "Store queue")
    var observers: [UUID: Observer<State>] = .init()
    
    //MARK: - init(_:)
    public init(
        initial state: State,
        reducer: @escaping Reducer
    ) {
        self.state = state
        self.reducer = reducer
    }
    
    //MARK: - Public methods
    public func dispatch(_ action: Action) {
        queue.sync {
            reducer(&state, action)
            observers.map(\.value).forEach(notify)
        }
    }
    
    public func subscribe(_ observer: Observer<State>) {
        queue.sync {
            observers.updateValue(observer, forKey: observer.id)
            notify(observer)
        }
    }
    
    public subscript<T>(dynamicMember keyPath: KeyPath<State, T>) -> T {
        state[keyPath: keyPath]
    }
}

private extension Store {
    func notify(_ observer: Observer<State>) {
        observer.queue.async { [state] in
            let status = observer.observe(state)
            
            guard case .dead = status else { return }
            self.queue.async {
                self.observers.removeValue(forKey: observer.id)
            }
        }
    }
}
