//
//  TranslateView.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 03/10/2023.
//

import SwiftUI

struct TranslateView: View {
    
    @State var toLang: String
    @State var inputText: String
    
    let languages = ["Slovak", "Czech", "English"]
    
    var body: some View {
        
        VStack {
            
            // Text field
            TextField("Enter text", text: self.$inputText, axis: .vertical)
                .lineLimit(5, reservesSpace: true)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            HStack {
                // Language change
                Picker("Translate to", selection: $toLang) {
                    ForEach(languages, id: \.self) { language in
                        Text(language).tag(language)
                    }
                }
                .labelsHidden()
                
                // Change inputs button
                Button {
                    
                } label: {
                    Image(systemName: "repeat")
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            
            // Translation result
            TextField("Translation...", text: self.$inputText, axis: .vertical)
                .lineLimit(5, reservesSpace: true)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button {
                // Translate
            } label: {
                Text("Translate")
            }
            .buttonStyle(.borderedProminent)
            .font(.headline)
            .fontWeight(.bold)
            .padding()
        }
        Spacer()
    }
}

struct TranslateView_Previews: PreviewProvider {
    static var previews: some View {
        TranslateView(toLang: "English", inputText: "")
    }
}
