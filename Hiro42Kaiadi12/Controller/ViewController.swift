//
//  ViewController.swift
//  Hiro42Kaiadi12
//
//  Created by 白石裕幸 on 2021/10/27.
//

import UIKit

private enum UserDefaultKey {
    static let tax = "tax"
}

class ViewController: UIViewController {
    @IBOutlet private weak var customView: InputView!

    override func viewDidLoad() {
        super.viewDidLoad()

        customView.delegate = self

        customView.tax = Double(
            UserDefaults.standard.integer(
                forKey: UserDefaultKey.tax
            )
        )
    }
}

extension ViewController: InputViewDelegate {
    func didTapCalculationButton() {
        guard let amount = customView.amount else {return}
        guard let tax = customView.tax else {return}
        let result = CalculationSource().calculate(amount: Double(amount), tax: Double(tax))
        customView.result = CustomNumberFormatter.floor(number: result)
        UserDefaults.standard.set(Int(tax), forKey: UserDefaultKey.tax)
    }
}
