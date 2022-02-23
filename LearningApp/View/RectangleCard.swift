//
//  RectangleCard.swift
//  LearningApp
//
//  Created by Iúri Sanchez Fidalgo Amaral Tomé on 23/02/2022.
//

import SwiftUI

struct RectangleCard: View {
	var color = Color.white
	
    var body: some View {
		Rectangle()
			.foregroundColor(color)
			.cornerRadius(10)
			.shadow(radius: 10)
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
