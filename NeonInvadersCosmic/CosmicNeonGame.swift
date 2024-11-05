//
//  BrainGameView.swift
//  NeonInvadersCosmic
//
//  Created by Naiefa on 05/11/2024.
//

import SwiftUI

struct CosmicNeonGame: View {
    @State var rotationGoing: Bool = false
    @State var showGame: Bool = false
    @State var game: URL = URL(string: "https://plays.org/game/neon-invaders/")!
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.init(hex: "#010711"), Color.init(hex: "#000230")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            Image("enstbn")
                .resizable()
                .frame(width: 300, height: 250)
                .rotationEffect(.degrees(rotationGoing ? 2000 : 0))
                .animation(Animation.linear(duration: 20), value: rotationGoing)
            
            WKWebViewRepresentable(url: game)
//                .frame(width: 400, height: 300)
                .cornerRadius(20)
                .opacity(showGame ? 1 : 0)
                
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BackBtn())
        .onAppear() {
            rotationGoing = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                showGame = true 
            }
        }
//        .toolbar {
//            ToolbarItem(placement: .principal) {
//               
//            }
//        }
        .onAppear() {
            AppDelegate.eroskei = .landscape
        }
    }
}
