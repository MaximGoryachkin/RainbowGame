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
                settingsModel.backgroundColor(defaultColor: settingsModel.defaultBackgroundColor)
                
                ScrollView {
                    VStack(alignment: .center, spacing: 16) {
                
                        // Заголовок правил
                        Text("Правила Игры")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(.purple)
                            .padding(.bottom, 16)
                            .frame(maxWidth: .infinity, alignment: .center)
                        // Текстовые правила
                        VStack(alignment: .center, spacing: 14) {
                            Text("На экране в случайном месте появляется слово, обозначающее цвет, например: написано")
                                .font(.body)
                                .foregroundColor(.black)
                            
                            + Text(" «синий»")
                                .font(.body)
                                .foregroundColor(.red)
                            + Text(":")
                                .font(.body)
                                .foregroundColor(.black)
                        }
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
                                .font(.body)
                                .foregroundColor(.black)
                                
                            + Text(" говорим «зеленый»")
                                .font(.body)
                                .foregroundColor(.red)
                        }
                        .padding(14)
                        
                        Text("В игре можно изменять скорость от 1x до 5x. А так же длительность игры.")
                            .font(.body)
                            .padding(14)
                    }
                    .padding(16)
                    .frame(maxWidth: 500)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .shadow(radius: 5)
                    )
                }
                .navigationBarTitle("Помощь", displayMode: .inline)
                .font(.system(size: 40, weight: .bold))
                
                .frame(maxWidth: .infinity)
                .navigationBarItems(leading: Button(action: {
                    // Действие при нажатии на кнопку "Назад"
                    // Вместо print() вы можете добавить код для обработки нажатия на кнопку "Назад"
                    presentationMode.wrappedValue.dismiss()

                }) {
                    Image(systemName: "arrow.left")
                        .font(.title)
                })
                .padding(.top, 50)
                .padding(.horizontal, 25)
            }
            .background(Color.gray)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .navigationBarBackButtonHidden()
        }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
            .environmentObject(SettingsModel())
    }
}
