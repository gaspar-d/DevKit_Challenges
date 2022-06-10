//
//  MainViewController.swift
//  Creatiing a List
//
//  Created by Diogo Gaspar on 04/06/22.
//

import UIKit

class MainViewController: UIViewController {
	
	@IBOutlet weak var mainTableView: UITableView!
	private let viewModel: MainViewModelProtocol
	
	var tableViewDelegate: TableViewDelegate?
	var tableviewDataSource: TableViewDataSource?
	
	init(viewModel: MainViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Table View"
		
		
		setupTableView()
	}
	
	private func setupTableView() {
		self.tableViewDelegate = TableViewDelegate(withDelegate: self)
		self.tableviewDataSource = TableViewDataSource(withData: viewModel.getNames)
		
		self.mainTableView.delegate = self.tableViewDelegate
		self.mainTableView.dataSource = self.tableviewDataSource
		
		
//		mainTableView.delegate = self
//		mainTableView.dataSource = self
		mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}
	
	private func didTapCell(name: String) {
		let messageAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)]
		let messageString = NSAttributedString(string: name, attributes: messageAttributes)
		let alert = UIAlertController(title: "The user name is:", message: "", preferredStyle: .alert)
		alert.setValue(messageString, forKey: "attributedMessage")
		let dismiss = UIAlertAction(title: "dismiss", style: .default)
		alert.addAction(dismiss)
		
		present(alert, animated: true)
	}
}

extension MainViewController: ViewControllerDelegate {
	func selectedCell(item: Int) {
		let name = viewModel.getNames[item]
		didTapCell(name: name)
	}
}
