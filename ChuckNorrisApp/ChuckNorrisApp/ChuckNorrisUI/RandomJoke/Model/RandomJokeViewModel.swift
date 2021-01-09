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
		print(selectedCategory)
		do {
			let json = """
			{"categories":["science"],"created_at":"2020-01-05 13:42:19.324003","icon_url":"https://assets.chucknorris.host/img/avatar/chuck-norris.png","id":"jtibnb-mtuyluzqrwtodzw","updated_at":"2020-01-05 13:42:19.324003","url":"https://api.chucknorris.io/jokes/jtibnb-mtuyluzqrwtodzw","value":"Chuck Norris can divide by zero."}
			""".data(using: .utf8)! // our data in native format
			norrisJoke = try JSONDecoder().decode(ChuckNorrisJoke.self, from: json) // do your decoding here
			print(norrisJoke)
		} catch {
			print(error) // any decoding error will be printed here!
		}
	}
}
