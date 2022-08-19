//
//  NumbersViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 19/08/22.
//

import Foundation

protocol NumbersViewModelProtocol: AnyObject {
	func isPrime(_ number: Int) -> Bool
}

final class NumbersViewModel: NSObject { }

extension NumbersViewModel: NumbersViewModelProtocol {
	
	public func isPrime(_ number: Int) -> Bool {
		
		guard number >= 2     else { print("não primo"); return false }
		guard number != 2     else { print("primo"); return true  }
		guard number % 2 != 0 else { print("não primo"); return false }
		if !stride(from: 3, through: Int(sqrt(Double(number))), by: 2).contains(where: { number % $0 == 0 }) {
			print("primo")
			return true
		} else {
			print("nào primo")
			return false
		}
		
	}
}
