//
//  RandomJokeViewModel.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 09/01/21.
//

import Foundation

class RandomJokeViewModel {

	var updateView: () -> Void = {
		fatalError("Method: updateView. Must be overrided")
	}
	var norrisJoke: ChuckNorrisJoke? {
		didSet {
			self.updateView()
		}
	}
	var selectedCategory: String = "Dev"

	init(updateMethod: @escaping () -> Void) {
		self.updateView = updateMethod
	}

	func fetchData(){
		HTTPManager<ChuckNorrisJoke>.send(url: "https://api.chucknorris.io/jokes/random?category=\(selectedCategory)", success: { [weak self ] joke in
			guard self != nil else { return }
			self?.norrisJoke = joke
		})
	}
}
