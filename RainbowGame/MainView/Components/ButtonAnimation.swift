//
//  ButtonAnimation.swift
//  RainbowGame
//
//  Created by Daniil Kulikovskiy on 18.11.2023.
//

import SwiftUI

struct ButtonAnimation: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.85 : 1.0)
    }
}
