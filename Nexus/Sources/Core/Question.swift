//
//  File.swift
//  
//
//  Created by Шаповалов Илья on 14.11.2023.
//

import Foundation

struct Question: Equatable, Identifiable {
    let id: ID
    var isAnswered: Bool
    
    init(
        id: ID = .init(),
        isAnswered: Bool = false
    ) {
        self.id = id
        self.isAnswered = isAnswered
    }
    
    struct ID: Hashable {
        let id: UUID
        init(id: UUID = .init()) { self.id = id }
    }
}
