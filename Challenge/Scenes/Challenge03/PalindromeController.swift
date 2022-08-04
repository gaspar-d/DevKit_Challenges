//
//  PalindromeController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 03/08/22.
//

import UIKit

final class PalindromeController: UIViewController {

	private var customView: PalindromeView?

	init() {
		super.init(nibName: nil, bundle: nil)

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
	}
	
	private func setupView() {
		customView = PalindromeView()
		self.view = customView
		
		title = "PALINDROMO"
		navigationController?.navigationBar.prefersLargeTitles = true
	}
}
