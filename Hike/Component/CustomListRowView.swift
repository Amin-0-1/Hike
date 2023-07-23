//
//  CustomListRowView.swift
//  Hike
//
//  Created by Amin on 04/07/2023.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    @State var rowLabel:String
    @State var rowIcon:String
    @State var rowContent:String?
    @State var rowTintColor:Color
    @State var rowLinkLabel:String? = nil
    @State var rowLinkDestination:String? = nil
    
    var body: some View {
        LabeledContent {
            if let rowContent{
                Text(rowContent)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if let rowLinkLabel, let rowLinkDestination {
                Link(rowLinkLabel, destination: URL(string: rowLinkDestination)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy )
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List{
            CustomListRowView(
                rowLabel: "website",
                rowIcon: "globe",
                rowContent: nil,
                rowTintColor: .pink,
                rowLinkLabel: "Credo Academy",
                rowLinkDestination: "https://credo.academy")
        }
    }
}
