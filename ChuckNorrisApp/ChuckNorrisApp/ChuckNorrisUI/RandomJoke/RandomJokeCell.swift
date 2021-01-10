//
//  RandomJokeCell.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 09/01/21.
//

import UIKit

class RandomJokeCell: UITableViewCell {

	@IBOutlet weak var jokeIconImg: UIImageView!
	@IBOutlet weak var jokeTxtLabel: UILabel!

	var norrisJoke: ChuckNorrisJoke? {
		didSet {
			guard norrisJoke != nil else { return }
			updateCell()
		}
	}

	override func prepareForReuse() {
		super.prepareForReuse()
		jokeTxtLabel.text = nil
		jokeIconImg.image = nil
	}

	func updateCell() {
		guard let joke = norrisJoke?.joke else { return }
		jokeTxtLabel.text = "\(joke)"
		if let iconURLString = norrisJoke?.iconUrl, let iconURL = URL(string: iconURLString) {
			jokeIconImg.setImage(for: iconURL)
		}
	}
}
