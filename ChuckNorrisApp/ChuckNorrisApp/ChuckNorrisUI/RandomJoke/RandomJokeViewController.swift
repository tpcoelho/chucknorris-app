//
//  RandomJokeViewController.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 08/01/21.
//

import UIKit

class RandomJokeViewController: UIViewController {

	@IBOutlet weak var navItem: UINavigationItem!
	@IBOutlet weak var randomJokeTableView: UITableView!

	lazy var model: RandomJokeViewModel = RandomJokeViewModel(updateMethod: {
		self.randomJokeTableView.reloadData()
	}, refreshEnd: {
		self.randomJokeTableView.refreshControl?.endRefreshing()
	})

	private let reuseLoadingCellId = "LoadingCell"

	override func viewDidLoad() {
		super.viewDidLoad()
		randomJokeTableView.dataSource = self
		randomJokeTableView.delegate = self

		randomJokeTableView.register(UINib(nibName: reuseLoadingCellId, bundle: nil), forCellReuseIdentifier: reuseLoadingCellId)

		randomJokeTableView.refreshControl = UIRefreshControl()
		randomJokeTableView.refreshControl!.addTarget(self, action: #selector(self.refreshData), for: UIControl.Event.valueChanged)
	}

	override func viewWillAppear(_ animated: Bool) {
		navItem.title = model.selectedCategory.localizationTitle()
		model.fetchData()
	}

	@objc private func refreshData() {
		self.model.fetchData()
	}
}

extension RandomJokeViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if model.isLoading {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseLoadingCellId) as? LoadingCellController else {
				return UITableViewCell()
			}
			return cell
		} else {
			 // Section for the loading cell
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "RandomJokeCell") as? RandomJokeCell else {
				return UITableViewCell()
			}
			cell.norrisJoke = model.norrisJoke
			cell.updateCell()
			return cell
		}
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if model.isLoading {
			return 80
		} else {
			return UITableView.automaticDimension
		}
	}
}
