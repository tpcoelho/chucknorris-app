//
//  CategoriesViewModel.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 09/01/21.
//

import Foundation

class CategoriesViewModel {

	var updateView: Callback = {
		fatalError("Method: updateView. Must be overrided")
	}
	var categories: [ChuckNorrisCategory] = [] {
		didSet {
			updateView()
		}
	}
	var isLoading: Bool = true

	init(updateMethod: @escaping Callback) {
		updateView = updateMethod
	}

	func fetchData(){
		HTTPManager<[ChuckNorrisCategory]>.send(url: URLBuilder.getCategories(), success: { [weak self ] categories in
			guard self != nil else { return }
				self?.isLoading = falsexw
				self?.categories = categories
		})
	}
}
