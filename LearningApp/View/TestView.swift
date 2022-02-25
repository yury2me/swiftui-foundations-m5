//
//  TestView.swift
//  LearningApp
//
//  Created by Iúri Sanchez Fidalgo Amaral Tomé on 24/02/2022.
//

import SwiftUI

struct TestView: View {
	@EnvironmentObject var model: ContentModel
	@State var selectedAnswerIndex: Int?
	@State var numCorrect = 0
	@State var submitted = false
	
    var body: some View {
		if model.currentQuestion != nil {
			VStack(alignment: .leading) {
				// Question number
				Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
					.padding(.leading, 20)
				
				// Question
				CodeTextView()
					.padding(.leading, 20)
				
				// Answers
				ScrollView {
					VStack(spacing: 10) {
						ForEach(0..<model.currentQuestion!.answers.count, id: \.self) { index in
							Button {
								// Track the selected index
								selectedAnswerIndex = index
							} label: {
								ZStack {
									if submitted == false { // Answer not submitted yet
										RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
											.frame(height: 48)
									} else { // Answer has been submited
										if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex { // User has selected the right answer
											// Show a green background
											RectangleCard(color: .green)
												.frame(height: 48)
										} else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex { // User has selected a wrong answer
											// Show a red background
											RectangleCard(color: .red)
												.frame(height: 48)
										} else if index == model.currentQuestion!.correctIndex { // User has selected a wrong answer
											// This button is the correct answer
											// Show a green background
											RectangleCard(color: .green)
												.frame(height: 48)
										} else { // Other answers
											RectangleCard(color: .white)
											 .frame(height: 48)
										}
									}
									
									Text(model.currentQuestion!.answers[index])
								}
							}
							.disabled(submitted)
						}
					}
					.tint(.black)
					.padding()
				}
				
				// Submit Button
				Button {
					// Check if answer has been submitted
					if submitted == true {
						// Answer has already been submited, move to next question
						model.nextQuestion()
						
						// Reset properties
						submitted = false
						selectedAnswerIndex = nil
					} else {
						// Submit the answer
						
						// Change submitted button to true
						submitted = true
						
						// Check the answer and increment the counter if correct
						if selectedAnswerIndex == model.currentQuestion!.correctIndex {
							numCorrect += 1
						}
					}
				} label: {
					ZStack {
						RectangleCard(color: .green)
							.frame(height: 48)
						
						Text(buttonText)
							.bold()
							.foregroundColor(.white)
					}
					.padding()
				}
				.disabled(selectedAnswerIndex == nil)
			}
			.navigationTitle("\(model.currentModule?.category ?? "") Test")
		} else {
			// Test hasn't loaded yet
			ProgressView()
		}
    }
	
	var buttonText: String {
		// Check if answer has been submitted
		if submitted == true {
			if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
				// This is the last question
				return "Finish"
			} else {
				// There is a next question
				return "Next"
			}
		} else {
			return "Submit"
		}
	}
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
