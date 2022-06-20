//
//  InputIMCView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import UIKit

final class InputIMCView: UIView {
	
	private let width = UIScreen.main.bounds.width
	
	// MARK: - Weight Container
	private lazy var weightLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Peso"
		label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
		return label
	}()
	
	private lazy var weightNumber: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "82kg"
		label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
		label.textColor = .systemBlue
		return label
	}()
	
	private lazy var weightSlider: UISlider = {
		let slider = UISlider()
		slider.translatesAutoresizingMaskIntoConstraints = false
		slider.center = center
		slider.tintColor = .blue
		slider.minimumValue = 15
		slider.maximumValue = 150
		slider.minimumTrackTintColor = .systemBlue
		slider.maximumTrackTintColor = .purple
		slider.setValue(82, animated: true)
		slider.isContinuous = true
		return slider
	}()
	
	private lazy var weightStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [weightLabel, weightNumber, weightSlider])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.spacing = 20
		stack.distribution = .fillEqually
		stack.alignment = .center
		stack.backgroundColor = .white
		stack.layer.cornerRadius = 10
		stack.layer.shadowColor = UIColor.gray.cgColor
		stack.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		stack.layer.shadowOpacity = 0.3
		stack.layer.shadowRadius = 5
		stack.isLayoutMarginsRelativeArrangement = true
		stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10,
																 leading: 10,
																 bottom: 20,
																 trailing: 10)
		return stack
	}()
	
	// MARK: - Height Container
	private lazy var heightLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Altura"
		label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
		return label
	}()
	
	private lazy var heightNumber: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "155cm"
		label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
		label.textColor = .systemBlue
		return label
	}()
	
	private lazy var heightSlider: UISlider = {
		let slider = UISlider()
		slider.translatesAutoresizingMaskIntoConstraints = false
		slider.center = center
		slider.tintColor = .blue
		slider.minimumValue = 100
		slider.maximumValue = 210
		slider.minimumTrackTintColor = .systemBlue
		slider.maximumTrackTintColor = .purple
		slider.setValue(155, animated: true)
		slider.isContinuous = true
		return slider
	}()
	
	private lazy var heightStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [heightLabel, heightNumber, heightSlider])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.spacing = 20
		stack.distribution = .fillEqually
		stack.alignment = .center
		stack.backgroundColor = .white
		stack.layer.cornerRadius = 10
		stack.layer.shadowColor = UIColor.gray.cgColor
		stack.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		stack.layer.shadowOpacity = 0.3
		stack.layer.shadowRadius = 5
		stack.isLayoutMarginsRelativeArrangement = true
		stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10,
																 leading: 10,
																 bottom: 20,
																 trailing: 10)
		return stack
	}()
	
	private lazy var stackContainer: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [weightStack, heightStack])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .equalSpacing
		stack.spacing = 40
		stack.alignment = .center
		return stack
	}()
	
	// MARK: - Button
	private lazy var calculateButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.background.cornerRadius = 0
		var container = AttributeContainer()
		container.font = UIFont.systemFont(ofSize: 22, weight: .bold)
		configuration.attributedTitle = AttributedString("Calcular", attributes: container)
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
	
	// MARK: - update view methods
	public func updateHeightNumber() {
		self.heightNumber.text = "\(Int(self.heightSlider.value.rounded()))cm"
	}
	
	public func updateWeightNumber() {
		self.weightNumber.text = "\(Int(self.weightSlider.value.rounded()))kg"
	}
	
	public func buttonAction(target: Any?, action: Selector) {
		calculateButton.addTarget(target, action: action, for: .touchUpInside)
	}
	
	public func heightSliderChanged(target: Any?, action: Selector) {
		heightSlider.addTarget(target, action: action, for: .valueChanged)
	}
	
	public func weightSliderChanged(target: Any?, action: Selector) {
		weightSlider.addTarget(target, action: action, for: .valueChanged)
	}
	
	// MARK: - pass data methods
	public var getInputHeight: Float {
		let height = heightSlider.value.rounded()
		return height
	}
	
	public var getInputWeight: Float {
		let weight = weightSlider.value.rounded()
		return weight
	}
}

extension InputIMCView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(stackContainer)
		addSubview(calculateButton)
	}
	
	func setupConstraints() {
		let sliderPadding: CGFloat = 60
		let stackPadding: CGFloat = 30
		
		NSLayoutConstraint.activate([
			
			weightSlider.widthAnchor.constraint(equalToConstant: width - sliderPadding),
			weightStack.widthAnchor.constraint(equalToConstant: width - stackPadding),
			
			heightSlider.widthAnchor.constraint(equalToConstant: width - sliderPadding),
			heightStack.widthAnchor.constraint(equalToConstant: width - stackPadding),
			
			stackContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
			stackContainer.centerYAnchor.constraint(equalTo: centerYAnchor),
			
			calculateButton.heightAnchor.constraint(equalToConstant: 80),
			calculateButton.bottomAnchor.constraint(equalTo: bottomAnchor),
			calculateButton.widthAnchor.constraint(equalToConstant: width),
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .white
	}
}

