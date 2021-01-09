//
//  URLConstant.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 09/01/21.
//

struct URLBuilder {

	static var BASE_URL = "https://api.chucknorris.io"

	static func getCategories() -> String {
		return "\(BASE_URL)/jokes/categories"
	}

	static func getRandomJoke(for category: String) -> String {
		return "\(BASE_URL)/jokes/random?category=\(category)"
	}

}
