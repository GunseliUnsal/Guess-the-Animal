import SwiftUI

struct QuizPage: View {
    @State private var animals = ["bear", "cow", "deer", "duck", "giraffe", "horse", "monkey", "panda", "rabbit", "zebra"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...3)
    @State private var selectedAnswer: Int? = nil
    
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color("brandSecondary"), location: 0.3),
                    .init(color: Color("brandPrimary"), location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 700).ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Text("Guess the Animal ⬇️")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Image(animals[correctAnswer])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 24)
                        .padding(.bottom, 40)
                    
                    VStack {
                        ForEach(0..<4) { number in
                            Button(action: {
                                animalTapped(number)
                            }) {
                                Text(animals[number].capitalized)
                                    .frame(width: 280, height: 60)
                                    .background(buttonColor(for: number))
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .bold, design: .default))
                                    .clipShape(Capsule())
                            }
                            .disabled(selectedAnswer != nil) // Disable buttons after an answer is selected
                        }
                    }
                    
                    Text("Your score is: \(score)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .padding(.top, 40)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func animalTapped(_ number: Int) {
        selectedAnswer = number
        
        if number == correctAnswer {
            score += 10
        }
        
        // 0.5 saniye sonra yeni soruya geç
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            askQuestion()
        }
    }
    
    func askQuestion() {
        animals.shuffle()
        correctAnswer = Int.random(in: 0...3)
        selectedAnswer = nil
    }
    
    func buttonColor(for number: Int) -> Color {
        guard let selectedAnswer = selectedAnswer else {
            return Color("brandSecondary")
        }
        
        if selectedAnswer == number {
            return selectedAnswer == correctAnswer ? .green : .red
        } else {
            return Color("brandSecondary")
        }
    }
}

#Preview {
    QuizPage()
}
