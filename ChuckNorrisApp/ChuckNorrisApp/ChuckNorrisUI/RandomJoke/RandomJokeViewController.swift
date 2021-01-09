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

	var jokeCategory: String = "Dev"
	var jokeImgString: String?

	override func viewDidLoad() {
		super.viewDidLoad()

		self.jokeTextLabel.text = "\(jokeCategory)"
	}

}
