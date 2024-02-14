//
//  SplashView.swift
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var vm: GameLogic
    var body: some View {
        ZStack {
            BackgroundView()
                .background {
                    GeometryReader { geo in
                        Color.clear
                            .onAppear {
                                vm.size = geo.size
                                print("Height : \(geo.size.height)")
                                print("Width: \(geo.size.width)")
                            }
                    }
                }
            Image("splash")
                .resizableToFit()
                .frame(width: 200)
                .saturation(1)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
        .environmentObject(GameLogic())
}
