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
    ///   - amount: 金額の設定
    ///   - tax: 税率の設定
    init(amount: Double, tax: Double) {
        self.amount = amount
        self.tax = tax / 100.00 + 1.0
    }
    /// 計算メソッド
    /// - Returns:  税込金額
    func caluclator() -> Double {
        return amount * tax
    }
}
