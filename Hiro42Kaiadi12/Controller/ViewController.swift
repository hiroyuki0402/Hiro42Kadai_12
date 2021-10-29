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

        customView.taxTextField.text = String(
            UserDefaults.standard.integer(forKey: UserDefaultKey.tax)
        )
    }
}

extension ViewController: InputViewDelegate {
    func didTapCalculationButton() {
        guard let amount = Double(customView.amountTextField.text ?? "") else {return}
        guard let tax = Double(customView.taxTextField.text ?? "") else {return}
        let result = CalculationSource().calculate(amount: Double(amount), tax: Double(tax))
        customView.resultLabel.text = CustomNumberFormatter.floor(number: result)
        UserDefaults.standard.set(Int(tax), forKey: UserDefaultKey.tax)
    }
}
