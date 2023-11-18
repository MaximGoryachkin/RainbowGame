//
//  NavigationTitleExtension.swift
//  RainbowGame
//
//  Created by Максим Горячкин on 17.11.2023.
//

import SwiftUI

struct SpecialNavBar: ViewModifier {
    init(color: UIColor) {
        // this is not the same as manipulating the proxy directly
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = color
        
        // this overrides everything you have set up earlier.
//        appearance.configureWithTransparentBackground()
        
        // this only applies to big titles
        appearance.largeTitleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 30)
        ]
        // this only applies to small titles
        appearance.titleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 30)
        ]
        
        //In the following two lines you make sure that you apply the style for good
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func specialNavBar(with color: Color) -> some View {
        self.modifier(SpecialNavBar(color: UIColor(color)))
    }
}
