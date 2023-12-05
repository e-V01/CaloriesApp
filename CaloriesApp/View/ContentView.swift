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
                    Text("Hi Yurii")
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
                                            viewModel.addValue(fat: CGFloat(item.fat),
                                                               protein: CGFloat(item.protein),
                                                               cards: CGFloat(item.cards))
                                            viewModel.addMealToggle(meal: item)
                                            viewModel.addCalories(calories: CGFloat(item.cards))
                                            
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
                        .frame(height: 180)
                    }
                    .offset(y: -30)
                } else if itemSelected == .Lunch{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(viewModel.saveLunchEntity) { item in
                                FoodCart(width: 200, cards: CGFloat(item.cards), protein: CGFloat(item.cards), fat: CGFloat(item.cards), name: item.name ?? "", title: item.ingridients ?? "", icon: item.icon ?? "")
                                    .padding(.leading)
                                    
                            }
                            
                        }
                        .frame(height: 180)
                    }
                    .offset(y: -30)
                }
                WaterView()
                    .offset(y: -60)
                Spacer()
                    .overlay(alignment: .bottomLeading) {
                        Button {
                            show.toggle()
                        } label: {
                            Text("New Person")
                                .bold()
                                .foregroundStyle(.black)
                                .frame(width: 150, height: 50)
                                .background(.white)
                                .clipShape(Capsule())
                                .modifier(CustomShadow())
                        }
                        .padding()
                    }
                    .sheet(isPresented: $show, content: {
                        AddView()
                    })
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(CDDataModel())
}
