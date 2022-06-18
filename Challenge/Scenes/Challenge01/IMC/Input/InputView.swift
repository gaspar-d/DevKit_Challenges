//
//  InputView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

final class InputView: UIView {

	private lazy var button: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.title = "Go to next page"
		
		let button = UIButton(configuration: configuration)
		button.translatesAutoresizingMaskIntoConstraints = false
		
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func buttonAction(target: Any?, action: Selector) {
		button.addTarget(target, action: action, for: .touchUpInside)
	}
}

extension InputView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(button)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			button.centerXAnchor.constraint(equalTo: centerXAnchor),
			button.centerYAnchor.constraint(equalTo: centerYAnchor),
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .systemGreen
	}
}
