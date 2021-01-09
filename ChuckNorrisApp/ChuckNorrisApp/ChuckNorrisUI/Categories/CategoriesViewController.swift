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

	override func viewWillAppear(_ animated: Bool) {
		self.model.fetchData()
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
			return self.model.categories.count
		} else if section == 1 {
			// Section for the loading cell
			return 1
		}else {
			return 0
		}
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.section == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell") as! CategoriesCellController
			cell.name = self.model.categories[indexPath.row].name
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesLoadingCell") as! LoadingCellController
			cell.loadingIndicator.startAnimating()
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
