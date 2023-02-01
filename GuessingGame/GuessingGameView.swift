

//
//  GuessingGameView.swift
//  GuessingGame
//
//  Created by Russell Gordon on 2021-11-30.
//
import SwiftUI

struct GuessingGameView: View {
    
    // MARK: Stored properties
    
    // The input collected from the Slider
    // ADD MISSING CODE HERE
    @State var guessAsString: String = ""
    // The secret target that the user is trying to guess
    @State var target = Int.random(in: 0...100)
    
    // What feedback to provide the user with
    @State var feedback = ""
    
    
    // MARK: Computed properties
    var guessAsInteger: Int? {
        guard let unwarppedValue = Int(guessAsString) else {
            return nil
        }
        return unwarppedValue
    }
    var body: some View {
        
        VStack {
            // Collect the user's input using a Slider
            // ADD MISSING CODE HERE
            
            TextField("Enter your guess", text: $guessAsString)
            
//                Slider(value: $data,
//                       in: 0...100,
//                       step: 1.0,
//                       label: { Text("data") },
//                       minimumValueLabel: { Text("0") },
//                       maximumValueLabel: { Text("100") } )
        
            // Show the user's input to them using a Text view
            // ADD MISSING CODE HERE
//            Text("\(data.formatted(.number.precision(.fractionLength(0))))")
            // Let the user check to see if their current guess is correct
            Button(action: {
                
                // Convert the user's input, which is a Double, into an Int
                guard let guess = guessAsInteger else {
                    feedback = "Please provide a integer between 0 and 100."
                    return
                }
                
                // Compare the user's guess to the target and give appropriate feedback
                // ADD MISSING CODE HERE
                if guess == target {
                    feedback = "correct"
                }else if guess < target{
                    feedback = "too small"
                }else{
                    feedback = "too large"
                }
                    
            }, label: {
                Text("Submit Guess")
            })
            .buttonStyle(.bordered)
            
            // Show the feedback to the user
            Text(feedback)
                .font(.title3)
                .italic()
                .multilineTextAlignment(.center)
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Guessing Game")
        
    }
}

struct GuessingGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GuessingGameView()
        }
    }
}

