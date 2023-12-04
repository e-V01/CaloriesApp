//
//  WaterView.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import SwiftUI

struct WaterView: View {
    @State private var checkMark = true
    var body: some View {
        VStack {
            HStack {
                
                Text("6 of 6")
                    .bold()
                    .font(.title3)
                    .offset(y: -10)
                Spacer()
                Image("cup")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 45)
            }
            .padding(.horizontal)
            HStack {
                ForEach(0 ..< 6) { item in
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.blue.opacity(checkMark ? 0.1 : 0.03))
                        HStack {
                            Image("water")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .onTapGesture {
                                    checkMark.toggle()
                                }
                        }
                    }
                    .overlay(alignment: .topTrailing) {
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 15, height: 15)
                        Image(systemName: checkMark ? "checkmark" : "")
                            .bold()
                            .font(.system(size: 12))
                            .foregroundStyle(.green)
                            
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 130)
        .background(.white)
        .cornerRadius(10)
        .padding(.horizontal)
        .modifier(CustomShadow())
    }
}

#Preview {
    WaterView()
}
