//
//  RandomJokeViewModel.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 09/01/21.
//

import Foundation

class RandomJokeViewModel {

	var updateView: Callback = {
		fatalError("Method: updateView. Must be overrided")
	}
	var norrisJoke: ChuckNorrisJoke? {
		didSet {
			self.updateView()
		}
	}
	var selectedCategory: String = "Dev"

	init(updateMethod: @escaping Callback) {
		self.updateView = updateMethod
	}

	func fetchData(){
		HTTPManager<ChuckNorrisJoke>.send(url: URLBuilder.getRandomJoke(for: selectedCategory), success: { [weak self ] joke in
			guard self != nil else { return }
			self?.norrisJoke = joke
		})
	}
}
