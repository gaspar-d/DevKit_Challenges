//
//  TableViewDelegate.swift
//  Creatiing_a_List
//
//  Created by Diogo Gaspar on 10/06/22.
//

import UIKit

protocol TableControllerDelegate: AnyObject {
	func didSelectedCell(item: Int)
}

final class TableViewDelegate: NSObject, UITableViewDelegate {
	
	weak var delegate: TableControllerDelegate?
	
	init(withDelegate delegate: TableControllerDelegate) {
		self.delegate = delegate
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.delegate?.didSelectedCell(item: indexPath.item)
	}
}
