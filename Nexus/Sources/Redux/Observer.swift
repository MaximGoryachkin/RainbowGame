//
//  Observer.swift
//  
//
//  Created by Илья Шаповалов on 13.11.2023.
//

import Foundation

public final class Observer<State> {
    public let id: UUID = .init()
    public let queue: DispatchQueue
    public let observe: (State) -> Status
    
    public init(
        queue: DispatchQueue = .global(),
        observe: @escaping (State) -> Status
    ) {
        self.queue = queue
        self.observe = observe
    }
}

public extension Observer {
    enum Status: Equatable {
        case active
        case dead
        case postponed(Int)
    }
}

extension Observer: Hashable {
    public func hash(into hasher: inout Hasher) {
        ObjectIdentifier(self).hash(into: &hasher)
    }
}

extension Observer: Equatable {
    public static func ==(lhs: Observer, rhs: Observer) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}
