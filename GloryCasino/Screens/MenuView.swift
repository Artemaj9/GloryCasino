//
//  MenuView.swift
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject var vm: GameLogic
    @State var size: CGSize = .zero
    
    var body: some View {
        NavigationView {
            ZStack {
//                if vm.element == 1 {
//                    Image("menubg1")
//                        .resizable()
//                        .scaledToFill()
//                        .transition(.blur)
//                }
//                
//                if vm.element == 2 {
//                    Image("menubg2")
//                        .resizable()
//                        .scaledToFill()
//                        .transition(.blur)
//                }
//                    
//                if vm.element == 3 {
//                    Image("menubg3")
//                        .resizable()
//                        .scaledToFill()
//                        .transition(.blur)
//                }
//                
//                if vm.element == 4 {
//                    Image("menubg4")
//                        .resizable()
//                        .scaledToFill()
//                        .transition(.blur)
//                }
                Image("menubg\(vm.element)")
                    .resizable()
                    .scaledToFill()
                    .overlay {
                        GeometryReader { geo in
                            Color.clear
                                .onAppear {
                                    size = geo.size
                                    print("\(size.width)")
                                    print("\(size.height)")
                                }
                        }
                    }
//                
                VStack(spacing: 0) {
                    HStack {
                        NavigationLink {
                            InfoView()
                        } label: {
                            Image("infobtn")
                                .resizableToFit()
                                .frame(height: 45)
                        }

                        Image("balancebar")
                            .resizableToFit()
                            .frame(height: 60)
                            .overlay {
                                Text("\(vm.balance)")
                                    .foregroundStyle(.white)
                                    .font(.custom(.black, size: 24))
                            }
                        
                        NavigationLink {
                            ChestView()
                                .environmentObject(vm)
                        } label: {
                            Image("cup")
                                .resizableToFit()
                                .frame(height: 45)
                        }
                     
                    }
                    
                    Image("logo\(vm.element)")
                        .resizableToFit()
                        .frame(width: vm.size.width * 0.4)
                    
                    HStack {
                        Spacer()
                        Image("winchance\(vm.element)")
                            .resizableToFit()
                            .frame(height: 70)
                    }
                    
                    HStack {
                        Spacer()
                        Image("label\(vm.element)")
                            .resizableToFit()
                            .frame(height: 40)
                    }
                    HStack {
                        Spacer()
                        Image("text\(vm.element)")
                            .resizableToFit()
                            .frame(height: 15)
                    }
                    NavigationLink {
                        WelcomeView()
                            .environmentObject(vm)
                    } label: {
                        Image("greenbtnbg")
                            .resizableToFit()
                            .frame(height: 55)
                            .overlay {
                                Text("PLAY")
                                    .foregroundStyle(.white)
                                    .font(.custom(.black, size: 32))
                                    .offset(y: -6)
                                    .shadow(color: Color("txtgreenshadow"), radius: 1, y: 2)
                                    .shadow(color: .black.opacity(0.25), radius: 1)
                            }
                    }
                    
                    Button {
                        withAnimation(.easeInOut(duration: 1)) {
                            vm.element = 1
                        }
                   
                    } label: {
                        ZStack {
                            Image("dbtn1")
                                .resizableToFit()
                                .padding(.horizontal, 24)
                                .opacity(vm.element == 1 ? 0 : 1)
                            Image("abtn1")
                                .resizableToFit()
                                .padding(.horizontal, 24)
                                .opacity(vm.element == 1 ? 1 : 0)
                        }
                    }

                    Button {
                        withAnimation(.easeInOut(duration: 1)) {
                            vm.element = 2
                        }
                  
                    } label: {
                        ZStack {
                            Image("dbtn2")
                                .resizableToFit()
                                .padding(.horizontal, 24)
                                .opacity(vm.element == 2 ? 0 : 1)
                            Image("abtn2")
                                .resizableToFit()
                                .padding(.horizontal, 24)
                                .opacity(vm.element == 2 ? 1 : 0)
                        }
                    }
                 
                    Button {
                        withAnimation(.easeInOut(duration: 2)) {
                            vm.element = 3
                        }
                    } label: {
                        ZStack {
                            Image("dbtn3")
                                .resizableToFit()
                                .padding(.horizontal, 24)
                                .opacity(vm.element == 3 ? 0 : 1)
                            Image("abtn3")
                                .resizableToFit()
                                .padding(.horizontal, 24)
                                .opacity(vm.element == 3 ? 1 : 0)
                        }
                    }
               
                    Button {
                        withAnimation(.easeInOut(duration: 1)) {
                            vm.element = 4
                        }
                    } label: {
                        ZStack {
                            Image("dbtn4")
                                .resizableToFit()
                                .padding(.horizontal, 24)
                            
                            Image("abtn4")
                                .resizableToFit()
                                .padding(.horizontal, 24)
                                .opacity(vm.element == 4 ? 1 : 0)
                        }
                    }
                }
                .padding(.bottom, 24)
            }
            .ignoresSafeArea()
            .onAppear {
                vm.nowDate = Date()
                vm.getBonus()
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    MenuView()
        .environmentObject(GameLogic())
}
