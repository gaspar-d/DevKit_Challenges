//
//  NumbersViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 19/08/22.
//

import UIKit

protocol NumbersViewModelProtocol: AnyObject {
	func presentModal(with result: Int)
	func limitInputToNumbersOnly(string: String) -> Bool
	func isPrime(_ number: Int) -> Bool
	func isEven(_ number: Int) -> Bool
	func isOdd(_ number: Int) -> Bool
	func isNatural(_ number: Int) -> Bool
}

final class NumbersViewModel: NSObject {
	public weak var coordinator: NumbersCoordinatorProtocol?
}

extension NumbersViewModel: NumbersViewModelProtocol {
	
	public func presentModal(with result: Int) {
		coordinator?.presentModal(with: result)
	}
	
	public func limitInputToNumbersOnly(string: String) -> Bool {
		let allowedCharacters = CharacterSet(charactersIn: "-1234567890").inverted
		let characterSet = CharacterSet(charactersIn: string)
		
		return !allowedCharacters.isSuperset(of: characterSet)
	}
	
	
	public func isPrime(_ number: Int) -> Bool {
		
		guard number >= 2 else {  return false }
		guard number != 2 else { return true  }
		guard number % 2 != 0 else { return false }
		
		if !stride(from: 3, through: Int(sqrt(Double(number))), by: 2).contains(where: { number % $0 == 0 }) {
			return true
			
		} else {
			return false
		}
	}
	
	public func isEven(_ number: Int) -> Bool {
		guard number % 2 == 0 else { return false }
		
		return true
	}
	
	public func isOdd(_ number: Int) -> Bool {
		guard number % 2 != 0 else { return false }
		
		return true
	}
	
	public func isNatural(_ number: Int) -> Bool {
		guard number > 0 else { return false }
		
		return true
	}
}
