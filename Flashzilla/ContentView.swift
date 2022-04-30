//
//  ContentView.swift
//  Flashzilla
//
//  Created by Evi St on 4/30/22.
//

import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged{ value in
                offset = value.translation
            }
            .onEnded{ _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.2 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
