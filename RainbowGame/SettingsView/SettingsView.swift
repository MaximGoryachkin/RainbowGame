//
//  SettingsView.swift
//  RainbowGame
//
//  Created by stimLite on 13.11.2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsModel: SettingsModel
    @State private var backgroundSymbol: Bool = false
    @State private var colorSymbol = Color.red
    
    var body: some View {
        List{
            Section {
                HStack {
                    Text("Время игры, мин")
                    Slider(value: $settingsModel.timeGame, in: 0...20, step: 1)
                    Text("\(settingsModel.timeGame, specifier: "%.0f")")
                }
            }
            Section {
                HStack {
                    Text("Скорость смены, заданий, сек")
                    Slider(value: $settingsModel.speedSwitch, in: 0...4, step: 1)
                    Text("\(settingsModel.speedSwitch, specifier: "%.0f")")
                }
            }
            
            Section {
                HStack {
                    Text("Игра с проверкой заданий")
                    Toggle(isOn: $settingsModel.isCheckedTask) {
                    }
                    .tint(Color.orange)
                }
            }
            
            Section {
                HStack {
                    Text("Цвет букв")
                    Spacer()
                    CustomColorPiker()
                }
            }
            Section {
                HStack {
                    Stepper("Размер букв", value: $settingsModel.sizeSymbol, in: 17...22, step: 1)
                    Text("Aa")
                        .font(.system(size: settingsModel.sizeSymbol))
                }
            }
            Section {
                HStack {
                    Text("Подложка для букв")
                    Toggle(isOn: $settingsModel.backgroundSymbol) {
                    }
                    .tint(Color.orange)
                }
            }
            Section {
                VStack(alignment: .leading) {
                    Text("Цвет фона")
                    Picker("", selection: $settingsModel.defaultBackgroundColor) {
                        ForEach(DefaultBackgroundColors.allCases, id: \.self) { word in
                            Text(word.rawValue.capitalized)
                                .tag(word.rawValue)
                        }
                    }                    .pickerStyle(.segmented)
                }
            }
            Section {
                VStack(alignment: .leading) {
                    Text("Расположение слова на экране")
                    Picker("", selection: $settingsModel.defaultWordArrangement) {
                        ForEach(WordsArrangements.allCases, id: \.self) { word in
                            Text(word.rawValue.capitalized)
                                .tag(word.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
        }
    }
}

struct CustomColorPiker: View {
    @EnvironmentObject var settingsModel: SettingsModel
    let colors: [Color] = [Color(#colorLiteral(red: 0.2687206566, green: 0.9995030761, blue: 0.01149730664, alpha: 1)), Color(#colorLiteral(red: 0.1451833546, green: 0.2311671376, blue: 0.0077144932, alpha: 1)), Color(#colorLiteral(red: 0.9977900386, green: 0.04541384429, blue: 0.6776584983, alpha: 1)), Color(#colorLiteral(red: 0.0263477359, green: 0.7645197511, blue: 0.9987017512, alpha: 1)), Color(#colorLiteral(red: 0.3764151931, green: 0.04249276966, blue: 0.04174341261, alpha: 1)), Color(#colorLiteral(red: 0.8028036952, green: 0.01320633199, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.2728972733, green: 0.02314549498, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.9394053221, green: 0.4673838019, blue: 0.03500909731, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.02322942391, blue: 0.01790534705, alpha: 1)), Color(#colorLiteral(red: 0.9982356429, green: 0.8419904709, blue: 0.03334137425, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0.3674305081, green: 0.3276185393, blue: 0.3588675261, alpha: 1))]
    let colums: [GridItem] = [
        GridItem(.fixed(27), spacing: 2),
        GridItem(.fixed(27), spacing: 2),
    ]
    
    
    var body: some View {
        LazyHGrid(rows: colums) {
            ForEach(colors, id: \.self) { item in
                Button {
                    settingsModel.wordsColors.append(item)
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                }.accentColor(item)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(SettingsModel())
    }
}
