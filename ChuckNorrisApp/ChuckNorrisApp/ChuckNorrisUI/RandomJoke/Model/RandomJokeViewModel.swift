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
	var refreshEnd: Callback = {
		fatalError("Method: refreshEnd. Must be overrided")
	}

	var norrisJoke: ChuckNorrisJoke?

	var selectedCategory: String = "Dev"
	var isLoading = true

	init(updateMethod: @escaping Callback, refreshEnd: @escaping Callback) {
		self.updateView = updateMethod
		self.refreshEnd = refreshEnd
	}

	func fetchData() {
		HTTPManager<ChuckNorrisJoke>.send(url: URLBuilder.getRandomJoke(for: selectedCategory), success: { [ weak self ] joke in
			guard let _self = self else { return }
			_self.norrisJoke = joke
			_self.isLoading = false
			_self.updateView()
			_self.refreshEnd()
		})
	}
}
