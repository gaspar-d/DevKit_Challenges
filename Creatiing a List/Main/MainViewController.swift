//
//  MainViewController.swift
//  Creatiing a List
//
//  Created by Diogo Gaspar on 04/06/22.
//

import UIKit

class MainViewController: UIViewController {
	
	@IBOutlet weak var mainTableView: UITableView!
	private let viewModel: MainViewModel
	
	init(viewModel: MainViewModel) {
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
		mainTableView.delegate = self
		mainTableView.dataSource = self
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

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
	
	// MARK: - DataSource
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.getNames.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = viewModel.getNames[indexPath.item]
		return cell
	}
	
	// MARK: - Delegate
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let name = viewModel.getNames[indexPath.item]
		didTapCell(name: name)
	}
}
