//
//  CAWand.swift
//  MovingParticles
//
//  Created by Mohitnnd on 2/26/25.
//
import SwiftUI

struct CAWand: View {
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero
    
    var body: some View {
        CAWandEmitterRepresentable()
            .frame(width: 30, height: 30)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        offset = CGSize(
                            width: lastOffset.width + value.translation.width,
                            height: lastOffset.height + value.translation.height
                        )
                    }
                    .onEnded { _ in
                        lastOffset = offset
                    }
            )
    }
}
