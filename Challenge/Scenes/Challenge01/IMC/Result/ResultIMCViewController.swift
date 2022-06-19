//
//  ResultIMCViewController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

final class ResultIMCViewController: UIViewController {

	private var customView: ResultIMCView?
	var viewModel: ResultIMCViewModel
	
	init(viewModel: ResultIMCViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupButtonAction()
		setupResult()
	}
	
	private func setupView() {
		customView = ResultIMCView()
		view = customView
		
		title = "Seu IMC"
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	private func setupButtonAction() {
		customView?.closeButtonAction(target: self,
									  action: #selector(didTapCloseButton))
		
		customView?.recalculateButtonAction(target: self,
											action: #selector( didTaRecalculateButton))
	}
	
	@objc private func didTapCloseButton() {
		navigationController?.popToRootViewController(animated: true)
	}
	
	@objc private func didTaRecalculateButton() {
		navigationController?.popViewController(animated: true)
	}
	
	private func setupResult() {
		guard let result = viewModel.getResult else { return }
		customView?.setNumberLabel(result: result)
		print(result, #line)
	}
	
}
