//
//  MainButton.swift
//  RainbowGame
//
//  Created by Daniil Kulikovskiy on 13.11.2023.
//

import SwiftUI

struct MainButton: View {
    var text: String
    var color: Color
    var destination: ContentView
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(text)
                .font(.system(size: 20))
                .foregroundStyle(.white)
                .padding(.vertical, 31)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .background(color)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 3, y: 6)
    }
}


//#Preview {
//    MainButton(text: "Text button", color: .red, destination: Text(""))
//}