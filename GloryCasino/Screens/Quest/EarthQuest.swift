//
//  EarthQuest.swift
//

import SwiftUI

struct EarthQuest: View {
    @EnvironmentObject var vm: GameLogic
    var body: some View {
        ZStack {
            Image("questbg1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Image("questtable\(vm.element)")
                .resizableToFit()
                .overlay(alignment: .bottom) {
                    Image("questlabelbg1")
                        .resizableToFit()
                        .frame(height: 60)
                        .offset(y: 20)
                }
                .overlay {
                    VStack {
                        
                        HStack {
                            ZStack {
                                Image("eitem1")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(0)
                                
                                Image("eopen1")
                                    .resizableToFit()
                                    .frame(width: 100)
                            }
                            
                            ZStack {
                                Image("eitem2")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(0)
                                
                                Image("eopen2")
                                    .resizableToFit()
                                    .frame(width: 140)
                                
                            }
                            
                            ZStack {
                                Image("eitem3")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(0)
                                
                                Image("eopen3")
                                    .resizableToFit()
                                    .frame(width: 90)
                            }
                        }
                        
                        HStack {
                            ZStack {
                                Image("eitem4")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(0)
                                
                                Image("eopen4")
                                    .resizableToFit()
                                    .frame(width: 100)
                            }
                            
                            ZStack {
                                Image("eitem5")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(0)
                                
                                Image("eopen5")
                                    .resizableToFit()
                                    .frame(width: 110)
                                
                            }
                            
                            ZStack {
                                Image("eitem6")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(0)
                                
                                Image("eopen6")
                                    .resizableToFit()
                                    .frame(width: 130)
                            }
                        }
                        
                        HStack(spacing: 40) {
                            ZStack {
                                Image("eitem7")
                                    .resizableToFit()
                                    .frame(width: 120)
                                    .opacity(0)
                                
                                Image("eopen7")
                                    .resizableToFit()
                                    .frame(width: 120)
                            }
                            
                            ZStack {
                                Image("eitem8")
                                    .resizableToFit()
                                    .frame(width: 120)
                                    .opacity(0)
                                
                                Image("eopen8")
                                    .resizableToFit()
                                    .frame(width: 120)
                            }
                        }
                        .offset(y: -24)
                    }
                    .offset(y: 34)
                     
                }
        }
    }
}

#Preview {
    EarthQuest()
        .environmentObject(GameLogic())
}
