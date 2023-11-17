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
    @Published var wordsColors: [Color] = []
 
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
    
    func colorPicker(check: UIColor) {
        
    }
    
    //: add backround color on View
    func backgroundColor(defaultColor: defaultBackgroundColors) -> some View {
        switch defaultColor {
        case .gray:
            return Color("GreyMode")
                .edgesIgnoringSafeArea(.all)
        case .white:
            return Color.white
                .edgesIgnoringSafeArea(.all)
        case .black:
            return Color("NightMode")
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    //: Switch text color
    func switchTextColor(colors: defaultBackgroundColors, text: String) -> Text {
        switch colors {
        case .gray:
            return Text(text)
                .font(.system(size: 36, weight: .semibold, design: .rounded))
                .foregroundColor(Color.white)
        case .white:
            return Text(text)
                .font(.system(size: 36, weight: .semibold, design: .rounded))
                .foregroundColor(Color.black)
        case .black:
            return Text(text)
                .font(.system(size: 36, weight: .semibold, design: .rounded))
                .foregroundColor(Color.white)
        }
    }
    
}
