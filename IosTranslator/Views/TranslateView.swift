//
//  TranslateView.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 03/10/2023.
//

import SwiftUI

struct TranslateView: View {
    
    @StateObject var viewModel = TranslateViewViewModel()
    
    let languages = ["Slovak", "Czech", "English"]
    
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
                    ForEach(languages, id: \.self) { language in
                        Text(language).tag(language)
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
                    ForEach(languages, id: \.self) { language in
                        Text(language).tag(language)
                    }
                }
                .labelsHidden()
            }
            
            // Translation result
            TextField("Translation...", text: $viewModel.outputText)
                .disabled(true)
                .lineLimit(5, reservesSpace: true)
                .textFieldStyle(.roundedBorder)
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
