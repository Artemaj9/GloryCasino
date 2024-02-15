//
//  AirQuest.swift
//

import SwiftUI

struct AirQuest: View {
    @EnvironmentObject var vm: GameLogic
    
    var body: some View {
        ZStack {
            Image("airquestbg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(1.005)
            
            Image("logo4")
                .resizableToFit()
                .frame(width: vm.size.width * 0.85)
                .offset(y: -vm.size.height * 0.39)
            ZStack {
                ForEach (1..<9) { i in
                    ZStack {
                        Image("aitem\(i)")
                            .resizableToFit()
                            .opacity(vm.airItems[i-1] ? 0 : 1)
                        Image("aopen\(i)")
                            .resizableToFit()
                            .scaleEffect(0.9)
                            .opacity(vm.airItems[i-1] ? 1 : 0)
                    }
                    .frame(width: vm.size.height * 0.16)
                    .offset(x: vm.size.width * aGeo[i-1].xCoef ,y: vm.size.height * aGeo[i-1].yCoef)
                    
                }
                Image("airlabel")
                    .resizableToFit()
                    .frame(width: vm.size.width * 0.7)
                    .offset(y: vm.size.height * 0.3)
                
                Image("airpointsbg")
                    .resizableToFit()
                    .frame(width: vm.size.width * 0.35)
                    .offset(y: vm.size.height * 0.38)
            }
            .offset(y: -vm.size.height * 0.04)
            
//            ZStack {
//                ZStack {
//                    Image("aitem1")
//                        .resizableToFit()
//                    Image("aopen1")
//                        .resizableToFit()
//                        .scaleEffect(0.9)
//                }
//                    .frame(width: vm.size.height * 0.16)
//                    .offset(x: -vm.size.width * 0.32 ,y: -vm.size.height * 0.2)
//                ZStack {
//                    Image("aitem2")
//                        .resizableToFit()
//                    Image("aopen2")
//                        .resizableToFit()
//                        .scaleEffect(0.9)
//                }
//                .frame(width: vm.size.height * 0.16)
//                .offset(x: vm.size.width * 0.32 ,y: -vm.size.height * 0.2)
//                
//                ZStack {
//                    Image("aitem3")
//                        .resizableToFit()
//                    Image("aopen3")
//                        .resizableToFit()
//                        .scaleEffect(0.9)
//                }
//                    .frame(width: vm.size.height * 0.16)
//                    .offset(x: vm.size.width * 0 ,y: -vm.size.height * 0.12)
//                ZStack {
//                    Image("aitem4")
//                        .resizableToFit()
//                    Image("aopen4")
//                        .resizableToFit()
//                        .scaleEffect(0.9)
//                }
//                    .frame(width: vm.size.height * 0.16)
//                    .offset(x: vm.size.width * 0.32 ,y: vm.size.height * 0)
//                ZStack {
//                    Image("aitem5")
//                        .resizableToFit()
//                    Image("aopen5")
//                        .resizableToFit()
//                        .scaleEffect(0.9)
//                }
//                    .frame(width: vm.size.height * 0.16)
//                    .offset(x: -vm.size.width * 0.32 ,y: -vm.size.height * 0)
//                
//                ZStack {
//                    Image("aitem6")
//                        .resizableToFit()
//                    Image("aopen6")
//                        .resizableToFit()
//                        .scaleEffect(0.9)
//                }
//                    .frame(width: vm.size.height * 0.16)
//                    .offset(x: -vm.size.width * 0.32 ,y: vm.size.height * 0.2)
//                
//                ZStack {
//                    Image("aitem7")
//                        .resizableToFit()
//                    
//                    Image("aopen7")
//                        .resizableToFit()
//                        .scaleEffect(0.9)
//                }
//                    .frame(width: vm.size.height * 0.16)
//                    .offset(x: vm.size.width * 0 ,y: vm.size.height * 0.09)
//                ZStack {
//                    Image("aitem8")
//                        .resizableToFit()
//                    Image("aopen8")
//                        .resizableToFit()
//                        .scaleEffect(0.9)
//                }
//                    .frame(width: vm.size.height * 0.16)
//                    .offset(x: vm.size.width * 0.32 ,y: vm.size.height * 0.2)
//                
//                Image("airlabel")
//                    .resizableToFit()
//                    .frame(width: vm.size.width * 0.7)
//                    .offset(y: vm.size.height * 0.3)
//                
//                Image("airpointsbg")
//                    .resizableToFit()
//                    .frame(width: vm.size.width * 0.35)
//                    .offset(y: vm.size.height * 0.38)
//            }
//            .offset(y: -vm.size.height * 0.04)
            
            Button {
            
            } label: {
                Image("greenbtnbg")
                    .resizableToFit()
                    .scaleEffect(x: 0.8, y: 1)
                    .frame(height: 60)
                    .overlay {
                        Text("BACK")
                            .foregroundStyle(.white)
                            .font(.custom(.black, size: 35))
                            .offset(y: -6)
                            .shadow(color: Color("txtgreenshadow"), radius: 1, y: 2)
                            .shadow(color: .black.opacity(0.25), radius: 1)
                    }
            }
            .offset(y: vm.size.height * 0.44)
         
        }
        .onAppear {
            vm.airItems[0] = true
            vm.airItems[1] = true
            vm.airItems[2] = true
            vm.airItems[3] = true
        }
        
    }
}

#Preview {
    AirQuest()
        .environmentObject(GameLogic())
}
