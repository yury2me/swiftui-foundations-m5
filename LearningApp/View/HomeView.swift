//
//  HomeView.swift
//  LearningApp
//
//  Created by Iúri Sanchez Fidalgo Amaral Tomé on 09/02/2022.
//

import SwiftUI

struct HomeView: View {
	@EnvironmentObject var model: ContentModel
	
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
