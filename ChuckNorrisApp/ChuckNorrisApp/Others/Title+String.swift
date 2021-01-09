//
//  Title+String.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 09/01/21.
//

import Foundation
extension String {
	func localizationTitle() -> String {
		let localizedName = NSLocalizedString(self, comment: "CategoriesCellController")
		return localizedName.prefix(1).capitalized + localizedName.dropFirst()
	}

	mutating func localizationTitle() {
		self = self.localizationTitle()
	}
}
