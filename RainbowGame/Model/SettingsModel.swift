//
//  SettingsModel.swift
//  RainbowGame
//
//  Created by Daniil Kulikovskiy on 16.11.2023.
//

import SwiftUI

final class SettingsModel: ObservableObject {
    @AppStorage("speedSwitch") var speedSwitch: Double = 2
    @AppStorage("timeGame") var timeGame: Double = 11
    @AppStorage("checkedTask") var isCheckedTask: Bool = false
    @AppStorage("sizeSymbol") var sizeSymbolRow: Double = 12
    @AppStorage("backgroundSymbol") var backgroundSymbol: Bool = false
    
    var backgroundСolor: [String: String] = ["Белый": ".white", "Черный": ".black", "Серый": ".gray",]
    var defaultBackgroundColor = ".gray"
    var wordArrangement = ["Случайное", "По центру"]
    var defaultWordArrangement = "Случайное"
    
    var sizeSymbol: CGFloat {
        get {
            return CGFloat(sizeSymbolRow)
        }
        set {
            sizeSymbolRow = Double(newValue)
        }
    }
    
}
