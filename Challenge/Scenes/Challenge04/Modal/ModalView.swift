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
		container.backgroundColor = .systemBackground
		container.layer.cornerRadius = 16
		
		return container
	}()
	
	private lazy var resultLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "double"
		label.numberOfLines = 0
		
		return label
	}()
	
	private lazy var containerStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [
												   resultLabel,
												  ])
		
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.alignment = .center
		stack.distribution = .equalSpacing
		stack.spacing = 20
		stack.backgroundColor = .systemBackground
		stack.layer.cornerRadius = 16
		stack.isLayoutMarginsRelativeArrangement = true
		stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0,
																 leading: 20,
																 bottom: 0,
																 trailing: 20)
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
	
	public func setResultLabel(with result: String, index: Int) {
		let safeResult = String(result)
//		let randomElement = Int.random(in: 1...7)
		
		resultLabel.text = safeResult
		
//		if safeResult == "" {
//			selectLabelToAppear(element: randomElement)
//		}
//
//		selectLabelToAppear(element: randomElement)
	}
	
	
	
//	private func selectLabelToAppear(element: Int) {
//		switch element {
//		case 1:
//			resultLabel.isHidden = false
//		case 2:
//			squareRootValueLabel.isHidden = false
//		case 3:
//			halfValueLabel.isHidden = false
//		case 4:
//			monthOrNotValueLabel.isHidden = false
//		case 5:
//			sumAllValueLabel.isHidden = false
//		case 6:
//			noIdeaValueLabel.isHidden = false
//		case 7:
//			boogeymanValueLabel.isHidden = false
//		default:
//			print(#line, "ERROR: Element not found", #file)
//		}
//	}
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
			
			containerStack.topAnchor.constraint(equalTo: containerView.topAnchor),
			containerStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
			containerStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
			containerStack.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor),
		])
	}
}
