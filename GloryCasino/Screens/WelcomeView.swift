//
//  WelcomeView.swift
//

import SwiftUI

struct WelcomeView: View {
    @State var screen = 4
    var body: some View {
        ZStack {
          
            Image("welcomebg\(screen)")
               .resizable()
               .scaledToFill()
               .scaleEffect(1.005)
            
         
            BackStartStack(screen: $screen)
                .padding(.bottom, 24)
                
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView()
}
