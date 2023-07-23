//
//  SettingsView.swift
//  Hike
//
//  Created by Amin on 24/06/2023.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    private let alternateAppIcon : [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    var body: some View {
        List {
            // MARK: - SECTION HEADER
            
            Section {
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80,weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66,weight: .black))
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGreenLight,.customGreenMedium,.customGreenDark],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("The hike wich looks gogrgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } // Section
            .listRowSeparator(.hidden)
            
            
            // MARK: - SECTION ICON
            Section(header: Text("Alternate Icons")){
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcon.indices, id:\.self) { item in
                            Button {
                                print("Icon \(alternateAppIcon[item]) was pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppIcon[item]){ error in
                                    if error != nil{
                                        print("unable to set \(alternateAppIcon[item]) as an app icon")
                                    }else{
                                        print("Successfully changed app icon")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcon[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(16)
                                    .frame(width: 80,height: 80)
                                
                            }
                        }
                    }
//                    .buttonStyle(.borderless)
                }
                .padding(.top,12)
                
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom,12)
            }//SECTION
            .listRowSeparator(.hidden)
            // MARK: - SECTION ABOUT
            Section {
                // 1. BASIC LABELED CONTENT
//                LabeledContent("Application", value: "Hike")
                // 2. ADVANCED LABELED CONTENT
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Compitability", rowIcon: "info.circle", rowContent: "IOS, iPadOS", rowTintColor: .red)
                CustomListRowView(rowLabel: "Technonlogy", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Amin", rowTintColor: .mint)
                CustomListRowView(rowLabel: "Disgner", rowIcon: "paintpalette", rowContent: "Robert Patras", rowTintColor: .pink)
                CustomListRowView(rowLabel: "website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Credo Academy", rowLinkDestination: "https://credo.academy")

            } header: {
                Text("ABOUT THE APP")
            } footer: {
                HStack {
                    Spacer()
                    Text("Copywrite © All Right Reserved.")
                    Spacer()
                }.padding(.vertical, 8)
            }

        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
