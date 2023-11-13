//
//  OptionButton.swift
//  RainbowGame
//
//  Created by Daniil Kulikovskiy on 13.11.2023.
//

import SwiftUI

struct OptionButton: View {
    var image: String
    var destination: ContentView
    
    var body: some View {
        NavigationLink(destination: destination) {
            Image(image)
        }
        .shadow(color: Color.black.opacity(0.2), radius: 3, y: 6)
    }
}

#Preview {
    OptionButton(image: "settings", destination: ContentView())
}
