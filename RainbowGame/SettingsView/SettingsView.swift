//
//  SettingsView.swift
//  RainbowGame
//
//  Created by stimLite on 13.11.2023.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var settingsModel: SettingsModel
    @State private var backgroundSymbol: Bool = false
    
    var body: some View {
        List {
            HStack {
                Text("Время игры, мин")
                Slider(value: $settingsModel.timeGame, in: 1...20, step: 1)
                    .tint(.orange)
                Text("\(settingsModel.timeGame, specifier: "%.0f")")
            }
            .listRowBackground(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(UIColor.systemBackground))
            )
            
            HStack {
                Text("Скорость смены, заданий, сек")
                Slider(
                    value: Binding(
                        get: { Double(settingsModel.speedSwitch) },
                        set: { settingsModel.speedSwitch = Int($0) }
                    ),
                    in: 1...5,
                    step: 1
                )
                    .tint(.orange)
                Text("\(settingsModel.speedSwitch, specifier: "%.0f")")
            }
            .listRowBackground(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(UIColor.systemBackground))
            )
            HStack {
                Text("Игра с проверкой заданий")
                Toggle(isOn: $settingsModel.isCheckedTask) {
                }
                .tint(Color.orange)
            }
            .listRowBackground(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(UIColor.systemBackground))
            )
            
            CustomColorPiker()
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(UIColor.systemBackground))
                )
            
            HStack {
                Stepper("Размер букв", value: $settingsModel.fontSize, in: 17...22, step: 1)
                Text("Aa")
                    .font(.system(size: settingsModel.fontSize))
            }
            .listRowBackground(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(UIColor.systemBackground))
            )
            HStack {
                Text("Подложка для букв")
                Toggle(isOn: $settingsModel.isCellBackgroundEnabled) {
                }
                .tint(Color.orange)
            }
            .listRowBackground(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(UIColor.systemBackground))
            )
            VStack(alignment: .leading) {
                Text("Цвет фона")
                Picker("", selection: $settingsModel.defaultBackgroundColor) {
                    ForEach(DefaultBackgroundColors.allCases, id: \.self) { word in
                        Text(word.rawValue.capitalized)
                            .tag(word.rawValue)
                    }
                }.pickerStyle(.segmented)
            }
            .listRowBackground(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(UIColor.systemBackground))
            )
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
            .listRowBackground(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(UIColor.systemBackground))
            )
        }
        //            .background(settingsModel.defaultBackgroundColor)
        .listStyle(.plain)
        .padding(30)
        .listRowSpacing(25)
        .shadow(radius: 10)
        .background(settingsModel.backgroundColor())
        .preferredColorScheme(settingsModel.colorScheme)
        .navigationTitle("Настройки")
        .specialNavBar(with: settingsModel.currentBackground, complition: {
            presentationMode.wrappedValue.dismiss()
        })
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
                    if settingsModel.selectColors.contains(item.rawValue) {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(.white, item.color)
                            .onTapGesture {
                                settingsModel.colorPicker(check: item.rawValue)
                            }
                    } else {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(item.color)
                            .onTapGesture {
                                settingsModel.colorPicker(check: item.rawValue)
                            }
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
