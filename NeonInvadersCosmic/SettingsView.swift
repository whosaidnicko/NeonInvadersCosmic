//
//  SettingsView.swift
//  NeonInvadersCosmic
//
//  Created by Naiefa on 05/11/2024.
//

import SwiftUI


struct SettingsView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.init(hex: "#010711"), Color.init(hex: "#000230")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
          
            
            VStack {
                Button {
                    if let url = URL(string: "mailto:brincksvivien@gmail.com") {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }
                } label: {
                    ButtonText(text: "CONTACT US")
                }

               
                Button {
                    if let url = URL(string: "https://www.dropbox.com/scl/fi/152abktjmpem4bd5vxch3/Privacy-Policy-for-NeonInvadersCosmic.papert?rlkey=9nq0zniozzx22i1j8c5ydvx7y&st=7xwsoav8&dl=0") {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    ButtonText(text: "PRIVACY")
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BackBtn())
        .toolbar {
                  ToolbarItem(placement: .principal) {
                      Text("SETTINGS")
                            .font(.custom(Font.concert, size: 30))
                            .foregroundStyle(Color.init(hex: "#F85E5E"))
                            .shadow(color: Color.init(hex: "#F75D5D"), radius: 3, x: 0, y: 0)                  }
              }
    }
}
