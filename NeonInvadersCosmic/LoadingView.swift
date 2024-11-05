//
//  LoadingView.swift
//  NeonInvadersCosmic
//
//  Created by Naiefa on 04/11/2024.
//

import SwiftUI


struct LoadingView: View {
    @State var goToMenu: Bool = false
    @State var loadingPercentage: Int = 1
    @State var timer: Timer?
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.init(hex: "#010711"), Color.init(hex: "#000230")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            NavigationLink("", destination: MenuView(), isActive: $goToMenu)
            VStack {
                Text("LOADING...")
                      .font(.custom(Font.concert, size: 40))
                      .foregroundStyle(Color.init(hex: "#F85E5E"))
                      .shadow(color: Color.init(hex: "#F75D5D"), radius: 3, x: 0, y: 0)
            }
            
            VStack {
                Spacer()
                
                loadingView()
            }
            .padding()
        }
        .onAppear() {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {
                time in
                if loadingPercentage < 100 {
                    loadingPercentage += 1
                } else {
                    goToMenu = true
                }
            }
        }
    }
    
    func loadingView() -> some View {
        Text("\(String(loadingPercentage))%")
            .font(.custom(Font.concert, size: 30))
            .foregroundStyle(Color.init(hex: "#FF7800"))
    }
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension Font  {
    static var concert: String = "ConcertOne-Regular"
}
