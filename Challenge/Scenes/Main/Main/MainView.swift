//
//  MainView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 26/08/22.
//

import UIKit

enum CellIdentifier {
	static let cell = "reusableCellIdentifier"
}

protocol MainViewProtocol: AnyObject {
	func setTableViewProtocols(withDelegate delegate: UITableViewDelegate,
							   withDataSource dataSource: UITableViewDataSource)
}

final class MainView: UIView {
	
	private lazy var mainTableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.cell)
		
		return tableView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("Storyboard not founded")
	}
}

extension MainView: MainViewProtocol {
	
	public func setTableViewProtocols(withDelegate delegate: UITableViewDelegate,
									  withDataSource dataSource: UITableViewDataSource) {
		
		self.mainTableView.delegate = delegate
		self.mainTableView.dataSource = dataSource
	}
}

// MARK: - Constraints

extension MainView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(mainTableView)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			mainTableView.topAnchor.constraint(equalTo: topAnchor),
			mainTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
			mainTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
			mainTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
		])
	}
}
