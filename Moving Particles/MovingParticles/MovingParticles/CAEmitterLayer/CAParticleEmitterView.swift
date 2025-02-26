//
//  CAParticleEmitterView.swift
//  MovingParticles
//
//  Created by Mohitnnd on 2/23/25.
//
import SwiftUI
import UIKit

struct CAWandEmitterRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> CAWandEmitterView {
        CAWandEmitterView()
    }
    func updateUIView(_ uiView: CAWandEmitterView, context: Context) {}
}


class CAWandEmitterView: UIView {
    private let wandImageView = UIImageView(image: UIImage(named: "wand"))
    let emitterLayer = CAEmitterLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupWand()
        setupEmitter()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupWand()
        setupEmitter()
    }
    
    private func setupWand() {
        // 1. Configure the wand image
        wandImageView.contentMode = .scaleAspectFit
        addSubview(wandImageView)
    }
    
    private func setupEmitter() {
        emitterLayer.emitterShape = .point
        emitterLayer.emitterMode = .outline
        emitterLayer.renderMode = .additive
        // Configure emitterCells here...
        let cell = CAEmitterCell()
        cell.contents = coloredImage(named: "circle.fill", color: .systemYellow.withAlphaComponent(0.6))?.cgImage // Use a circle shape
        cell.birthRate = 15 // Number of particles per second
        cell.lifetime = 2 // How long particles live
        cell.velocity = 15 // Particle speed
        cell.scale = 0.02 // Particle size
        cell.alphaSpeed = -0.1 // Fades out over time
        cell.emissionLongitude = (5 * .pi) / 4 // center of emission range
        cell.emissionRange = (.pi / 4 )
        
        let cell1 = CAEmitterCell()
        cell1.contents = coloredImage(named: "circle.fill", color: .white)?.cgImage // Use a circle shape
        cell1.birthRate = 15 // Number of particles per second
        cell1.lifetime = 2 // How long particles live
        cell1.velocity = 15 // Particle speed
        cell1.scale = 0.02 // Particle size
        cell1.alphaSpeed = -0.1 // Fades out over time
        cell1.emissionLongitude = (5 * .pi) / 4 // center of emission range
        cell1.emissionRange = (.pi / 2 )
        
        emitterLayer.emitterCells = [cell, cell1]
        layer.addSublayer(emitterLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        wandImageView.frame = bounds
        
        let tipX = wandImageView.bounds.maxX * 0.05   // 5% from left
        let tipY = wandImageView.bounds.minY   // 0% from top
        
        print("bounds - \(wandImageView.bounds)")
        print("tipX - \(tipX), tipY - \(tipY)")
        
        let tipPointInWandView = wandImageView.convert(CGPoint(x: tipX, y: tipY), to: self)
        
        print("tipPointInWandView - \(tipPointInWandView)")
        
        emitterLayer.frame = bounds
        emitterLayer.emitterPosition = tipPointInWandView
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


