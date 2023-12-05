//
//  ContentView.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: CDDataModel
    @State var show = false
    @State private var itemSelected: Tab = .Breakfast
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Yurii")
                        .bold()
                        .font(.system(size: 35))
                    Spacer()
                    Image("burger")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .shadow(color: .blue, radius: 20, x: 0, y: 0)
                        .clipShape(Circle())
                }
                .padding()
                RingView()
                Divider()
                TabView(itemSelected: $itemSelected)
                if itemSelected == .Breakfast {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(viewModel.saveBreakfastEntity) { item in
                                FoodCart(width: 200, cards: CGFloat(item.cards), protein: CGFloat(item.cards), fat: CGFloat(item.cards), name: item.name ?? "", title: item.ingridients ?? "", icon: item.icon ?? "")
                                    .padding()
                                    .overlay(alignment: .topTrailing) {
                                        Button {
                                            
                                        } label: {
                                            ZStack {
                                                Circle()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundStyle(.white)
                                                Image(systemName: item.addperson ? "checkmark" : "plus")
                                                    .imageScale(.small)
                                                    .foregroundStyle(.black)
                                            }
                                            .modifier(CustomShadow())
                                        }
                                        .offset(x: -5, y: 5)
                                    }
                            }
                            
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(CDDataModel())
}
