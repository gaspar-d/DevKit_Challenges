//
//  TableViewDelegate.swift
//  Creatiing_a_List
//
//  Created by Diogo Gaspar on 10/06/22.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
	func selectedCell(item: Int)
}

final class TableViewDelegate: NSObject, UITableViewDelegate {
	
	weak var delegate: ViewControllerDelegate?
	
	init(withDelegate delegate: ViewControllerDelegate) {
		self.delegate = delegate
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.delegate?.selectedCell(item: indexPath.item)
	}
}
