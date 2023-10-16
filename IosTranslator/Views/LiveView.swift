//
//  LiveView.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 03/10/2023.
//

import SwiftUI

struct LiveView: View {
    @EnvironmentObject var viewModel: LiveViewViewModel
    @EnvironmentObject var translateViewModel: TranslateViewViewModel

    var body: some View {
        switch viewModel.dataScannerAccessStatus {
        case .notDetermined:
            Text("notDetermined")
        case .cameraAccessNotGranted:
            Text("cameraAccessNotGranted")
        case .cameraNotAvailable:
            Text("cameraNotAvailable")
        case .scannerAvailable:
            mainView
        case .scannerNotAvailable:
            Text("scannerNotAvailable")
        }
    }
    
    private var mainView: some View {
        ZStack(alignment: .bottomLeading) {
                DataScannerView(recognizedItems: $viewModel.recognizedItems)
                    .background { Color.gray.opacity(0.3) }
                    .ignoresSafeArea()
                
                bottomContainerView
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .frame(maxWidth: .infinity, maxHeight: 200, alignment:.bottom)
                    .padding()
            }
    }
    
    private var bottomContainerView: some View {
            VStack {
                LanguageChangeView()
                Text("Translation")
                    .bold()
                    .padding()
                    .font(.headline)
                ScrollView {
                    Text(translateViewModel.outputText)
                }
            }
        }
}



struct LiveView_Previews: PreviewProvider {
    static var previews: some View {
        LiveView()
    }
}
