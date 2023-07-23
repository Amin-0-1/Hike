//
//  CardView.swift
//  Hike
//
//  Created by Amin on 21/06/2023.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    @State private var imageNumber:Int = 1
    @State private var randomNumber:Int = 1
    @State private var isShowingSheet:Bool = false
    
    // MARK: - FUNCTIONS
    private func randomImage(){
        repeat{
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("HIKING")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors:
                                        [.customGrayLight,.customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom)
                        )
                        Spacer()
                        // MARK: - HEADER BUTTON
                        Button {
                            // Action : show a sheet
                            print("the button was pressed")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDetents([.medium,.large])
                                .presentationDragIndicator(.visible)
                        }

                    }
                    
                    Text("Fund and enjoyable outdoor activities for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.top, 20)
                .padding(.horizontal, 30)
                
                // MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    Image("image-\(randomNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut, value: imageNumber)
                }
                
                // MARK: - FOOTER
                Button(){
                    // ACtION : Genrate a random number
                    randomImage()
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium
                                ],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        .shadow(color: .black, radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton(colors: [.customGrayLight,.customGrayMedium]))
            }
        }
        .padding(.vertical, 80)
        .padding(.horizontal, 20)
//        .frame(width: 356, height: 560)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
