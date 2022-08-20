//
//  ModalView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 20/08/22.
//

import UIKit

final class ModalView: UIView {
	
	private lazy var containerView: UIView = {
		let container = UIView()
		container.translatesAutoresizingMaskIntoConstraints = false
		container.backgroundColor = .white
		container.layer.cornerRadius = 16
		
		return container
	}()
	
	private lazy var labelText: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Modalzão"
		
		return label
	}()
	
	private lazy var doubleValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "double"
		
		return label
	}()
	
	private lazy var squareRootValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "squareRoot"
		
		return label
	}()
	
	private lazy var halfValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "half"
		
		return label
	}()
	
	private lazy var monthOrNotValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "month or not"
		
		return label
	}()
	
	private lazy var sumAllValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "sum"
		
		return label
	}()
	
	private lazy var noIdeaValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "no idea"
		
		return label
	}()
	
	private lazy var boggiemanValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "boggie man"
		
		return label
	}()
	
	private lazy var myRandomValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "random phrase"
		
		return label
	}()
	
	private lazy var containerStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [labelText, doubleValueLabel])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.spacing = 20
		
		return stack
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Methods
	
	public func setLabelTEST(with result: Int) {
		doubleValueLabel.text = String(result)
	}
}

extension ModalView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(containerView)
		containerView.addSubview(containerStack)
	}
	
	func setupConstraints() {
		
		NSLayoutConstraint.activate([
			containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
			containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			containerStack.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
			containerStack.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
		])
	}
}
