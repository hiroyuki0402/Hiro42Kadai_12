//
//  CalculationSource.swift
//  Hiro42Kaiadi12
//
//  Created by 白石裕幸 on 2021/10/27.
//

import UIKit

class CalculationSource {
    private var amount: Double
    private var tax: Double

    ///　イニシャライザ
    /// - Parameters:
    ///   - amount: taxTextFieldで入力した値
    ///   - tax: amountTextFieldで入力した値
    init(amount: Double, tax: Double) {
        self.amount = amount
        self.tax = tax / 100
    }
    /// 計算メソッド
    /// - Returns:  税込金額
    func caluclator() -> Double {
        return (amount * tax) + amount
    }
}
