//
//  LanguageChangeView.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 16/10/2023.
//

import SwiftUI

struct LanguageChangeView: View {
    @EnvironmentObject var viewModel: TranslateViewViewModel

    var body: some View {
        HStack {
            // Language change
            Picker("Translate to", selection: $viewModel.fromLang) {
                ForEach(viewModel.allLanguages, id: \.self) { language in
                    Text(language.rawValue).tag(language)
                }
            }
            .labelsHidden()
            
            // Change inputs button
            Button {
                viewModel.toggleLanguageSwitch()
            } label: {
                Image(systemName: "repeat")
            }
            .buttonStyle(.borderedProminent)
            
            // Language change
            Picker("Translate to", selection: $viewModel.toLang) {
                ForEach(viewModel.allLanguages, id: \.self) { language in
                    Text(language.rawValue).tag(language)
                }
            }
            .labelsHidden()
        }
    }
}

#Preview {
    LanguageChangeView()
}
