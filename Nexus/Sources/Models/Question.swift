//
//  File.swift
//  
//
//  Created by Шаповалов Илья on 14.11.2023.
//

import Foundation
import SwiftUI

public struct Question: Equatable, Identifiable {
    public let id: ID
    public var isAnswered: Bool
    public let colorName: String
    public let symbolColor: Color
    public let backgroundColor: Color
    
    //MARK: - init(_:)
    public init(
        id: ID = .init(id: UUID()),
        isAnswered: Bool = false,
        colorName: String = .init(),
        symbolColor: Color = .clear,
        backgroundColor: Color = .clear
    ) {
        self.id = id
        self.isAnswered = isAnswered
        self.colorName = colorName
        self.symbolColor = symbolColor
        self.backgroundColor = backgroundColor
    }
    
    public struct ID: Hashable {
        let id: UUID
        public init(id: UUID) { self.id = id }
    }
}
