//
//  MainViewModel.swift
//  Creatiing a List
//
//  Created by Diogo Gaspar on 06/06/22.
//

import UIKit

final class MainViewModel: NSObject {
	
	private let model: Model
	var tableView: UITableView?
	
	init(model: Model) {
		self.model = model
	}
	
	public var getNames: [String] {
		model.names
	}
}
