//
//  TableViewDataSource.swift
//  Creatiing_a_List
//
//  Created by Diogo Gaspar on 10/06/22.
//

import UIKit

final class TableViewDataSource: NSObject, UITableViewDataSource {
	
	private(set) var data: [String] = []
	
	init(withData data: [String]) {
		self.data = data
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.cell, for: indexPath)
		cell.textLabel?.text = data[indexPath.item]
		
		return cell
	}
}
