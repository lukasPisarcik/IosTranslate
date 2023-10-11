//
//  TranslateViewViewModel.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 11/10/2023.
//

import Foundation
import MLKit

class TranslateViewViewModel: ObservableObject {
    
    @Published var fromLang: String = ""
    @Published var toLang: String = ""
    @Published var inputText: String = ""
    @Published var outputText: String = ""
    
    
    init(){}
    
    func translate() {
        guard !inputText.trimmingCharacters(in: .whitespaces).isEmpty,
              !fromLang.trimmingCharacters(in: .whitespaces).isEmpty,
              !toLang.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            print("invalid")
            return
        }
        makeTheTranslation()
    }
    
    func makeTheTranslation(){
        // Create an English-German translator:
        let options = TranslatorOptions(sourceLanguage: .english, targetLanguage: .german)
        let englishGermanTranslator = Translator.translator(options: options)
        
        let conditions = ModelDownloadConditions(
            allowsCellularAccess: false,
            allowsBackgroundDownloading: true
        )
        englishGermanTranslator.downloadModelIfNeeded(with: conditions) { error in
            guard error == nil else { return }
            
            // Model downloaded successfully. Okay to start translating.
            englishGermanTranslator.translate("Hello world") { translatedText, error in
                guard error == nil, let translatedText = translatedText else { return }
                
                // Translation succeeded.
                self.outputText = translatedText
                
            }
        }
    }
    
    func toggleLanguageSwitch(){
        print("From Language: \(fromLang)")
        print("To Language: \(toLang)")
    }
}
