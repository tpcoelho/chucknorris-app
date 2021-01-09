//
//  LoadingCellController.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 08/01/21.
//

import UIKit

class LoadingCellController: UITableViewCell {

	@IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

	override func awakeFromNib() {
		 super.awakeFromNib()
		 loadingIndicator.startAnimating()
	 }

	 override func prepareForReuse() {
		 super.prepareForReuse()
		 loadingIndicator.startAnimating()
	 }

	 func stopLoading(){
		 loadingIndicator.hidesWhenStopped = true
		 loadingIndicator.stopAnimating()
	 }
}
