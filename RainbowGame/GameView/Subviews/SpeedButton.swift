//
//  SpeedButton.swift
//  RainbowGame
//
//  Created by Илья Шаповалов on 19.11.2023.
//

import SwiftUI

struct SpeedButton: View {
    let title: String
    let tap: () -> Void
    let longTap: () -> Void
    
    var body: some View {
        Circle()
            .frame(width: 100)
            .foregroundStyle(Color.red)
            .padding()
            .overlay {
                Text(title)
                    .font(.title)
            }
            .onTapGesture(perform: tap)
            .onLongPressGesture(perform: longTap)
    }
}

#Preview {
    SpeedButton(
        title: "x1",
        tap: {},
        longTap: {}
    )
}
