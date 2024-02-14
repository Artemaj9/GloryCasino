//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
    @State var size: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            .background {
                GeometryReader { geo in
                    Color.clear.onAppear {
                        size = geo.size
                        print("width: \(size.width)")
                        print("height: \(size.height)")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
