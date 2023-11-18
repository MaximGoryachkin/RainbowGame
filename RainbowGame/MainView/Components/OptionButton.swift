//
//  OptionButton.swift
//  RainbowGame
//
//  Created by Daniil Kulikovskiy on 13.11.2023.
//

import SwiftUI

struct OptionButton<Destination: View>: View {
    var image: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
        }
        .buttonStyle(ButtonAnimation())
        .shadow(color: Color.black.opacity(0.2), radius: 3, y: 6)
    }
}

//#Preview {
//    OptionButton(image: "settings", destination: EmptyView())
//}
