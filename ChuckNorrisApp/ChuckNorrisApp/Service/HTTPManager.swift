//
//  HTTPManager.swift
//  ChuckNorrisApp
//
//  Created by Tiago Coelho on 09/01/21.
//

import Foundation
import Alamofire

class HTTPManager<Model: Decodable> {

	static func send(url: String, success: @escaping (Model) -> Void ){
		AF.request(url, method: .get)
			.responseJSON { (response) in
			switch response.result {
			case .success:
				guard let data = response.data, let model = self.parseModel(with: data) else { return }
				success(model)
			case .failure(let error):
				print("ERRRO, \(error)")
			}
		}
	}

	static func parseModel(with data: Data) -> Model? {
		do{
			let decoder = JSONDecoder()
			let model = try decoder.decode(Model.self, from: data)
			return model
		} catch {
			 print("Error during JSON serialization: \(error)")
			return nil
		}
	}
}
