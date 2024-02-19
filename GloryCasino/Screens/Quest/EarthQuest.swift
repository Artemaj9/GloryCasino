//
//  EarthQuest.swift
//

import SwiftUI

struct EarthQuest: View {
    @EnvironmentObject var vm: GameLogic
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Image("questbg1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Image("questtable1")
                .resizableToFit()
                .overlay(alignment: .bottom) {
                    Image("questlabelbg1")
                        .resizableToFit()
                        .frame(height: 60)
                        .overlay {
                            Group {
                                Text("\(vm.allItems[vm.element-1].filter{$0}.count)")
                                    .foregroundColor(.white)
                                    .font(.custom(.black, size: 41))
                                +
                                Text("/8")
                                    .font(.custom(.black, size: 27))
                                    .foregroundColor(.white)
                            }
                            .shadow(color: .black.opacity(0.25), radius: 2, y: 2)
                            .offset(y: -4)
                        }
                        .offset(y: 20)
                        
                }
                .overlay {
                    VStack {
                        
                        HStack {
                            ZStack {
                                Image("eitem1")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(vm.allItems[0][0] ? 0 : 1)
                                
                                Image("eopen1")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(vm.allItems[0][0] ? 1 : 0)
                            }
                            
                            ZStack {
                                Image("eitem2")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(vm.allItems[0][1] ? 0 : 1)
                                
                                Image("eopen2")
                                    .resizableToFit()
                                    .frame(width: 140)
                                    .opacity(vm.allItems[0][1] ? 1 : 0)
                                
                            }
                            
                            ZStack {
                                Image("eitem3")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(vm.allItems[0][2] ? 0 : 1)
                                
                                Image("eopen3")
                                    .resizableToFit()
                                    .frame(width: 90)
                                    .opacity(vm.allItems[0][2] ? 1 : 0)
                            }
                        }
                        
                        HStack {
                            ZStack {
                                Image("eitem4")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(vm.allItems[0][3] ? 0 : 1)
                                
                                Image("eopen4")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(vm.allItems[0][3] ? 1 : 0)
                            }
                            
                            ZStack {
                                Image("eitem5")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(vm.allItems[0][4] ? 0 : 1)
                                
                                Image("eopen5")
                                    .resizableToFit()
                                    .frame(width: 110)
                                    .opacity(vm.allItems[0][4] ? 1 : 0)
                                
                            }
                            
                            ZStack {
                                Image("eitem6")
                                    .resizableToFit()
                                    .frame(width: 100)
                                    .opacity(vm.allItems[0][5] ? 0 : 1)
                                
                                Image("eopen6")
                                    .resizableToFit()
                                    .frame(width: 130)
                                    .opacity(vm.allItems[0][5] ? 1 : 0)
                            }
                        }
                        
                        HStack(spacing: 40) {
                            ZStack {
                                Image("eitem7")
                                    .resizableToFit()
                                    .frame(width: 120)
                                    .opacity(vm.allItems[0][6] ? 0 : 1)
                                
                                Image("eopen7")
                                    .resizableToFit()
                                    .frame(width: 120)
                                    .opacity(vm.allItems[0][6] ? 1 : 0)
                            }
                            
                            ZStack {
                                Image("eitem8")
                                    .resizableToFit()
                                    .frame(width: 120)
                                    .opacity(vm.allItems[0][7] ? 0 : 1)
                                
                                Image("eopen8")
                                    .resizableToFit()
                                    .frame(width: 120)
                                    .opacity(vm.allItems[0][7] ? 1 : 0)
                            }
                        }
                        .offset(y: -24)
                    }
                    .offset(y: 34)
                }
                .offset(y: -vm.size.height * 0.06)
            Button {
                if vm.allItems[vm.element-1].filter{$0}.count == 8 {
                    vm.showkey[0] = true
                }
                dismiss()
            } label: {
                Image("backbtn")
                    .resizableToFit()
                    .frame(width: vm.size.width * 0.4)
            }
            .offset(y: vm.size.height*0.43)
        }
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
}

#Preview {
    EarthQuest()
        .environmentObject(GameLogic())
}
