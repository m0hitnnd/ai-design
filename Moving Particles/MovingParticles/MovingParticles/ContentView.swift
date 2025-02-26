//
//  ContentView.swift
//  MovingParticles
//
//  Created by Mohitnnd on 2/23/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            CAWand()
        }
    }
}

#Preview {
    ContentView()
}

