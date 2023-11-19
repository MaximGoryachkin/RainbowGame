//
//  Connector.swift
//  
//
//  Created by Илья Шаповалов on 18.11.2023.
//

import SwiftUI

public protocol Connector: View {
    associatedtype Content: View
    func map(_ graph: Graph) -> Content
}

public extension Connector {
    var body: some View {
        Connected(map: self.map(_:))
    }
}

fileprivate struct Connected<V: View>: View {
    @EnvironmentObject var store: EnvironmentStore
    
    let map: (Graph) -> V
    
    var body: V {
        map(store.graph)
    }
}
