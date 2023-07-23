//
//  CardView.swift
//  Hike
//
//  Created by Amin on 21/06/2023.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors:
                            [.init("ColorIndigoMedium"),
                             .init("ColorSalmonLight")],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                    
                )
                .frame(width: 256, height: 256)
            Image("image-1")
                .resizable()
                .scaledToFit()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
