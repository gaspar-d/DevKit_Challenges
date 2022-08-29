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
	private var tableViewDelegate: TableViewDelegate?
	private var tableviewDataSource: TableViewDataSource?
	
	init(viewModel: MainViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = true
		title = "DevKit Challenges"
		
		setupTableView()
	}
	
	private func setupTableView() {
		tableViewDelegate = TableViewDelegate(withDelegate: self)
		tableviewDataSource = TableViewDataSource(withData: viewModel.getNames)
		
		mainTableView.delegate = tableViewDelegate
		mainTableView.dataSource = tableviewDataSource
		
		mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}
	
}

// MARK: - TableViewDelegate
extension MainViewController: ViewControllerDelegate {
	func selectedCell(item: Int) {
		viewModel.didTapCell(index: item)
	}
}
