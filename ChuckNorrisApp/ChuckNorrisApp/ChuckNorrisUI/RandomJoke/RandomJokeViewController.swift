//
//  RandomJokeViewController.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 08/01/21.
//

import UIKit

class RandomJokeViewController: UIViewController {

	@IBOutlet weak var jokeTextLabel: UILabel!
	@IBOutlet weak var jokeImg: UIImageView!
	@IBOutlet weak var navItem: UINavigationItem!

	lazy var model: RandomJokeViewModel = RandomJokeViewModel(updateMethod: updateView)

	override func viewWillAppear(_ animated: Bool) {
		navItem.title = model.selectedCategory.localizationTitle()
		model.fetchData()
	}

	func updateView(){
		guard let joke = model.norrisJoke?.joke else { return }
		jokeTextLabel.text = "\(joke)"
		if let iconURLString = model.norrisJoke?.iconUrl, let iconURL = URL(string: iconURLString) {
			jokeImg.setImage(for: iconURL)
		}

	}
}

