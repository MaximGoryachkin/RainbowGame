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
    public let colorName: String
    
    //MARK: - init(_:)
    public init(
        id: ID = .init(id: UUID()),
        isAnswered: Bool = false,
        colorName: String = .init()
    ) {
        self.id = id
        self.isAnswered = isAnswered
        self.colorName = colorName
    }
    
    public struct ID: Hashable {
        let id: UUID
        public init(id: UUID) { self.id = id }
    }
}
