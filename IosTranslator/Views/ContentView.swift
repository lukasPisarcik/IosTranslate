//
//  ContentView.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 03/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = LiveViewViewModel()
    
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
                    .navigationBarTitleDisplayMode(.inline)
                    .environmentObject(vm)
                    .task {
                        await vm.requestDataScannerAccessStatus()
                    }
            }
            .tabItem {
                Label("Live", systemImage: "camera")
            }
        }
        .toolbarBackground(.ultraThinMaterial, for: .tabBar)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

