//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Amin on 24/06/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    @State private var randomCircle:Int = Int.random(in: 6...12)
    @State private var isAnimate:Bool = false
    
    // MARK: - FUNCTIONS
    //1 Random coordinate
    private func randomCoordinate()->CGFloat{
        return CGFloat.random(in: 0...256)
    }
    //2 random size
    private func randomSize()->CGFloat{
        return CGFloat(Int.random(in: 4...80))
    }
    //3 random scale
    private func randomScale()->CGFloat{
        return CGFloat(Double.random(in: 0.1...2))
    }
    //4 random speed
    private func randomSpeed()->Double{
        return Double.random(in: 0.05...1.0)
    }
    //5 random delay
    private func randomDelay()->Double{
        return Double.random(in: 0...2)
    }
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { _ in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(.init(x: randomCoordinate(), y: randomCoordinate()))
                    .scaleEffect(isAnimate ? randomScale() : 1)
                    .onAppear{
                        withAnimation(.interpolatingSpring(stiffness: 0.25, damping: 0.25).repeatForever().speed(randomSpeed()).delay(randomDelay())) {
                            isAnimate = true
                        }
                    }
            }
            
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
            MotionAnimationView()
            .background{
                Circle().fill(.teal)
            }
    }
}
