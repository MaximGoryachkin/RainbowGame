//
//  CheckboxIOS.swift
//  RainbowGame
//
//  Created by Илья Шаповалов on 19.11.2023.
//

import SwiftUI

struct CheckboxIOS: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            Image(systemName: configuration.isOn
                  ? "checkmark.square"
                  : "square"
            )
        })
    }
}
