//
//  FireQuest.swift
//

import SwiftUI

struct FireQuest: View {
    var body: some View {
        ZStack {
            Image("questbg2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(1.005)
            
            ZStack {
                Image("fitem1")
                    .resizableToFit()
                    .frame(height: 200)
                    .offset(y: -150)
                
                Image("fitem2")
                    .resizableToFit()
                    .frame(height: 200)
                    .offset(x: 70, y: -90)
                
                Image("fitem3")
                    .resizableToFit()
                    .frame(width: 200)
                    .offset(x: 100)
                
                Image("fitem4")
                    .resizableToFit()
                    .frame(width: 200)
                    .offset(x: 80, y: 80)
                
                
                Image("fitem5")
                    .resizableToFit()
                    .frame(width: 100)
                    .offset(y: 150)
                
                Image("fitem6")
                    .resizableToFit()
                    .frame(width: 200)
                    .offset(x: -90, y: 90)
                
                Image("fitem7")
                    .resizableToFit()
                    .frame(width: 200)
                    .offset(x: -100)
                
                Image("fitem8")
                    .resizableToFit()
                    .frame(width: 200)
                    .offset(x: -70, y: -70)
                Image("center")
                    .resizableToFit()
                    .frame(width: 190)
            }
            .offset(y: -50)
     
            
            
            

        }
    }
}

#Preview {
    FireQuest()
}
