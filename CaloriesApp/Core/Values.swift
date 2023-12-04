//
//  Values.swift
//  CaloriesApp
//
//  Created by Y K on 04.12.2023.
//

import SwiftUI

struct Values: View {
    @Binding var number: String
    @Binding var show: Bool
    var name = ""
    var body: some View {
        HStack {
            Text(name).bold()
            Spacer()
            Text("\(number)")
                .bold()
                .frame(width: 45, height: 30)
                .background(.black)
                .cornerRadius(5)
                .foregroundStyle(.white)
                .onTapGesture {
                    withAnimation {
                        show.toggle()
                    }
                }
            if show {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        ForEach(1 ..< 100) { item in
                            Text("\(item)")
                                .bold()
                                .frame(width: 30, height: 30)
                                .background(.black.opacity(0.2))
                                .cornerRadius(5)
                                .onTapGesture {
                                    withAnimation {
                                        show.toggle()
                                        number = "\(item)"
                                    }
                                }
                        }
                    }
                }
                .frame(width: 180, height: 30)
            }
        }
        .padding(5)
    }
}


