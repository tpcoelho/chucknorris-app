//
//  ChuckNorrisJoke.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 09/01/21.
//

import Foundation

struct ChuckNorrisJoke: Decodable {

	let categories: [ChuckNorrisCategory]?
	let iconUrl: String?
	let joke: String?
	let url: String?

	enum CodingKeys: String, CodingKey {
		case url, categories
		case joke = "value"
		case iconUrl = "icon_url"
	}
}
