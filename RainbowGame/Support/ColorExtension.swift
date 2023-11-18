//
//  ColorExtension.swift
//  RainbowGame
//
//  Created by Максим Горячкин on 17.11.2023.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    static var gameTitle: Color {
            Color(red: 232/255, green: 49/255, blue: 255/255)
        }
    static var resultTitle: Color {
            Color(red: 136/255, green: 236/255, blue: 9/255)
        }
    static var rulesTitle: Color {
            Color(red: 190/255, green: 46/255, blue: 106/255)
        }
}

