//
//  IosTranslatorApp.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 03/10/2023.
//

import SwiftUI

@main
struct IosTranslatorApp: App {
    @StateObject private var viewModel = TranslateViewViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
