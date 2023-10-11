//
//  ContentView.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 03/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            NavigationView {
                TranslateView()
                    .navigationTitle("Translate")
            }
            .tabItem {
                Label("Translate", systemImage: "character.bubble")
            }

            NavigationView {
                LiveView()
                    .navigationTitle("Live")
            }
            .tabItem {
                Label("Live", systemImage: "camera")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

