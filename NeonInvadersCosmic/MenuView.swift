//
//  MenuView.swift
//  NeonInvadersCosmic
//
//  Created by Naiefa on 04/11/2024.
//


import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.init(hex: "#010711"), Color.init(hex: "#000230")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image("settings")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    
                    Spacer()
                    
                  
                }
                Spacer()
                NavigationLink {
                    CosmicNeonGame()
                } label: {
                    ButtonText(text: "PLAY")
                }

               
            }
            .padding()
            
            Image("enstbn")
                .resizable()
                .frame(width: 300, height: 250)
        }
        .navigationBarBackButtonHidden()
        .onAppear() {
            AppDelegate.eroskei = .portrait
        }
        
    }
}
