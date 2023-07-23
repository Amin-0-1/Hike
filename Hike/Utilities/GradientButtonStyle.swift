//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Amin on 21/06/2023.
//
import SwiftUI

struct GradientButton:ButtonStyle{
    var colors:[Color] = []
    init(colors:[Color]){
        self.colors = colors
    }
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal,30)
            .background(
                // Conditional statement with Nil Coalascing
                // Condition ? A : B
                configuration.isPressed ?
                // A : When user press the button 
                LinearGradient(
                    colors: self.colors.reversed(),
                    startPoint: .top,
                    endPoint: .bottom)
                :
                // B : When the button is not pressed
                
                LinearGradient(
                    colors: self.colors,
                    startPoint: .top,
                    endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
