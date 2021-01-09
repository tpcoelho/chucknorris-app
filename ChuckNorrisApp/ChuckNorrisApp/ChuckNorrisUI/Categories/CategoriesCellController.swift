//
//  CategoriesCellController.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 08/01/21.
//

import UIKit

class CategoriesCellController: UITableViewCell {

	@IBOutlet weak var categoryName: UILabel!

	var name: String? { didSet {
		guard let name = name else { return }
		guard categoryName != nil else { return }
		categoryName.text = name.localizationTitle()
	}}

	override func prepareForReuse() {
		super.prepareForReuse()
		categoryName.text = nil
	}
}
