//
//  MainFactory.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import Foundation

enum MainFactory {
	
	static func make() -> MainViewController {
		let model = Model()
		let vm = MainViewModel(model: model)
		let vc = MainViewController(viewModel: vm)
		
		return vc
	}
}
