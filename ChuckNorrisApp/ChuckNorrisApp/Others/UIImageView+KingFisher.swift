//
//  UIImageView+KingFisher.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 09/01/21.
//

import UIKit
import Kingfisher

extension UIImageView {

	//questionmark.square.dashed
	//	questionmark.circle

	func setImage(for url: URL) {
		self.kf.indicatorType = .activity
		self.kf.setImage(
			with: url,
			placeholder: UIImage(systemName: "questionmark.square.dashed"),
			options: [
				.scaleFactor(UIScreen.main.scale),
				.transition(.fade(0.5)),
				.cacheOriginalImage
			])
		{
			result in
			switch result {
			case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
				break;
			case .failure(let error):
				print("Job failed: \(error.localizedDescription)")
			}
		}
	}
}
