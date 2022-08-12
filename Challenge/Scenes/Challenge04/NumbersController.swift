//
//  NumbersController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 10/08/22.
//

import UIKit

final class NumbersController: UIViewController {

	private var customView: NumbersView?
	private var test: String? {
		didSet {
			test = customView?.getInputedNumber
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		testToPrint()
	}
	
	private func setupView() {
		customView = NumbersView()
		self.view = customView
		
		title = "Números"
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	func testToPrint() {
		customView?.testToPrintInput(target: self, action: #selector(didTapSomething))
	}
	
	@objc func didTapSomething(_ sender: UITextField) {
		
		guard let text = sender.text else { return }
		
		print(#line, text)
		customView?.setIsPrimeLabel(number: text)
	}
	
}

