//
//  ModalViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 20/08/22.
//

import Foundation

protocol ModalViewModelProtocol: AnyObject {
	var result: Int? { get set }
}

final class ModalViewModel: NSObject {
	
//	public weak var coordinator: NumbersCoordinator?
	public var result: Int?
}

extension ModalViewModel: ModalViewModelProtocol {
	
}
