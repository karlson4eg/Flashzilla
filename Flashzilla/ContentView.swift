//
//  ContentView.swift
//  Flashzilla
//
//  Created by Evi St on 4/30/22.
//

import SwiftUI

func withOptionalAmination<Result>(_ animation: Animation? = .default, body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct ContentView: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0
    var body: some View {
        Text("Hello accessibility")
            .scaleEffect(scale)
            .onTapGesture {
                withOptionalAmination {
                    scale *= 1.5
                }
            }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
