//
//  CAParticleEmitterView.swift
//  MovingParticles
//
//  Created by Mohitnnd on 2/23/25.
//
import SwiftUI
import UIKit

struct ParticleEmitterView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        addParticleEmitter(to: view)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}

    private func addParticleEmitter(to view: UIView) {
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: view.bounds.midX, y: view.bounds.midY) // Center position
        emitter.emitterShape = .sphere // Emit in a sphere-like shape
        emitter.emitterSize = CGSize(width: 150, height: 150) // Adjust size of emission area

        let cell = CAEmitterCell()
        cell.contents = coloredImage(named: "circle.fill", color: .white)?.cgImage // Use a circle shape
        cell.birthRate = 100 // Number of particles per second
        cell.lifetime = 5.0 // How long particles live
        cell.velocity = 40 // Particle speed
        cell.scale = 0.02 // Particle size
        cell.alphaSpeed = -0.1 // Fades out over time
        cell.color = UIColor.white.cgColor
        cell.emissionRange = .pi * 2 // Emit in all directions

        emitter.emitterCells = [cell]
        view.layer.addSublayer(emitter)
    }
    
    func coloredImage(named: String, color: UIColor) -> UIImage? {
        guard let image = UIImage(systemName: named) else { return nil }
        
        let rect = CGRect(origin: .zero, size: image.size)
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        color.setFill()
        UIRectFill(rect)
        
        image.draw(in: rect, blendMode: .destinationIn, alpha: 1.0)
        let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return coloredImage
    }

}
