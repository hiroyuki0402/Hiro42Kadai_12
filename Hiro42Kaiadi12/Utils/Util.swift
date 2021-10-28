//
//  Util.swift
//  Hiro42Kaiadi12
//
//  Created by 白石裕幸 on 2021/10/28.
//

import Foundation
class Utils {
    /// Formatterの変更
    /// - Parameter number: 計算した値を設定
    /// - Returns: 小数点以下切り捨て
    class func stringFormatter(number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.roundingMode = .floor
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
}
