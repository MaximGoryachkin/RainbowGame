//
//  File.swift
//  
//
//  Created by Шаповалов Илья on 14.11.2023.
//

import Foundation

public struct Question: Equatable, Identifiable {
    public let id: ID
    public let isAnswered: Bool
    
    public init(
        id: ID = .init(),
        isAnswered: Bool = false
    ) {
        self.id = id
        self.isAnswered = isAnswered
    }
    
    public struct ID: Hashable {
        let id: UUID
        public init(id: UUID = .init()) { self.id = id }
    }
}
