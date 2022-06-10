//
//  MainViewModel.swift
//  Creatiing a List
//
//  Created by Diogo Gaspar on 06/06/22.
//

import UIKit

protocol MainViewModelProtocol: AnyObject {
	var getNames: [String] { get }
}

final class MainViewModel: NSObject {
	
	private let model: Model
	
	init(model: Model) {
		self.model = model
	}
}

extension MainViewModel: MainViewModelProtocol {
	var getNames: [String] {
		model.names
	}
}
