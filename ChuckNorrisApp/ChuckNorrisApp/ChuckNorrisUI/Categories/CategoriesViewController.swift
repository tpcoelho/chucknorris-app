//
//  CategoriesViewController.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 08/01/21.
//

import UIKit

class CategoriesViewController: UITableViewController {

	private lazy var model: CategoriesViewModel = CategoriesViewModel(updateMethod: {
		self.tableView.reloadData()
	})
	private let reuseLoadingCellId = "LoadingCell"

	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.register(UINib(nibName: reuseLoadingCellId, bundle: nil), forCellReuseIdentifier: reuseLoadingCellId)
	}

	override func viewWillAppear(_ animated: Bool) {
		model.fetchData()
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let categoryStr = sender as? String {
			(segue.destination as? RandomJokeViewController)?.model.selectedCategory = categoryStr
		}
	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			// Section with categories items
			return model.categories.count
		} else if section == 1 {
			// Section for the loading cell
			return 1
		} else {
			return 0
		}
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.section == 0 {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell") as? CategoriesCellController else {
				return UITableViewCell()
			}
			cell.name = model.categories[indexPath.row].name
			return cell
		} else {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell") as? LoadingCellController else {
				return UITableViewCell()
			}
			if model.isLoading {
				cell.loadingIndicator.startAnimating()
			} else {
				cell.stopLoading()
			}
			return cell
		}
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.performSegue(withIdentifier: "openRandomJokeSegue", sender: self.model.categories[indexPath.row].name)

	}
}
