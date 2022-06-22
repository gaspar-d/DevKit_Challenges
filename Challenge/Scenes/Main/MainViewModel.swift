//
//  MainViewModel.swift
//  Creatiing a List
//
//  Created by Diogo Gaspar on 06/06/22.
//

import UIKit

protocol MainViewModelProtocol: AnyObject {
	var getNames: [String] { get }
	func didTapCell(index: Int)
}

final class MainViewModel: NSObject {
	
	public var coordinator: MainCoordinatorProtocol?
	private let model: ChallengesModel
	
	init(model: ChallengesModel) {
		self.model = model
	}
}

extension MainViewModel: MainViewModelProtocol {
	public var getNames: [String] {
		model.names
	}
	
	public func didTapCell(index: Int) {
		coordinator?.navigateTo(sceneIndex: index)
	}
}
