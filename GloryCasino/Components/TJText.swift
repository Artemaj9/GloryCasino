//
//  TJText.swift
//

import SwiftUI

struct TJText: View {
    let number: Int
    let jackpot: Int
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("airyellow"))
       
            
            if number == 1 {
                LinearGradient(colors: [Color("airorange"), Color("airorange").opacity(0)], startPoint: .bottom, endPoint: .top)
                    .opacity(0.3)
                    .rotationEffect(Angle(degrees: 180))
            }
            
            if number == 2 {
                LinearGradient(colors: [Color("fireyellow"), Color("airorange").opacity(0)], startPoint: .bottom, endPoint: .top)
            }
            
            if number == 3 || number == 4 {
                LinearGradient(colors: [Color("orangebg"), Color("orangebgtop").opacity(0)], startPoint: .bottom, endPoint: .top)
            }
            
        }
        .frame(height: 50)
        .mask {
            
            if number == 3 || number == 4 {
                Text("999999999")
                    .font(.custom(.kotto, size: 49))
            }
            
            if number == 2 || number == 1 {
                Text("999999")
                    .font(.custom(.semiBold, size: 45))
            }
        }
    }
}

#Preview {
    TJText(number: 4, jackpot: 99995)
}
