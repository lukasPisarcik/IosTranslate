//
//  Language.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 11/10/2023.
//

import Foundation

struct Language: Identifiable {
    var id: String { return languageCode }
    let languageCode: String
    let languageName: String
}
