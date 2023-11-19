//
//  BackButton.swift
//  RainbowGame
//
//  Created by Илья Шаповалов on 19.11.2023.
//

import SwiftUI

struct BackButton: ToolbarContent {
    @Environment(\.dismiss) var dismiss
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: dismiss.callAsFunction) {
                Image(systemName: "arrowshape.turn.up.backward.circle")
                    .tint(.black)
            }
        }
    }
}
