//
//  CategoriesViewModel.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 09/01/21.
//

import Foundation

class CategoriesViewModel {

	var updateView: () -> Void = {
		fatalError("Method: updateView. Must be overrided")
	}
	var categories: [ChuckNorrisCategory] = [] {
		didSet {
			self.updateView()
		}
	}

	init(updateMethod: @escaping () -> Void) {
		self.updateView = updateMethod
	}

	func fetchData(){
		do {
			let json = """
			["animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"]
			""".data(using: .utf8)! // our data in native format
			categories = try JSONDecoder().decode([ChuckNorrisCategory].self, from: json) // do your decoding here
			print(categories)
		} catch {
			print(error) // any decoding error will be printed here!
		}
	}
}
