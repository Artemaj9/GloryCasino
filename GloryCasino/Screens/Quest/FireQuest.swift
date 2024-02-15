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
                ZStack {
                    Image("fitem1")
                        .resizableToFit()
                        .frame(height: 200)
                        .offset(y: -150)
                    Image("fopen1")
                        .resizableToFit()
                        .frame(height: 200)
                        .offset(y: -150)
                }
                
                ZStack {
                    Image("fitem2")
                        .resizableToFit()
                        .frame(height: 200)
                        .offset(x: 70, y: -90)
                    Image("fopen2")
                        .resizableToFit()
                        .frame(height: 200)
                        .offset(x: 70, y: -90)
                }
                
                ZStack {
                    Image("fitem3")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: 100)
                    Image("fopen3")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: 100)
                }
                
                ZStack {
                    Image("fitem4")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: 80, y: 80)
                    
                    Image("fopen4")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: 80, y: 80)
                    
                }
                
                ZStack {
                    Image("fitem5")
                        .resizableToFit()
                        .frame(width: 100)
                        .offset(y: 150)
                    
                    Image("fopen5")
                        .resizableToFit()
                        .frame(width: 100)
                        .offset(y: 150)
                }
                
                ZStack {
                    Image("fitem6")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: -90, y: 90)
                    
                    Image("fopen6")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: -90, y: 90)
                }
                
                ZStack {
                    Image("fitem7")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: -100)
                    Image("fopen7")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: -100)
                }
                
                ZStack {
                    Image("fitem8")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: -70, y: -70)
                    
                    Image("fopen8")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: -70, y: -70)
                }
                
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
