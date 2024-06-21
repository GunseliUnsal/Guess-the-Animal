//
//  ContentView.swift
//  GuessTheAnimal
//
//  Created by Günseli Ünsal on 20.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("brandPrimary").ignoresSafeArea()
                VStack {
                    VStack{
                        Text("Guess the Animal!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(Color("brandSecondary"))
                        Text("Discover the Animal Kingdom🎋")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                    }.padding(.bottom, 80)
                    Image("livestock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300,height: 300)
                        .padding(.bottom, 80)
                    NavigationLink{
                        QuizPage()
                    } label: {
                        Text("LET'S GO!")
                            .frame(width: 280, height: 50)
                            .background(Color("brandSecondary"))
                            .foregroundStyle(Color(.white))
                            .font(.system(
                                size: 20, weight: .bold, design: .default))
                            .clipShape(.buttonBorder)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
