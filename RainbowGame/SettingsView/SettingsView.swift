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
        ZStack {
            settingsModel.backgroundColor()
            List {
                Section("") {
                    HStack {
                        Text("Время игры, мин")
                        Slider(value: $settingsModel.timeGame, in: 0...20, step: 1)
                        Text("\(settingsModel.timeGame, specifier: "%.0f")")
                    }
                }
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                )
                
                Section("") {
                    HStack {
                        Text("Скорость смены, заданий, сек")
                        Slider(value: $settingsModel.speedSwitch, in: 0...4, step: 1)
                        Text("\(settingsModel.speedSwitch, specifier: "%.0f")")
                    }
                }
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                )
                
                Section("") {
                    HStack {
                        Text("Игра с проверкой заданий")
                        Toggle(isOn: $settingsModel.isCheckedTask) {
                        }
                        .tint(Color.orange)
                    }
                }
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                )
                
                Section("") {
                    CustomColorPiker()
                }
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                )
                
                Section("") {
                    HStack {
                        Stepper("Размер букв", value: $settingsModel.sizeSymbol, in: 17...22, step: 1)
                        Text("Aa")
                            .font(.system(size: settingsModel.sizeSymbol))
                    }
                }
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                )
                Section("") {
                    HStack {
                        Text("Подложка для букв")
                        Toggle(isOn: $settingsModel.backgroundSymbol) {
                        }
                        .tint(Color.orange)
                    }
                }
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                )
                Section("") {
                    VStack(alignment: .leading) {
                        Text("Цвет фона")
                        Picker("", selection: $settingsModel.defaultBackgroundColor) {
                            ForEach(DefaultBackgroundColors.allCases, id: \.self) { word in
                                Text(word.rawValue.capitalized)
                                    .tag(word.rawValue)
                            }
                        }.pickerStyle(.segmented)
                    }
                }
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                )
                Section("") {
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
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                )
            }
//            .background(settingsModel.defaultBackgroundColor)
            .listStyle(.plain)
            .padding(10)
            
            .shadow(radius: 10)
        }
        
    }
}

struct CustomColorPiker: View {
    @EnvironmentObject var settingsModel: SettingsModel
    let colums: [GridItem] = [
        GridItem(.fixed(27), spacing: 2),
        GridItem(.fixed(27), spacing: 2),
    ]
    
    
    var body: some View {
        HStack {
            Text("Цвет букв")
            Spacer()
            LazyHGrid(rows: colums) {
                ForEach(settingsModel.colors, id: \.self) { item in
                    
                    Image(systemName:
                            settingsModel.selectColors.contains(item.rawValue) ? "checkmark.circle.fill" : "circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(item.color)
                        .onTapGesture {
                            settingsModel.colorPicker(check: item.rawValue)
                        }
                }
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
