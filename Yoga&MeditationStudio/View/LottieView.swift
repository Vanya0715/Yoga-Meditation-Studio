//
//  LottieView.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 07/06/22.
//

import Lottie
import SwiftUI
import UIKit

struct LottieView: UIViewRepresentable {
     
    typealias UIViewType = UIView
        var fileName: String
        var isPlaying: Bool
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame:.zero)
        let animationView = AnimationView()
        animationView.animation = Animation.named(fileName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        if (isPlaying == true) {
            animationView.play()
        }
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        //do nothing
    }
}
