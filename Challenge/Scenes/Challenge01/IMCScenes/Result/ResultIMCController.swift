//
//  ResultIMCController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

final class ResultIMCController: UIViewController {
	
	private var customView: ResultIMCViewProtocol
	public var viewModel: ResultIMCViewModelProtocol
	
	init(customView: ResultIMCViewProtocol,
		 viewModel: ResultIMCViewModelProtocol)
	{
		self.customView = customView
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
		setupResultData()
		setupNavigationBar()
	}
	
	private func setupView() {
		view = customView as? UIView
	}
	
	private func setupNavigationBar() {
		title = "Seu IMC"
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationItem.setHidesBackButton(true, animated: true)
	}
	
	private func setupButtonAction() {
		customView.closeButtonAction(target: self,
									  action: #selector(didTapCloseButton))
		
		customView.recalculateButtonAction(target: self,
											action: #selector( didTaRecalculateButton))
	}
	
	@objc private func didTapCloseButton() {
		navigationController?.popToRootViewController(animated: true)
	}
	
	@objc private func didTaRecalculateButton() {
		navigationController?.popViewController(animated: true)
	}
	
	private func setupResultData() {
		guard let color = viewModel.color,
			  let image = viewModel.image,
			  let result = viewModel.getResult,
			  let text = viewModel.classification
		else { return }
		
		customView.setImage(image: image, color: color)
		customView.setNumberResult(result: result)
		customView.setClassificationResult(with: text, and: color)
	}
}
