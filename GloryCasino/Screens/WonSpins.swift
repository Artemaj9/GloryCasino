//
//  WonSpins.swift
//

import SwiftUI

struct WonSpins: View {

    @EnvironmentObject var vm: GameLogic
    @State var radius: Double = 10
    @State var opacity: Double = 0
    @State var rotation: Double = 0
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.2)
                .ignoresSafeArea()

            RaysDust()
                .environmentObject(vm)
            

                RadialGradient(gradient: Gradient(colors: [Color.white ,Color("light")]), center: .center, startRadius: 1, endRadius: radius)
                    .opacity(opacity)
                
                    .mask {
                        Image("light")
                            .resizableToFit()
                            .luminanceToAlpha()
                            .rotationEffect(.degrees(rotation))
                            .scaleEffect(1.5)
                            .opacity(0.3)
                        
                    }
                    .animation(.easeInOut(duration: 3), value: radius)
                    .animation(.easeInOut(duration: 2), value: opacity)
                    .animation(.smooth(duration: 2), value: rotation)
                    .hueRotation(Angle(degrees: 90))
            
            
            
            RadialGradient(gradient: Gradient(colors: [Color.white ,Color("light")]), center: .center, startRadius: 1, endRadius: radius)
                .opacity(opacity)
            
                .mask {
                    Image("light")
                        .resizableToFit()
                        .luminanceToAlpha()
                        .rotationEffect(.degrees(rotation))
                        .scaleEffect(1.4)
                        .opacity(0.4)
                    
                }
                .animation(.easeInOut(duration: 3), value: radius)
                .animation(.easeInOut(duration: 2), value: opacity)
                .animation(.smooth(duration: 2), value: rotation)
                .hueRotation(Angle(degrees: 40))
              //  .offset(x: -200)
                .blur(radius: 10)
            
            Image("swonbg\(vm.element)")
                .resizableToFit()
         
                .overlay {
                    if vm.element == 1 {
                        
                        Text("\(vm.freespins[vm.element-1])")
                            .font(.custom(.black, size: 70))
                            .shadow(radius: 5)
                            .overlay {
                                yellowGrad
                                    .rotationEffect(.degrees(180), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .frame(height: 60)
                                    .mask {
                                        Text("\(vm.freespins[vm.element-1])")
                                            .font(.custom(.black, size: 70))
                                    }
                            }
                    }
                    
                    
                    if vm.element == 2 {
                        Image("spinbg2")
                            .resizableToFit()
                            .frame(height: 95)
                            .overlay {
                                Text("\(vm.freespins[1])")
                                    .font(.custom(.black, size: 65))
                                    .shadow(radius: 5)
                                    .overlay {
                                        yellowGrad
                                            .rotationEffect(.degrees(180), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .frame(height: 85)
                                            .mask {
                                                Text("\(vm.freespins[vm.element-1])")
                                                    .font(.custom(.black, size: 65))
                                    }
                      
                                         
                                    }
                            }
                            .offset(y: -vm.size.height*0.04)
                    }
                    
                    
                    
                    if vm.element == 3 {
                        Image("spinbg3")
                            .resizableToFit()
                            .frame(height: 65)
                            .overlay {
                                Text("\(vm.freespins[2])")
                                    .font(.custom(.black, size: 65))
                                    .shadow(radius: 5)
                                    .overlay {
                                        Color.white
                                            .frame(height: 85)
                                            .mask {
                                                Text("\(vm.freespins[vm.element-1])")
                                                    .font(.custom(.black, size: 65))
                                    }
                      
                                         
                                    }
                            }
                            .offset(y: vm.size.height*0.1)
                    }
                    
                    
                    
                    if vm.element == 4 {
                        Image("spinbg4")
                            .resizableToFit()
                            .frame(height: 60)
                            .overlay {
                                Text("\(vm.freespins[2])")
                                    .font(.custom(.black, size: 60))
                                    .shadow(radius: 5)
                                    .overlay {
                                        yellowGrad
                                            .frame(height: 85)
                                            .rotationEffect(.degrees(180), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .mask {
                                                Text("\(vm.freespins[vm.element-1])")
                                                    .font(.custom(.black, size: 60))
                                    }
                            }
                        }
                    }
                }
            
            
            Button {
                withAnimation {
                    vm.wonSpins = false
                }
            
            } label: {
                Image("getbtn")
                    .resizableToFit()
                    .frame(height: 65)
            }
            .offset(y: vm.size.height * 0.35)
        }
        .onAppear {
            radius = 100
            opacity = 1
            rotation = 10
        }
    }
}

#Preview {
    WonSpins()
        .environmentObject(GameLogic())
}
