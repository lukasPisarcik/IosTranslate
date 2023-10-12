//
//  TranslateViewViewModel.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 11/10/2023.
//

import Foundation
import MLKit

class TranslateViewViewModel: ObservableObject {
    
    @Published var inputText: String = ""
    @Published var outputText: String = ""
    @Published var allLanguages: [TranslateLanguage] = Array(TranslateLanguage.allLanguages())
    @Published var fromLang: TranslateLanguage = .english
    @Published var toLang: TranslateLanguage = .english
    
    
    init(){}
    
    func translate() {
        guard !inputText.trimmingCharacters(in: .whitespaces).isEmpty else {
            print("invalid")
            return
        }
                
        let translator = Translator.translator(
            options: TranslatorOptions(
                sourceLanguage: fromLang,
                targetLanguage: toLang
            )
        )
        
        // download options
        let conditions = ModelDownloadConditions(
            allowsCellularAccess: false,
            allowsBackgroundDownloading: true
        )
        
        // download model
        translator.downloadModelIfNeeded(with: conditions) { error in
            guard error == nil else { return }
            
            // Model downloaded successfully. Okay to start translating.
            translator.translate(self.inputText) { translatedText, error in
                guard error == nil, let translatedText = translatedText else { return }
                
                // Translation succeeded.
                self.outputText = translatedText
            }
        }
    }
    
    func toggleLanguageSwitch(){
        print("From Language: \(fromLang)")
        print("To Language: \(toLang)")
        (fromLang, toLang) = (toLang, fromLang)
        print("*From Language: \(fromLang)")
        print("To Language: \(toLang)")
    }
}
