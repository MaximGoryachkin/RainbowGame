//
//  RulesView.swift
//  RainbowGame
//
//  Created by Михаил Данилин on 16.11.2023.
//

import SwiftUI

struct RulesView: View {
    @EnvironmentObject var settingsModel: SettingsModel
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            settingsModel.backgroundColor()
            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    
                    // Заголовок правил
                    Text("ПРАВИЛА ИГРЫ")
                        .font(.title)
                        .foregroundColor(.rulesTitle)
                        .padding(.bottom, 16)
                        .frame(maxWidth: .infinity, alignment: .center)
                    // Текстовые правила
                    VStack(alignment: .center, spacing: 14) {
                        Text("На экране в случайном месте появляется слово, обозначающее цвет, например: написано")
                            .foregroundColor(.black)
                        + Text(" «синий»")
                            .foregroundColor(.red)
                        + Text(":")
                            .foregroundColor(.black)
                    }
                    .font(.body)
                    .padding(14)
                    
                    HStack {
                        Image("2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .padding(10)
                        Image("1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .padding(10)
                    }
                    
                    // Дополнительные текстовые правила
                    VStack {
                        Text("Нужно произнести вслух цвет слова (если опция «подложка для букв» выключена) или цвет фона, на котором написано слово (если опция «подложка для букв» включена):")
                            .foregroundColor(.black)
                        
                        + Text(" говорим «зеленый»")
                            .foregroundColor(.red)
                    }
                    .font(.body)
                    .padding(14)
                    
                    Text("В игре можно изменять скорость от 1x до 5x. А так же длительность игры.")
                        .padding(14)
                }
                .font(.body)
                .padding(16)
                .frame(maxWidth: 500)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(radius: 5)
                )
            }
            .navigationTitle("Помощь")
            .frame(maxWidth: .infinity)
            .specialNavBar(with: settingsModel.currentBackground, complition: {
                presentationMode.wrappedValue.dismiss()
            })
            .padding(.top, 50)
            .padding(.horizontal, 25)
        }
        .preferredColorScheme(settingsModel.colorScheme)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
            .environmentObject(SettingsModel())
    }
}

//struct RulesView_Previews: PreviewProvider {
//    static var previews: some View {
//        RulesView()
//    }
//}
