//
//  SettingsModel.swift
//  RainbowGame
//
//  Created by Daniil Kulikovskiy on 16.11.2023.
//

import SwiftUI

enum defaultBackgroundColors: String, CaseIterable {
    case gray = "Cерый"
    case white = "Белый"
    case black = "Черный"
}

enum WordsArrangements: String, CaseIterable {
    case random = "Случайное"
    case center = "По центру"
}

final class SettingsModel: ObservableObject {
    @AppStorage("speedSwitch") var speedSwitch: Double = 2
    @AppStorage("timeGame") var timeGame: Double = 11
    @AppStorage("checkedTask") var isCheckedTask: Bool = false
    @AppStorage("sizeSymbol") var sizeSymbolRow: Double = 12
    @AppStorage("backgroundSymbol") var backgroundSymbol: Bool = false
//    @AppStorage("wordsColors") var wordsColors: [UIColor] = []
    
//    var backgroundСolor: [String: String] = ["Белый": ".white", "Черный": ".black", "Серый": ".gray",]
    @AppStorage("defaultBackgroundColor") var defaultBackgroundColor = defaultBackgroundColors.gray
    @AppStorage("defaultWordArrangement") var defaultWordArrangement = WordsArrangements.random
    
    var sizeSymbol: CGFloat {
        get {
            return CGFloat(sizeSymbolRow)
        }
        set {
            sizeSymbolRow = Double(newValue)
        }
    }
    
}
