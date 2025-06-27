//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Samuel Rischebourg on 27/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = true
    @State private var isPlayingWinner = true

    private let elements = ["👊", "🖐️", "✌️"]

    var botChoice: String {
        elements.randomElement() ?? "👊"
    }
    @State private var userChoice = ""
    @State private var botPoint = 0
    @State private var userPoint = 0

    var body: some View {
        ZStack {
            Color(red: 0.50, green: 0.77, blue: 0.96)
                .ignoresSafeArea()

            VStack(spacing: 50) {
                HStack(alignment: .top) {
                    Text("You: \(userPoint)")
                    Spacer()
                    Text("Game: \(botPoint)")
                }
                .padding()
                Spacer()

                VStack(spacing: 10) {
                    Text("Bot Choice")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(botChoice)
                        .font(.system(size: 100))
                }

                VStack(spacing: 10) {
                    Text("Rock, Papper or Scissors")
                    HStack {
                        ForEach(elements, id: \.self) { element in
                            Button(element) {
                                userChoice = element
                            }
                            .font(.largeTitle)
                        }
                    }
                }
                Spacer()
                Spacer()
            }
        }
        .alert("What do you want ?", isPresented: $showingAlert) {
            Button("Win") {
                isPlayingWinner = true
            }
            Button("Loose") {
                isPlayingWinner = false
            }
        }
    }
}

#Preview {
    ContentView()
}
