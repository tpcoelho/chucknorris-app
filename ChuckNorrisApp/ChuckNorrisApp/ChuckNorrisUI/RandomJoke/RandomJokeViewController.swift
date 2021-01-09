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

	lazy var model: RandomJokeViewModel = RandomJokeViewModel(updateMethod: self.updateView)

	override func viewWillAppear(_ animated: Bool) {
		self.model.fetchData()
	}

	func updateView(){
		guard let joke = self.model.norrisJoke?.joke else { return }
		self.jokeTextLabel.text = "\(joke)"
	}
}

