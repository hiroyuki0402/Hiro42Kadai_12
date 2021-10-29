//
//  CalculationSource.swift
//  Hiro42Kaiadi12
//
//  Created by 白石裕幸 on 2021/10/27.
//

import UIKit

class CalculationSource {
    func calculate(amount: Double, tax: Double) -> Double {
        return amount * (tax / 100.00 + 1.0)
    }
}
