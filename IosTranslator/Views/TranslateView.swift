//
//  TranslateView.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 03/10/2023.
//

import SwiftUI

struct TranslateView: View {
    
    @EnvironmentObject var viewModel: TranslateViewViewModel

    var body: some View {
        
        VStack {
            // Text field
            TextField("Enter text", text: $viewModel.inputText, axis: .vertical)
                .lineLimit(5, reservesSpace: true)
                .textFieldStyle(.roundedBorder)
                .padding(
                )
            LanguageChangeView()
            
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
