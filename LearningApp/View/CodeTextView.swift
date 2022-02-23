//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Iúri Sanchez Fidalgo Amaral Tomé on 22/02/2022.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
	@EnvironmentObject var model: ContentModel
	
	func makeUIView(context: Context) -> some UITextView {
		let textView = UITextView()
		textView.isEditable = false
		
		return textView
	}
	
	func updateUIView(_ textView: UIViewType, context: Context) {
		// Set the attributed text for the lesson
		textView.attributedText = model.lessonDescription
		
		// Scroll back to the top
		textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
	}
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
