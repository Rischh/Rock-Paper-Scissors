//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Samuel Rischebourg on 27/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showingWinnerRoleQuestion = true
    @State private var isPlayingWinner = true
    @State private var randomNumber = Int.random(in: 0..<3)
    @State private var round = 0
    @State private var userScore = 0
    @State private var opponentScore = 0
    @State private var showingScore = false

    let elements = ["👊", "🖐️", "✌️"]

    var body: some View {
        ZStack {
            Color(red: 0.50, green: 0.77, blue: 0.96)
                .ignoresSafeArea()

            VStack(spacing: 50) {
                HStack(alignment: .top) {
                    Text("You: \(userScore)")
                    Spacer()
                    Text("Game: \(opponentScore)")
                }
                .padding()
                Spacer()

                VStack(spacing: 10) {
                    Text("Bot Choice")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(elements[randomNumber])
                        .font(.system(size: 100))
                }

                VStack(spacing: 10) {
                    Text("Rock, Papper or Scissors")
                    HStack {
                        ForEach(elements, id: \.self) { element in
                            Button(element) {
                                addPoint(
                                    userChoice: element,
                                    elements[randomNumber],
                                    isPlayingWinner
                                )

                                round += 1

                                if round == 10 {
                                    showingScore = true
                                }

                                randomNumber = Int.random(in: 0..<3)
                                showingWinnerRoleQuestion = true
                            }
                            .font(.largeTitle)
                        }
                    }
                }
                Spacer()
                Spacer()
            }
        }
        .alert("You want to", isPresented: $showingWinnerRoleQuestion) {
            Button("Win") {
                isPlayingWinner = true
            }
            Button("Loose") {
                isPlayingWinner = false
            }
        }
        .alert("Your Score", isPresented: $showingScore) {
            Button("Ok") { resetGame() }
        } message: {
            Text("\(userScore)/10")
        }
    }

    func addPoint(userChoice: String, _ botChoice: String, _ isWinner: Bool) {
        if isWinner {
            if userChoice == "👊" {
                if botChoice == "🖐️" {
                    opponentScore += 1
                    return
                }
                if botChoice == "👊" { return }
                
                userScore += 1
                return
            }
            
            if userChoice == "🖐️" {
                if botChoice == "✌️" {
                    opponentScore += 1
                    return
                }
                if botChoice == "🖐️" { return }
                
                userScore += 1
                return
            }
            
            if userChoice == "✌️" {
                if botChoice == "👊" {
                    opponentScore += 1
                    return
                }
                if botChoice == "✌️" { return }
                
                userScore += 1
                return
            }
        }
        
        if !isWinner {
            if botChoice == "👊" {
                if userChoice == "🖐️" {
                    opponentScore += 1
                    return
                }
                if userChoice == "👊" { return }
                
                userScore += 1
                return
            }
            
            if botChoice == "🖐️" {
                if userChoice == "✌️" {
                    opponentScore += 1
                    return
                }
                if userChoice == "🖐️" { return }
                
                userScore += 1
                return
            }
            
            if botChoice == "✌️" {
                if userChoice == "👊" {
                    opponentScore += 1
                    return
                }
                if userChoice == "✌️" { return }
                
                userScore += 1
                return
            }
        }
    }

    func resetGame() {
        round = 0
        userScore = 0
        opponentScore = 0
        showingWinnerRoleQuestion = true
    }
}

#Preview {
    ContentView()
}
