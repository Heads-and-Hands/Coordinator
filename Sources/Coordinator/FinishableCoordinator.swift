//
//  File.swift
//  
//
//  Created by basalaev on 25.09.2020.
//

import Foundation

public protocol FinishableCoordinator: AnyObject {
    associatedtype FinishFlow

    var finishFlow: FinishFlow? { get set }
}
