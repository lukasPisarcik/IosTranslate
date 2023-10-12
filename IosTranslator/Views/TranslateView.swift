//
//  TranslateView.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 03/10/2023.
//

import SwiftUI

struct TranslateView: View {
    
    @StateObject var viewModel = TranslateViewViewModel()
        
    var body: some View {
        
        VStack {
            // Text field
            TextField("Enter text", text: $viewModel.inputText, axis: .vertical)
                .lineLimit(5, reservesSpace: true)
                .textFieldStyle(.roundedBorder)
                .padding(
                )
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
            
            // Translation result
            TextField("Translation...", text: $viewModel.outputText)
                .disabled(true)
                .lineLimit(5, reservesSpace: true)
                .textFieldStyle(.roundedBorder)
                .frame(height:120)
                .padding()
            Button {
                // Translate
                viewModel.translate()
            } label: {
                Text("Translate")
            }
            .buttonStyle(.borderedProminent)
            .font(.headline)
            .fontWeight(.bold)
        }
        Spacer()
    }
}

struct TranslateView_Previews: PreviewProvider {
    static var previews: some View {
        TranslateView()
    }
}
