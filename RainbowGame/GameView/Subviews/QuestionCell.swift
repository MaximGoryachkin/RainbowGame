//
//  QuestionCell.swift
//  RainbowGame
//
//  Created by Илья Шаповалов on 19.11.2023.
//

import SwiftUI
import Models

struct QuestionCell: View {
    @EnvironmentObject private var settings: SettingsModel
    
    @Binding var question: Question
    
    private var alignment: HorizontalAlignment {
        switch settings.defaultWordArrangement {
        case .center:
            return .center
            
        case .random:
            return [
                HorizontalAlignment.center,
                HorizontalAlignment.leading,
                HorizontalAlignment.trailing
            ].randomElement() ?? .center
        }
    }
    
    var body: some View {
        VStack(alignment: alignment) {
            HStack {
                Text(question.colorName.capitalized)
                    .font(.system(size: settings.fontSize))
                    .foregroundStyle(question.symbolColor)
                    .padding()
                    .padding(.trailing, 10)
                if settings.isCheckedTask {
                    Toggle("", isOn: $question.isAnswered)
                        .toggleStyle(CheckboxIOS())
                        .frame(width: settings.fontSize)
                        .tint(.black)
                        .background(Color.white)
                }
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .background(
                settings.isCellBackgroundEnabled
                ? question.backgroundColor
                : .clear
            )
            .shadow(radius: 5)
        }
    }
}

#Preview {
    VStack {
        QuestionCell(
            question: .constant(.sample[0])
        )
        .environmentObject(SettingsModel())
    }
}
