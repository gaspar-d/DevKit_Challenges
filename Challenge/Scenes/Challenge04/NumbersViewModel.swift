//
//  NumbersViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 19/08/22.
//

import UIKit

protocol NumbersViewModelProtocol: AnyObject {
	func isPrime(_ number: Int) -> Bool
	func isEven(_ number: Int) -> Bool
	func isOdd(_ number: Int) -> Bool
	func isNatural(_ number: Int) -> Bool
}

final class NumbersViewModel: NSObject { }

extension NumbersViewModel: NumbersViewModelProtocol {
	
	public func isPrime(_ number: Int) -> Bool {
		
		guard number >= 2 else { print("não primo"); return false }
		guard number != 2 else { print("primo"); return true  }
		guard number % 2 != 0 else { print("não primo"); return false }
		if !stride(from: 3, through: Int(sqrt(Double(number))), by: 2).contains(where: { number % $0 == 0 }) {
			print("primo")
			return true
		} else {
			print("nào primo")
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
