//
//  ChuckNorrisCategory.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 09/01/21.
//

import Foundation

struct ChuckNorrisCategory {
	let name: String?
}

extension ChuckNorrisCategory: Decodable {
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let name: String = try container.decode(String.self)
		self.init(name: name)
	}
}
