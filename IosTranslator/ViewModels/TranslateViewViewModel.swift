//
//  TranslateViewViewModel.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 11/10/2023.
//

import Foundation

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
        print("translate")
    }
    
    func toggleLanguageSwitch(){
        print("From Language: \(fromLang)")
        print("To Language: \(toLang)")
    }
}
