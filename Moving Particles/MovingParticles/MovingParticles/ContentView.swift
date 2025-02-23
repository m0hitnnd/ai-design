//
//  ContentView.swift
//  MovingParticles
//
//  Created by Mohitnnd on 2/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Background color
            ParticleEmitterView()
                .frame(width: 300, height: 300) // Adjust size
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview {
    ContentView()
}
