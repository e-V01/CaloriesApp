//
//  AddView.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var viewModel: CDDataModel
    @State private var itemSelected: Tab = .Breakfast
    @State private var showIcons: Bool = false
    @State private var icon: String = "circledPlus"
    @State private var name: String = ""
    @State private var title: String = ""
    @State private var fat: String = "0"
    @State private var protein: String = "0"
    @State private var cards: String = "0"
    @State private var fatTF: Bool = false
    @State private var proteinTF: Bool = false
    @State private var cardsTF: Bool = false

    var body: some View {
        VStack {
            TabView(itemSelected: $itemSelected)
            VStack(spacing: 25) {
                Image(icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .opacity(0.4)
                    .clipShape(Circle())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        withAnimation {
                            showIcons.toggle()
                        }
                    }
                if showIcons {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                        ForEach(icons) { item in
                                Image(item.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .onTapGesture {
                                        icon = item.image
                                        withAnimation {
                                            showIcons.toggle()
                                        }
                                    }
                            }
                        }
                    }
                }
                VStack {
                    TextField("name", text: $name)
                    Divider()
                    TextField("name", text: $title)

                }
                .font(.title3)
                .padding()
                .background(.white)
                .cornerRadius(20)
                .modifier(CustomShadow())
                
                VStack {
                    Values(number: $fat, show: $fatTF, name: "Fat")
                    Values(number: $protein, show: $proteinTF, name: "Protein")
                    Values(number: $cards, show: $cardsTF, name: "Carbs")

                }
                .padding()
                .background(.white)
                .cornerRadius(20)
                .modifier(CustomShadow())
                Button {
                    
                } label: {
                    Text("Save")
                        .bold()
                        .font(.title2)
                        .foregroundStyle(.black)
                        .frame(width: 180, height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        .modifier(CustomShadow())

                }
            }
        }
        .padding()

        Spacer()
    }
}

#Preview {
    AddView()
        .environmentObject(CDDataModel())
}
