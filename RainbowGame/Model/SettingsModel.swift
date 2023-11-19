//
//  SettingsModel.swift
//  RainbowGame
//
//  Created by Daniil Kulikovskiy on 16.11.2023.
//

import SwiftUI

enum DefaultBackgroundColors: String, CaseIterable {
    case gray = "Cерый"
    case white = "Белый"
    case black = "Черный"
}

enum WordsArrangements: String, CaseIterable {
    case random = "Случайное"
    case center = "По центру"
}

enum SelectColor: String, CaseIterable {
    case geen = "green"
    case darckGreen = "darcGreen"
    case ping = "ping"
    case lightBlue = "lightBlue"
    case darckRed = "darcRed"
    case purpure = "purpure"
    case blue = "blue"
    case orange = "orange"
    case red = "red"
    case yellow = "yellow"
    case black = "black"
    case darckGray = "darckGray"
}

extension SelectColor {
    var color: Color {
        switch self {
        case .geen:
            return Color(UIColor(red: 0.2687206566, green: 0.9995030761, blue: 0.01149730664, alpha: 1))
        case .darckGreen:
            return Color(UIColor(red: 0.1451833546, green: 0.2311671376, blue: 0.0077144932, alpha: 1))
        case .ping:
            return Color(UIColor(red: 0.9977900386, green: 0.04541384429, blue: 0.6776584983, alpha: 1))
        case .lightBlue:
            return Color(UIColor(red: 0.0263477359, green: 0.7645197511, blue: 0.9987017512, alpha: 1))
        case .darckRed:
            return Color(UIColor(red: 0.3764151931, green: 0.04249276966, blue: 0.04174341261, alpha: 1))
        case .purpure:
            return Color(UIColor(red: 0.8028036952, green: 0.01320633199, blue: 1, alpha: 1))
        case .blue:
            return Color(UIColor(red: 0.2728972733, green: 0.02314549498, blue: 1, alpha: 1))
        case .orange:
            return Color(UIColor(red: 0.9394053221, green: 0.4673838019, blue: 0.03500909731, alpha: 1))
        case .red:
            return Color(UIColor(red: 1, green: 0.02322942391, blue: 0.01790534705, alpha: 1))
        case .yellow:
            return Color(UIColor(red: 0.9982356429, green: 0.8419904709, blue: 0.03334137425, alpha: 1))
        case .black:
            return Color("NightMode")
        case .darckGray:
            return Color(UIColor(red: 0.3674305081, green: 0.3276185393, blue: 0.3588675261, alpha: 1))
        }
    }
}

final class SettingsModel: ObservableObject {
    @AppStorage("speedSwitch") var speedSwitch: Int = 2
    @AppStorage("timeGame") var timeGame: Double = 11
    @AppStorage("checkedTask") var isCheckedTask: Bool = false
    @AppStorage("sizeSymbol") var sizeSymbolRow: Double = 12
    @AppStorage("backgroundSymbol") var isCellBackgroundEnabled: Bool = false

    let colors: [SelectColor] = [SelectColor.geen, SelectColor.darckGreen, SelectColor.ping, SelectColor.lightBlue, SelectColor.darckRed, SelectColor.purpure, SelectColor.blue, SelectColor.orange, SelectColor.red, SelectColor.yellow, SelectColor.black, SelectColor.darckGray]
    @AppStorage("selectColor") var selectColors: [String] = []
    
    
//    @AppStorage("colorsArray") var colorsArray: [String] = [String]()
 
    @AppStorage("defaultBackgroundColor") var defaultBackgroundColor = DefaultBackgroundColors.gray
    @AppStorage("defaultWordArrangement") var defaultWordArrangement = WordsArrangements.random
    
    var fontSize: CGFloat {
        get {
            return CGFloat(sizeSymbolRow)
        }
        set {
            sizeSymbolRow = Double(newValue)
        }
    }
    
    var colorScheme: ColorScheme {
        defaultBackgroundColor == .black ? .dark : .light
    }
    
    var currentBackground: Color {
        switch defaultBackgroundColor {
        case .gray:
            return Color("GreyMode")
        case .white:
            return Color.white
        case .black:
            return Color("NightMode")
        }
    }
    
    func colorPicker(check: String) {
        
        if selectColors.contains(check) {
            selectColors.removeAll { $0 == check}
        } else {
            selectColors.append(check)
        }
    }
    
    //: Add backround color on View
    func backgroundColor() -> some View {
        switch defaultBackgroundColor {
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
    func switchTextColor(colors: DefaultBackgroundColors, text: String) -> Text {
        switch colors {
        case .gray:
            return Text(text)
                .foregroundColor(Color.white)
        case .white:
            return Text(text)
                .foregroundColor(Color.black)
        case .black:
            return Text(text)
                .foregroundColor(Color.white)
        }
    }

}
