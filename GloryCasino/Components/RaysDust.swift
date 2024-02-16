//
//  RaysDust.swift
//

import SwiftUI

struct RaysDust: View {
    @State var radius: Double = 10
    @State var opacity: Double = 0
    @State var rotation: Double = 0
    @State var offsetY: CGFloat = 0
    @EnvironmentObject var vm: GameLogic
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.2)
                .ignoresSafeArea()
           
            RadialGradient(gradient: Gradient(colors: [Color.white ,Color("light")]), center: .center, startRadius: 100, endRadius: 150)
                .ignoresSafeArea()
                .opacity(opacity)
                .animation(.easeInOut(duration: 1), value: opacity)
                .mask {
                    ZStack {
                        Image("dust")
                            .resizable()
                            .scaledToFit()
                            .offset(x: -vm.size.width*0.2)
                            .scaleEffect(1)
                           
                        Image("dust")
                            .resizable()
                            .scaledToFit()
                            .rotationEffect(Angle(degrees: 180))
                            .offset(x: vm.size.width*0.2)
                    }
                    .ignoresSafeArea()
                }
           
            RadialGradient(gradient: Gradient(colors: [Color.white ,Color("light")]), center: .center, startRadius: 1, endRadius: radius)
                .opacity(opacity)
            
                .mask {
                    Image("light")
                        .resizableToFit()
                        .scaleEffect(2.5)
                        .luminanceToAlpha()
                        
                    
                        .rotationEffect(.degrees(rotation))
                    
                }
                .animation(.easeInOut(duration: 3), value: radius)
                .animation(.easeInOut(duration: 2), value: opacity)
                .animation(.smooth(duration: 2), value: rotation)
                .offset(y : 0)
        
            
            RadialGradient(gradient: Gradient(colors: [Color.white ,Color("light")]), center: .center, startRadius: 1, endRadius: radius)
                .opacity(opacity)
            
                .mask {
                    Image("light")
                        .resizableToFit()
                        .scaleEffect(2.5)
                        .luminanceToAlpha()
                        .rotationEffect(Angle(degrees: -200))
                        
                    
                        .rotationEffect(.degrees(rotation))
                    
                }
                .animation(.easeInOut(duration: 3), value: radius)
                .animation(.easeInOut(duration: 2), value: opacity)
                .animation(.smooth(duration: 2), value: rotation)
                .offset(y : 0)
            
            
            RadialGradient(gradient: Gradient(colors: [Color.white ,Color("light")]), center: .center, startRadius: 1, endRadius: radius)
                .opacity(opacity)
             
            
                .mask {
                    Image("light")
                        .resizableToFit()
                        .scaleEffect(1.5)
                        .luminanceToAlpha()
                        
                        .rotationEffect(Angle(degrees: 100))
                        .rotationEffect(.degrees(rotation))
                    
                }
                .animation(.easeInOut(duration: 3), value: radius)
                .animation(.easeInOut(duration: 2), value: opacity)
                .animation(.smooth(duration: 2), value: rotation)
                .offset(y : 0)
        }
        .onAppear {
            radius = 100
            opacity = 1
            rotation = 10
        }
    }
}

#Preview {
    RaysDust()
        .environmentObject(GameLogic())
}
