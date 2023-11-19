//
//  StoreProvider.swift
//  
//
//  Created by Илья Шаповалов on 18.11.2023.
//

import SwiftUI
import Redux

public struct StoreProvider<V: View>: View {
    let store: Store<AppState>
    let content: () -> V
    
    @StateObject private var environmentStore: EnvironmentStore
    
    public var body: some View {
        content()
            .environmentObject(environmentStore)
    }
    
    public init(
        store: Store<AppState>,
        content: @escaping () -> V
    ) {
        self.store = store
        self.content = content
        self._environmentStore = StateObject(wrappedValue: EnvironmentStore(store))
    }
}
